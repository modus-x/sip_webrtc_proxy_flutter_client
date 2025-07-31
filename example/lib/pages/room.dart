import 'dart:async';
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:livekit_example/config.dart';
import 'package:livekit_example/method_channels/replay_kit_channel.dart';

import '../exts.dart';
import '../utils.dart';
import '../widgets/controls.dart';
import '../widgets/participant.dart';
import '../widgets/participant_info.dart';

import 'package:http/http.dart' as http;

class RoomPage extends StatefulWidget {
  final Room room;
  final EventsListener<RoomEvent> listener;

  const RoomPage(
    this.room,
    this.listener, {
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  List<ParticipantTrack> remotePatricipantTracks = [];
  ParticipantTrack? localPatricipantTrack;

  EventsListener<RoomEvent> get _listener => widget.listener;
  bool get fastConnection => widget.room.engine.fastConnectOptions != null;
  bool _flagStartedReplayKit = false;

  final _number = TextEditingController();

  @override
  void initState() {
    super.initState();
    // add callback for a `RoomEvent` as opposed to a `ParticipantEvent`
    widget.room.addListener(_onRoomDidUpdate);
    // add callbacks for finer grained events
    _setUpListeners();
    _sortParticipants();
    WidgetsBindingCompatible.instance?.addPostFrameCallback((_) {
      if (!fastConnection) {
        _askPublish();
      }
    });

    if (lkPlatformIs(PlatformType.android)) {
      Hardware.instance.setSpeakerphoneOn(true);
    }

    if (lkPlatformIs(PlatformType.iOS)) {
      ReplayKitChannel.listenMethodChannel(widget.room);
    }

    if (lkPlatformIsDesktop()) {
      onWindowShouldClose = () async {
        unawaited(widget.room.disconnect());
        await _listener.waitFor<RoomDisconnectedEvent>(
            duration: const Duration(seconds: 5));
      };
    }
  }

  @override
  void dispose() {
    // always dispose listener
    (() async {
      if (lkPlatformIs(PlatformType.iOS)) {
        ReplayKitChannel.closeReplayKit();
      }
      widget.room.removeListener(_onRoomDidUpdate);
      await _listener.dispose();
      await widget.room.dispose();
    })();
    onWindowShouldClose = null;
    super.dispose();
  }

  /// for more information, see [event types](https://docs.livekit.io/client/events/#events)
  void _setUpListeners() => _listener
    ..on<RoomDisconnectedEvent>((event) async {
      if (event.reason != null) {
        print('Room disconnected: reason => ${event.reason}');
      }
      WidgetsBindingCompatible.instance?.addPostFrameCallback(
          (timeStamp) => Navigator.popUntil(context, (route) => route.isFirst));
    })
    ..on<ParticipantEvent>((event) {
      // sort participants on many track events as noted in documentation linked above
      _sortParticipants();
    })
    ..on<ParticipantInfoUpdatedEvent>((event) {
      var attributes2 = event.info.attributes;
      if (attributes2.containsKey('registerCode') &&
          attributes2['registerCode'] != '200') {
        print('ParticipantInfoUpdatedEvent attributes: ${attributes2}');
        context.showErrorDialog(
            'Ошибка при SIP регистрации! Попробуйте ввести другие данные',
            onPressed: () {
          widget.room.disconnect();
        });
      } else {}
    })
    ..on<RoomRecordingStatusChanged>((event) {
      context.showRecordingStatusChangedDialog(event.activeRecording);
    })
    ..on<RoomAttemptReconnectEvent>((event) {
      print(
          'Attempting to reconnect ${event.attempt}/${event.maxAttemptsRetry}, '
          '(${event.nextRetryDelaysInMs}ms delay until next attempt)');
    })
    ..on<LocalTrackSubscribedEvent>((event) {

    })
    ..on<LocalTrackPublishedEvent>((_) {
      _sortParticipants();
    })
    ..on<LocalTrackUnpublishedEvent>((_) {
      _sortParticipants();
    })
    ..on<TrackSubscribedEvent>((_) {
      _sortParticipants();
      Hardware.instance.enumerateDevices().then((devices) async {

        await widget.room.localParticipant?.setMicrophoneEnabled(false);
        await widget.room.localParticipant?.setMicrophoneEnabled(true);

        List<MediaDevice>? audioInputs;
        List<MediaDevice>? audioOutputs;

        audioInputs = devices.where((d) => d.kind == 'audioinput').toList();
        audioOutputs = devices.where((d) => d.kind == 'audiooutput').toList();

        var audioInput = audioInputs.firstWhereOrNull((device) {
          return device.deviceId == widget.room.selectedAudioInputDeviceId;
        });

        if (audioInput != null) {
          widget.room.setAudioInputDevice(audioInput);
        }

        var audioOutput = audioOutputs.firstWhereOrNull((device) {
          return device.deviceId == widget.room.selectedAudioOutputDeviceId;
        });

        if (audioOutput != null) {
          widget.room.setAudioOutputDevice(audioOutput);
        }
      });
    })
    ..on<TrackUnsubscribedEvent>((_) => _sortParticipants())
    ..on<TrackE2EEStateEvent>(_onE2EEStateEvent)
    ..on<ParticipantNameUpdatedEvent>((event) {
      print(
          'Participant name updated: ${event.participant.identity}, name => ${event.name}');
      _sortParticipants();
    })
    ..on<ParticipantMetadataUpdatedEvent>((event) {
      print(
          'Participant metadata updated: ${event.participant.identity}, metadata => ${event.metadata}');
    })
    ..on<RoomMetadataChangedEvent>((event) {
      print('Room metadata changed: ${event.metadata}');
    })
    ..on<DataReceivedEvent>((event) {
      String decoded = 'Failed to decode';
      try {
        decoded = utf8.decode(event.data);
      } catch (err) {
        print('Failed to decode: $err');
      }
      context.showDataReceivedDialog(decoded);
    })
    ..on<AudioPlaybackStatusChanged>((event) async {
      if (!widget.room.canPlaybackAudio) {
        print('Audio playback failed for iOS Safari ..........');
        bool? yesno = await context.showPlayAudioManuallyDialog();
        if (yesno == true) {
          await widget.room.startAudio();
        }
      }
    });

  void _askPublish() async {
    final result = await context.showPublishDialog();
    if (result != true) return;
    // video will fail when running in ios simulator
    try {
      await widget.room.localParticipant?.setCameraEnabled(true);
    } catch (error) {
      print('could not publish video: $error');
      await context.showErrorDialog(error);
    }
    try {
      await widget.room.localParticipant?.setMicrophoneEnabled(true);
    } catch (error) {
      print('could not publish audio: $error');
      await context.showErrorDialog(error);
    }
  }

  void _onRoomDidUpdate() {
    _sortParticipants();
  }

  void _onE2EEStateEvent(TrackE2EEStateEvent e2eeState) {
    print('e2ee state: $e2eeState');
  }

  void _sortParticipants() {
    List<ParticipantTrack> remoteMediaTracks = [];
    List<ParticipantTrack> screenTracks = [];

    for (var participant in widget.room.remoteParticipants.values) {
      if (participant.kind != ParticipantKind.AGENT) {
        remoteMediaTracks.add(ParticipantTrack(participant: participant));
      }
    }
    // sort speakers for the grid
    remoteMediaTracks.sort((a, b) {
      // loudest speaker first
      if (a.participant.isSpeaking && b.participant.isSpeaking) {
        if (a.participant.audioLevel > b.participant.audioLevel) {
          return -1;
        } else {
          return 1;
        }
      }

      // last spoken at
      final aSpokeAt = a.participant.lastSpokeAt?.millisecondsSinceEpoch ?? 0;
      final bSpokeAt = b.participant.lastSpokeAt?.millisecondsSinceEpoch ?? 0;

      if (aSpokeAt != bSpokeAt) {
        return aSpokeAt > bSpokeAt ? -1 : 1;
      }

      // video on
      if (a.participant.hasVideo != b.participant.hasVideo) {
        return a.participant.hasVideo ? -1 : 1;
      }

      // joinedAt
      return a.participant.joinedAt.millisecondsSinceEpoch -
          b.participant.joinedAt.millisecondsSinceEpoch;
    });

    setState(() {
      remotePatricipantTracks = remoteMediaTracks;
    });

    final localParticipantTracks =
        widget.room.localParticipant?.videoTrackPublications;
    if (localParticipantTracks != null) {
      for (var t in localParticipantTracks) {
        if (t.isScreenShare) {
          if (lkPlatformIs(PlatformType.iOS)) {
            if (!_flagStartedReplayKit) {
              _flagStartedReplayKit = true;

              ReplayKitChannel.startReplayKit();
            }
          }
          screenTracks.add(ParticipantTrack(
            participant: widget.room.localParticipant!,
            type: ParticipantTrackType.kScreenShare,
          ));
        } else {
          if (lkPlatformIs(PlatformType.iOS)) {
            if (_flagStartedReplayKit) {
              _flagStartedReplayKit = false;

              ReplayKitChannel.closeReplayKit();
            }
          }

          setState(() {
            localPatricipantTrack =
                ParticipantTrack(participant: widget.room.localParticipant!);
          });
          break;
        }
      }
    }
  }

  Future<Map<String, dynamic>> _call() async {
    try {
      var name = widget.room.localParticipant?.attributes['sip_username'];
      if (name != null) {
        var request = livekitServerSdk.replace(
            path: '/server_sdk/make_call',
            queryParameters: {'number': _number.text, 'username': name});
        final response = await http.get(request);

        if (response.statusCode == 200) {
          return json.decode(response.body);
        } else {
          throw Exception('Failed to generate token: ${response.body}');
        }
      }
      throw Exception('no sip username...');
    } catch (e) {
      throw Exception('Failed to generate token: $e');
    }
  }

  void _onTapDisconnect() async {
    final result = await context.showDisconnectDialog();
    if (result == true) await widget.room.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    final localName = widget.room.localParticipant?.name ?? '';

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480, maxHeight: 640),
          child: Card(
            color: Colors.white,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── HEADER ──────────────────────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localName,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.logout),
                        splashRadius: 20,
                        onPressed: _onTapDisconnect, // existing logic
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // ── REMOTE VIDEO or PLACEHOLDER ───────────────────────
                  Expanded(
                    child: remotePatricipantTracks.isNotEmpty
                        ? FittedBox(
                            child: ParticipantWidget.widgetFor(
                              remotePatricipantTracks.first,
                              showStatsLayer: false,
                              answer: (sip) {
                                Map<String, String> cur = {
                                  'sip_action': 'answer'
                                };
                                widget.room.localParticipant
                                    ?.setAttributes(cur);
                                widget.room.localParticipant
                                    ?.setAttributes({'sip_action': ''});
                              },
                              hangup: (sip) {
                                Map<String, String> cur = {
                                  'sip_action': sip == SipCallStatus.incoming
                                      ? 'decline'
                                      : 'hangup'
                                };
                                widget.room.localParticipant
                                    ?.setAttributes(cur);
                                widget.room.localParticipant
                                    ?.setAttributes({'sip_action': ''});
                              },
                            ),
                          )
                        : const SizedBox(), // empty area until a call starts
                  ),

                  // ── NUMBER INPUT ───────────────────────────────────────
                  if (remotePatricipantTracks.isEmpty) ...[
                    const SizedBox(height: 32),
                    _buildNumberInput(),
                    const SizedBox(height: 40),
                    Center(child: _buildCallButton()),
                  ],

                  // ── LOCAL CONTROLS (always present) ───────────────────
                  if (widget.room.localParticipant != null) ...[
                    const SizedBox(height: 24),
                    ControlsWidget(widget.room, widget.room.localParticipant!),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Re-usable white 56-px input frame (same style as the login page).
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

// Big circular call button + caption.
// Uses the same onPressed logic you already had.
  Widget _buildCallButton() => ValueListenableBuilder(
      valueListenable: _number,
      builder: (context, _, __) {
        return Column(
          children: [
            SizedBox(
              width: 72,
              height: 72,
              child: ElevatedButton(
                onPressed: _number.text.isEmpty
                    ? null
                    : () async {
                        final result = await _call();
                        print('call result: $result');
                      },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: const Color(0xFF2FA5F9),
                  disabledBackgroundColor: const Color(0xFFE0E0E0),
                  elevation: 0,
                ),
                child: SvgPicture.asset(
                  'images/call_audio.svg', // <- use any phone SVG you already have
                  width: 28,
                  height: 28,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Позвонить',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: _number.text.isEmpty
                        ? Colors.grey.shade400
                        : const Color(0xFF2FA5F9),
                  ),
            ),
          ],
        );
      });

  Widget _buildNumberInput() => TextField(
        controller: _number,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Введите номер',
          hintStyle: const TextStyle(
            color: Color(0xFF9C9C9C), // light-grey hint
            fontSize: 16,
          ),
          filled: true,
          fillColor: Colors.white, // keeps the inside pure white
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),

          // grey rounded outline (identical idle & focus)
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFDADADA), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFDADADA), width: 1),
          ),
        ),
      );
}
