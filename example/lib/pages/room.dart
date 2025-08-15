import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livekit_client/livekit_client.dart';

import '../exts.dart';
import '../models/sip_signalling.pb.dart';
import '../utils.dart';
import '../widgets/controls.dart';
import '../widgets/participant.dart';
import '../widgets/participant_info.dart';
import '../widgets/subscription_widget.dart';
import '../widgets/publish_presence_widget.dart';

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
  bool _flagStartedReplayKit = false;

  final _number = TextEditingController();

  final _sipControlReponseController =
      StreamController<SipControlResponse>.broadcast();

  @override
  void initState() {
    super.initState();
    // add callback for a `RoomEvent` as opposed to a `ParticipantEvent`
    widget.room.addListener(_onRoomDidUpdate);
    // add callbacks for finer grained events
    _setUpListeners();
    _sortParticipants();

    if (lkPlatformIs(PlatformType.android)) {
      Hardware.instance.setSpeakerphoneOn(true);
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
      widget.room.removeListener(_onRoomDidUpdate);
      await _listener.dispose();
      await widget.room.dispose();
    })();
    onWindowShouldClose = null;
    super.dispose();
  }

  /// for more information, see [event types](https://docs.livekit.io/client/events/#events)
  void _setUpListeners() => _listener
    ..on<ParticipantAttributesChanged>((event) {
      print(
          'Participant attributes changed: ${event.participant.identity}, attributes => ${event.attributes}');
    })
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
    ..on<RoomRecordingStatusChanged>((event) {
      context.showRecordingStatusChangedDialog(event.activeRecording);
    })
    ..on<RoomAttemptReconnectEvent>((event) {
      print(
          'Attempting to reconnect ${event.attempt}/${event.maxAttemptsRetry}, '
          '(${event.nextRetryDelaysInMs}ms delay until next attempt)');
    })
    ..on<LocalTrackSubscribedEvent>((event) {})
    ..on<LocalTrackPublishedEvent>((_) {
      _sortParticipants();
    })
    ..on<LocalTrackUnpublishedEvent>((_) {
      _sortParticipants();
    })
    ..on<TrackSubscribedEvent>((_) {
      _sortParticipants();
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
      if (event.topic == 'sip-control') {
        final response = SipControlResponse.fromBuffer(event.data);
        _sipControlReponseController.add(response);
      }
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

  void _publishTracks(bool active) async {
    try {
      await widget.room.localParticipant?.setMicrophoneEnabled(active);
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

    // try to publish tracks if there are remote participants
    if (remoteMediaTracks.isNotEmpty) {
      _publishTracks(true);
    } else {
      _publishTracks(false);
    }

    setState(() {
      remotePatricipantTracks = remoteMediaTracks;
    });

    final localParticipantTracks =
        widget.room.localParticipant?.videoTrackPublications;
    if (localParticipantTracks != null) {
      for (var t in localParticipantTracks) {
        if (t.isScreenShare) {
          screenTracks.add(ParticipantTrack(
            participant: widget.room.localParticipant!,
            type: ParticipantTrackType.kScreenShare,
          ));
        } else {
          if (lkPlatformIs(PlatformType.iOS)) {
            if (_flagStartedReplayKit) {
              _flagStartedReplayKit = false;
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

  void _onTapDisconnect() async {
    final result = await context.showDisconnectDialog();
    if (result == true) {
      final sipUnregisterRequest = SipUnregister();
      final command = SipControlCommand(
          unregister: sipUnregisterRequest, commandId: 'unregister');
      final buffer = command.writeToBuffer();
      final participant = widget.room.localParticipant;

      var unregisterFuture = _sipControlReponseController.stream
          .firstWhere((event) => event.commandId == 'unregister');

      await participant?.publishData(
        buffer,
        reliable: true,
        topic: 'sip-control',
      );

      await unregisterFuture;

      await widget.room.disconnect();
    }
  }

  void _onTapCall() async {
    final sipMakeCallRequest = SipMakeCall(
      target: _number.text,
    );
    final command = SipControlCommand(
      makeCall: sipMakeCallRequest,
      commandId: 'make-call',
    );
    final buffer = command.writeToBuffer();
    final participant = widget.room.localParticipant;
    await participant?.publishData(
      buffer,
      reliable: true,
      topic: 'sip-control',
    );
  }

  @override
  Widget build(BuildContext context) {
    final localName = widget.room.localParticipant?.name ?? '';

    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          child: IntrinsicHeight(
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
                              ),
                            )
                          : const SizedBox(), // empty area until a call starts
                    ),
          
                    // ── NUMBER INPUT ───────────────────────────────────────
                    const SizedBox(height: 32),
                    _buildNumberInput(),
                    const SizedBox(height: 40),
                    Center(child: _buildCallButton()),
          
                    // ── LOCAL CONTROLS (always present) ───────────────────
                    if (widget.room.localParticipant != null) ...[
                      const SizedBox(height: 24),
                      ControlsWidget(widget.room, widget.room.localParticipant!),
                    ],
                    const SizedBox(height: 24),
          
                    // SUBSCRIPTION TEST
                    SubscriptionWidget(room: widget.room, listener: _listener),

                    // PRESENCE TEST
                    const SizedBox(height: 16),
                    PublishPresenceWidget(room: widget.room),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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
                onPressed: _number.text.isEmpty ? null : _onTapCall,
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
