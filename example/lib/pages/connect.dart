import 'dart:async';

import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:livekit_example/control_room_api/api.swagger.dart';
import 'package:livekit_example/control_room_api/control_room_api.dart';
import 'package:livekit_example/pages/room.dart';
import 'package:livekit_example/exts.dart';

import '../models/sip_signalling.pb.dart';

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

  final _username = TextEditingController(text: 'n.plaksin');
  final _password = TextEditingController(text: '!QAZxsw2');
  final _domain = TextEditingController(text: '192.168.92.43');
  final _hash = TextEditingController(text: '');

  bool _busy = false;

  bool _passwordHidden = true;

  bool pressedEnter = false;

  @override
  void initState() {
    super.initState();

    if (lkPlatformIsMobile()) {
      LiveKitClient.initialize(bypassVoiceProcessing: true);
    }

    _password.addListener(() {
      pressedEnter = false;
    });
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _domain.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
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

      var registerResultStream = StreamController<SipControlResponse>();

      listener.on<DataReceivedEvent>((event) {
        if (event.topic == 'sip-control') {
          var response = SipControlResponse.fromBuffer(event.data);
          if (response.commandId == 'register') {
            registerResultStream.add(response);
          }
        }
      });

      var controlRoom = await _createSipControlRoom();

      await room.prepareConnection(
          controlRoom.livekitUrl, controlRoom.accessToken);

      // Try to connect to the room without publuishing ANY tracks
      // This will throw an Exception if it fails for any reason.
      await room.connect(
        controlRoom.livekitUrl,
        controlRoom.accessToken,
      );

      SipRegister sipRegisterRequest;
      if (_hash.text.isNotEmpty) {
        sipRegisterRequest = SipRegister(
          hash: _hash.text,
        );
      } else {
        sipRegisterRequest = SipRegister(
          password: _password.text,
        );
      }

      final command = SipControlCommand(
          register: sipRegisterRequest, commandId: 'register');
      final buffer = command.writeToBuffer();
      final participant = room.localParticipant;

      var registerResultFuture = registerResultStream.stream.first;
      await participant?.publishData(
        buffer,
        reliable: true,
        topic: 'sip-control',
      );

      var registerResult = await registerResultFuture;

      if (registerResult.hasRegisterResult()) {
        var result = registerResult.registerResult;
        if (result.code == 200) {
          // navigate to room UI
          await Navigator.push<void>(
            context,
            MaterialPageRoute(builder: (_) => RoomPage(room, listener)),
          );
        } else {
          await context.showErrorDialog(
              'Cannot register: sip code ${result.code}, message ${result.message}');
        }
      } else {
        await context.showErrorDialog(
            'Cannot register, internal error: ${registerResult.error}');
      }
    } catch (error) {
      print('Could not connect $error');
      await context.showErrorDialog(error);
    } finally {
      setState(() {
        _busy = false;
      });
    }
  }

  Future<ControlRoomResponse> _createSipControlRoom() async {
    try {
      return (await sipControlRoomApi.apiV1RoomsControlPost(
              body: ControlRoomCreate(
        username: _username.text,
        domain: _domain.text,
      )))
          .bodyOrThrow;
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
                    _buildInput(controller: _hash, hint: 'Хеш'),
                    const SizedBox(height: 24),
                    const SizedBox(height: 40),

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
}
