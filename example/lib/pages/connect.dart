import 'dart:async';

import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:livekit_example/pages/room.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:livekit_example/exts.dart';

import '../config.dart';

class ConnectPage extends StatefulWidget {
  //
  const ConnectPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  final formKey = GlobalKey<FormState>();

  final _username = TextEditingController();
  final _password = TextEditingController();
  final _domain = TextEditingController();

  bool _busy = false;

  bool _passwordHidden = true;

  bool pressedEnter = false;

  List<MediaDevice> _audioInputs = [];
  List<MediaDevice> _videoInputs = [];
  StreamSubscription? _subscription;

  bool _enableVideo = false;
  bool _enableAudio = true;
  LocalAudioTrack? _audioTrack;
  LocalVideoTrack? _videoTrack;

  MediaDevice? _selectedVideoDevice;
  MediaDevice? _selectedAudioDevice;
  VideoParameters _selectedVideoParameters = VideoParametersPresets.h720_169;

  @override
  void initState() {
    super.initState();

    if (lkPlatformIsMobile()) {
      LiveKitClient.initialize(bypassVoiceProcessing: true);
    }

    _password.addListener(() {
      pressedEnter = false;
    });

    _checkPermissions();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _domain.dispose();
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> _checkPermissions() async {
    // 1. Request the two permissions together
    final statuses = await [
      Permission.microphone,
    ].request();

    // 2. If at least one is permanently denied, just bail out early
    if (statuses.values.any((s) => s.isPermanentlyDenied)) {
      debugPrint('Mic/Camera permission permanently denied');
      return;
    }

    // 3. Once the dialog closes, permissions have been resolved – now refresh
    final devices = await Hardware.instance.enumerateDevices();
    if (mounted) _loadDevices(devices); // <- re-populates the dropdowns
  }

  @override
  void deactivate() {
    _subscription?.cancel();
    super.deactivate();
  }

  void _loadDevices(List<MediaDevice> devices) async {
    _audioInputs = devices.where((d) => d.kind == 'audioinput').toList();

    if (_audioInputs.isNotEmpty) {
      if (_selectedAudioDevice == null) {
        _selectedAudioDevice = _audioInputs.first;
        Future.delayed(const Duration(milliseconds: 100), () async {
          await _changeLocalAudioTrack();
          setState(() {});
        });
      }
    }

    if (_videoInputs.isNotEmpty) {
      if (_selectedVideoDevice == null) {
        _selectedVideoDevice = _videoInputs.first;
        Future.delayed(const Duration(milliseconds: 100), () async {
          await _changeLocalVideoTrack();
          setState(() {});
        });
      }
    }
    setState(() {});
  }

  Future<void> _setEnableVideo(value) async {
    _enableVideo = value;
    if (!_enableVideo) {
      await _videoTrack?.stop();
      _videoTrack = null;
    } else {
      await _changeLocalVideoTrack();
    }
    setState(() {});
  }

  Future<void> _setEnableAudio(value) async {
    _enableAudio = value;
    if (!_enableAudio) {
      await _audioTrack?.stop();
      _audioTrack = null;
    } else {
      await _changeLocalAudioTrack();
    }
    setState(() {});
  }

  Future<void> _changeLocalAudioTrack() async {
    if (_audioTrack != null) {
      await _audioTrack!.stop();
      _audioTrack = null;
    }

    if (_selectedAudioDevice != null) {
      _audioTrack = await LocalAudioTrack.create(AudioCaptureOptions(
        deviceId: _selectedAudioDevice!.deviceId,
      ));
      await _audioTrack!.start();
    }
  }

  Future<void> _changeLocalVideoTrack() async {
    if (_videoTrack != null) {
      await _videoTrack!.stop();
      _videoTrack = null;
    }

    if (_selectedVideoDevice != null) {
      _videoTrack =
          await LocalVideoTrack.createCameraTrack(CameraCaptureOptions(
        deviceId: _selectedVideoDevice!.deviceId,
        params: _selectedVideoParameters,
      ));
      await _videoTrack!.start();
    }
  }

  _join(BuildContext context) async {
    _busy = true;

    setState(() {});

    try {
      //create new room
      var cameraEncoding = const VideoEncoding(
        maxBitrate: 5 * 1000 * 1000,
        maxFramerate: 30,
      );

      var screenEncoding = const VideoEncoding(
        maxBitrate: 3 * 1000 * 1000,
        maxFramerate: 15,
      );

      final room = Room(
        roomOptions: RoomOptions(
          adaptiveStream: false,
          dynacast: false,
          defaultAudioPublishOptions: const AudioPublishOptions(
            name: 'custom_audio_track_name',
          ),
          defaultCameraCaptureOptions: const CameraCaptureOptions(
              maxFrameRate: 30,
              params: VideoParameters(
                dimensions: VideoDimensions(1280, 720),
              )),
          defaultScreenShareCaptureOptions: const ScreenShareCaptureOptions(
              useiOSBroadcastExtension: true,
              params: VideoParameters(
                dimensions: VideoDimensionsPresets.h1080_169,
              )),
          defaultVideoPublishOptions: VideoPublishOptions(
            name: 'custom_video_track_name',
            simulcast: false,
            videoCodec: 'H264',
            backupVideoCodec: const BackupVideoCodec(
              enabled: false,
            ),
            videoEncoding: cameraEncoding,
            screenShareEncoding: screenEncoding,
          ),
        ),
      );
      // Create a Listener before connecting
      final listener = room.createListener();
      final token = (await _generateToken())['token'];

      await room.prepareConnection(livekitServer, token);

      // Try to connect to the room
      // This will throw an Exception if it fails for any reason.
      await room.connect(
        livekitServer,
        token,
        fastConnectOptions: FastConnectOptions(
          microphone: TrackOption(track: _audioTrack),
          camera: TrackOption(track: _videoTrack),
        ),
      );

      await Navigator.push<void>(
        context,
        MaterialPageRoute(builder: (_) => RoomPage(room, listener)),
      );
    } catch (error) {
      print('Could not connect $error');
      await context.showErrorDialog(error);
    } finally {
      setState(() {
        _busy = false;
      });
    }
  }

  Future<Map<String, dynamic>> _generateToken() async {
    try {
      var request = livekitServerSdk
          .replace(path: '/server_sdk/generate_token', queryParameters: {
        'username': _username.text,
        'password': _password.text,
        'domain': _domain.text,
      });

      final response = await http.get(request);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to generate token: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to generate token: $e');
    }
  }

  // ───────────────────────────────── UI  ONLY  CHANGES  BELOW ──────────────────────────────────

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ── TITLE ────────────────────────────────────────────────
                    Text(
                      'Авторизация',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                    const SizedBox(height: 56),

                    // ── DOMAIN / LOGIN / PASSWORD ───────────────────────────
                    _buildInput(controller: _domain, hint: 'Домен'),
                    const SizedBox(height: 24),
                    _buildInput(controller: _username, hint: 'Логин'),
                    const SizedBox(height: 24),
                    _buildInput(
                      controller: _password,
                      hint: 'Пароль',
                      obscure: _passwordHidden,
                      suffix: IconButton(
                        splashRadius: 20,
                        icon: Icon(
                          _passwordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xFF9C9C9C),
                        ),
                        onPressed: () =>
                            setState(() => _passwordHidden = !_passwordHidden),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // ── CAMERA PREVIEW ──────────────────────────────────────
                    if (_enableVideo)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          height: 240,
                          color: Colors.black54,
                          alignment: Alignment.center,
                          child: _videoTrack != null
                              ? VideoTrackRenderer(
                                  _videoTrack!,
                                  fit: RTCVideoViewObjectFit
                                      .RTCVideoViewObjectFitContain,
                                )
                              : const Icon(Icons.videocam_off,
                                  color: Color(0xFF2FA5F9), size: 60),
                        ),
                      ),
                    if (_enableVideo) const SizedBox(height: 24),

                    // ── CAMERA SWITCH & DROPS ───────────────────────────────
                    if (_enableVideo)
                      _buildSwitchRow(
                        label: 'Камера',
                        value: _enableVideo,
                        onChanged: _setEnableVideo,
                      ),
                    if (_enableVideo) const SizedBox(height: 16),
                    if (_enableVideo)
                      _buildDropdown<MediaDevice>(
                        value: _selectedVideoDevice,
                        hint: 'Выберите камеру',
                        items: _videoInputs
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.label),
                                ))
                            .toList(),
                        onChanged: (d) async {
                          _selectedVideoDevice = d;
                          await _changeLocalVideoTrack();
                          setState(() {});
                        },
                      ),
                    if (_enableVideo) const SizedBox(height: 16),
                    if (_enableVideo)
                      _buildDropdown<VideoParameters>(
                        value: _selectedVideoParameters,
                        hint: 'Разрешение видео',
                        items: [
                          VideoParametersPresets.h480_43,
                          VideoParametersPresets.h540_169,
                          VideoParametersPresets.h720_169,
                          VideoParametersPresets.h1080_169,
                        ]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                      '${e.dimensions.width}×${e.dimensions.height}'),
                                ))
                            .toList(),
                        onChanged: (p) async {
                          _selectedVideoParameters = p!;
                          await _changeLocalVideoTrack();
                          setState(() {});
                        },
                      ),
                    if (_enableVideo) const SizedBox(height: 24),

                    // ── MIC SWITCH & DROPS ─────────────────────────────────
                    // if (_enableAudio)
                    //   _buildSwitchRow(
                    //     label: 'Микрофон',
                    //     value: _enableAudio,
                    //     onChanged: _setEnableAudio,
                    //   ),
                    // if (_enableAudio) const SizedBox(height: 16),
                    if (_enableAudio)
                      _buildDropdown<MediaDevice>(
                        value: _selectedAudioDevice,
                        hint: 'Выберите микрофон',
                        items: _audioInputs
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.label),
                                ))
                            .toList(),
                        onChanged: (d) async {
                          _selectedAudioDevice = d;
                          await _changeLocalAudioTrack();
                          setState(() {});
                        },
                      ),
                    if (_enableAudio) const SizedBox(height: 56),

                    // ── JOIN BUTTON ────────────────────────────────────────
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _busy ? null : () => _join(context),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFF2FA5F9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: _busy
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ),
                              )
                            : const Text(
                                'Войти',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ));

  // ──────────────────────────────  NO-LOGIC HELPER  ─────────────────────────────

  Widget _buildInput({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    Widget? suffix,
  }) =>
      TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          suffixIcon: suffix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xFFDFDFDF)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xFFDFDFDF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xFF2FA5F9)),
          ),
        ),
      );

  // Creates the white, rounded 56-px-high frame used for every input control.
  Widget _fieldFrame({required Widget child}) => Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xFFDFDFDF)),
        ),
        child: child,
      );

// Uniform dropdown that looks like a TextField.
  Widget _buildDropdown<T>({
    required T? value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
    String? hint,
  }) =>
      _fieldFrame(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            value: value,
            items: items,
            hint: hint != null ? Text(hint) : null,
            onChanged: onChanged,
            buttonStyleData: const ButtonStyleData(
                height: double.infinity, width: double.infinity),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(height: 40),
          ),
        ),
      );

// Label + switch row aligned to the field-edges.
  Widget _buildSwitchRow({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Switch(
            value: value,
            activeColor: const Color(0xFF2FA5F9),
            onChanged: onChanged,
          ),
        ],
      );
}
