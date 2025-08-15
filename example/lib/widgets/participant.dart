import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:livekit_example/models/sip_signalling.pb.dart';

import 'participant_info.dart';

abstract class ParticipantWidget extends StatefulWidget {
  // Convenience method to return relevant widget for participant
  static ParticipantWidget widgetFor(ParticipantTrack participantTrack,
      {bool showStatsLayer = false}) {
    if (participantTrack.participant is LocalParticipant) {
      return LocalParticipantWidget(
          participantTrack.participant as LocalParticipant,
          participantTrack.type,
          showStatsLayer);
    } else if (participantTrack.participant is RemoteParticipant) {
      return RemoteParticipantWidget(
          participantTrack.participant as RemoteParticipant,
          participantTrack.type,
          showStatsLayer);
    }
    throw UnimplementedError('Unknown participant type');
  }

  // Must be implemented by child class
  abstract final Participant participant;
  abstract final ParticipantTrackType type;
  abstract final bool showStatsLayer;
  final VideoQuality quality;

  const ParticipantWidget({
    this.quality = VideoQuality.MEDIUM,
    super.key,
  });
}

class LocalParticipantWidget extends ParticipantWidget {
  @override
  final LocalParticipant participant;
  @override
  final ParticipantTrackType type;
  @override
  final bool showStatsLayer;

  const LocalParticipantWidget(
    this.participant,
    this.type,
    this.showStatsLayer, {
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _LocalParticipantWidgetState();
}

class RemoteParticipantWidget extends ParticipantWidget {
  @override
  final RemoteParticipant participant;
  @override
  final ParticipantTrackType type;
  @override
  final bool showStatsLayer;

  const RemoteParticipantWidget(
    this.participant,
    this.type,
    this.showStatsLayer, {
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _RemoteParticipantWidgetState();
}

abstract class _ParticipantWidgetState<T extends ParticipantWidget>
    extends State<T> {
  VideoTrack? get activeVideoTrack;
  AudioTrack? get activeAudioTrack;
  TrackPublication? get videoPublication;
  TrackPublication? get audioPublication;
  bool get isScreenShare => widget.type == ParticipantTrackType.kScreenShare;
  EventsListener<ParticipantEvent>? _listener;

  bool out = false;

  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _listener = widget.participant.createListener();
    _listener?.on<TranscriptionEvent>((e) {
      for (var seg in e.segments) {
        print('Transcription: ${seg.text} ${seg.isFinal}');
      }
    });

    widget.participant.addListener(_onParticipantChanged);
    _onParticipantChanged();

    // fire every second

    var participant = widget.participant;
    if (participant is RemoteParticipant) {
      _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
        // If the widget is gone, or we’re not talking, do nothing.
        if (!mounted) {
          return;
        }

        setState(() {}); // rebuild → _timerText() regenerates
      });
    }
  }

  @override
  void dispose() {
    widget.participant.removeListener(_onParticipantChanged);
    _listener?.dispose();
    _ticker?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    oldWidget.participant.removeListener(_onParticipantChanged);
    widget.participant.addListener(_onParticipantChanged);
    _onParticipantChanged();
    super.didUpdateWidget(oldWidget);
  }

  // Notify Flutter that UI re-build is required, but we don't set anything here
  // since the updated values are computed properties.
  void _onParticipantChanged() => setState(() {});

  // Widgets to show above the info bar
  List<Widget> extraWidgets(bool isScreenShare) => [];

  @override
  Widget build(BuildContext ctx) {
    if (widget.participant is RemoteParticipant) {
      String callStatus =
          widget.participant.attributes['sip.callStatus'] ?? 'dialing';
      bool isIncoming =
          widget.participant.attributes['sip.callType'] == 'inbound';
      return Center(
        child: _CallStatusCard(
          joinedAt: widget.participant.joinedAt,
          callStatus: callStatus,
          title: widget.participant.identity,
          isIncoming: isIncoming,
          onSwitchHold: () async {
            var callId = widget.participant.attributes['sip.callID'];
            final sipSwitchHoldRequest = SipSwitchHold(callId: callId);
            final command = SipControlCommand(
                switchHold: sipSwitchHoldRequest, commandId: 'switchHold');
            final buffer = command.writeToBuffer();
            final participant = widget.participant.room.localParticipant;
            await participant?.publishData(
              buffer,
              reliable: true,
              topic: 'sip-control',
            );
          },
          onAnswer: () async {
            var callId = widget.participant.attributes['sip.callID'];
            final sipAnswerCallRequest = SipAnswerCall(callId: callId);
            final command = SipControlCommand(
                answerCall: sipAnswerCallRequest, commandId: 'answerCall');
            final buffer = command.writeToBuffer();
            final participant = widget.participant.room.localParticipant;
            await participant?.publishData(
              buffer,
              reliable: true,
              topic: 'sip-control',
            );
          },
          onHangup: () async {
            var callId = widget.participant.attributes['sip.callID'];
            final sipHangupCallRequest = SipHangupCall(callId: callId);
            final command = SipControlCommand(
                hangupCall: sipHangupCallRequest, commandId: 'hangupCall');
            final buffer = command.writeToBuffer();
            final participant = widget.participant.room.localParticipant;
            await participant?.publishData(
              buffer,
              reliable: true,
              topic: 'sip-control',
            );
          },
        ),
      );
    }

    return Container();
  }
}

class _LocalParticipantWidgetState
    extends _ParticipantWidgetState<LocalParticipantWidget> {
  @override
  LocalTrackPublication<LocalVideoTrack>? get videoPublication =>
      widget.participant.videoTrackPublications
          .where((element) => element.source == widget.type.lkVideoSourceType)
          .firstOrNull;

  @override
  LocalTrackPublication<LocalAudioTrack>? get audioPublication =>
      widget.participant.audioTrackPublications
          .where((element) => element.source == widget.type.lkAudioSourceType)
          .firstOrNull;

  @override
  VideoTrack? get activeVideoTrack => videoPublication?.track;

  @override
  AudioTrack? get activeAudioTrack => audioPublication?.track;
}

class _RemoteParticipantWidgetState
    extends _ParticipantWidgetState<RemoteParticipantWidget> {
  @override
  RemoteTrackPublication<RemoteVideoTrack>? get videoPublication =>
      widget.participant.videoTrackPublications
          .where((element) => element.source == widget.type.lkVideoSourceType)
          .firstOrNull;

  @override
  RemoteTrackPublication<RemoteAudioTrack>? get audioPublication =>
      widget.participant.audioTrackPublications
          .where((element) => element.source == widget.type.lkAudioSourceType)
          .firstOrNull;

  @override
  VideoTrack? get activeVideoTrack => videoPublication?.track;

  @override
  AudioTrack? get activeAudioTrack => audioPublication?.track;

  @override
  List<Widget> extraWidgets(bool isScreenShare) {
    List<Widget> widgets = [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Menu for RemoteTrackPublication<RemoteAudioTrack>
          if (audioPublication != null)
            RemoteTrackPublicationMenuWidget(
              pub: audioPublication!,
              icon: Icons.volume_up,
            ),
          // Menu for RemoteTrackPublication<RemoteVideoTrack>
          if (videoPublication != null)
            RemoteTrackPublicationMenuWidget(
              pub: videoPublication!,
              icon: isScreenShare ? Icons.monitor : Icons.videocam,
            ),
          if (videoPublication != null)
            RemoteTrackFPSMenuWidget(
              pub: videoPublication!,
              icon: Icons.menu,
            ),
          if (videoPublication != null)
            RemoteTrackQualityMenuWidget(
              pub: videoPublication!,
              icon: Icons.monitor_outlined,
            ),
        ],
      ),
    ];
    return widgets;
  }
}

class RemoteTrackPublicationMenuWidget extends StatelessWidget {
  final IconData icon;
  final RemoteTrackPublication pub;
  const RemoteTrackPublicationMenuWidget({
    required this.pub,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black.withValues(alpha: 0.3),
        child: PopupMenuButton<Function>(
          tooltip: 'Subscribe menu',
          icon: Icon(icon,
              color: {
                TrackSubscriptionState.notAllowed: Colors.red,
                TrackSubscriptionState.unsubscribed: Colors.grey,
                TrackSubscriptionState.subscribed: Colors.green,
              }[pub.subscriptionState]),
          onSelected: (value) => value(),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Function>>[
            // Subscribe/Unsubscribe
            if (pub.subscribed == false)
              PopupMenuItem(
                child: const Text('Subscribe'),
                value: () => pub.subscribe(),
              )
            else if (pub.subscribed == true)
              PopupMenuItem(
                child: const Text('Un-subscribe'),
                value: () => pub.unsubscribe(),
              ),
          ],
        ),
      );
}

class RemoteTrackFPSMenuWidget extends StatelessWidget {
  final IconData icon;
  final RemoteTrackPublication pub;
  const RemoteTrackFPSMenuWidget({
    required this.pub,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black.withValues(alpha: 0.3),
        child: PopupMenuButton<Function>(
          tooltip: 'Preferred FPS',
          icon: Icon(icon, color: Colors.white),
          onSelected: (value) => value(),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Function>>[
            PopupMenuItem(
              child: const Text('30'),
              value: () => pub.setVideoFPS(30),
            ),
            PopupMenuItem(
              child: const Text('15'),
              value: () => pub.setVideoFPS(15),
            ),
            PopupMenuItem(
              child: const Text('8'),
              value: () => pub.setVideoFPS(8),
            ),
          ],
        ),
      );
}

class RemoteTrackQualityMenuWidget extends StatelessWidget {
  final IconData icon;
  final RemoteTrackPublication pub;
  const RemoteTrackQualityMenuWidget({
    required this.pub,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black.withValues(alpha: 0.3),
        child: PopupMenuButton<Function>(
          tooltip: 'Preferred Quality',
          icon: Icon(icon, color: Colors.white),
          onSelected: (value) => value(),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Function>>[
            PopupMenuItem(
              child: const Text('HIGH'),
              value: () => pub.setVideoQuality(VideoQuality.HIGH),
            ),
            PopupMenuItem(
              child: const Text('MEDIUM'),
              value: () => pub.setVideoQuality(VideoQuality.MEDIUM),
            ),
            PopupMenuItem(
              child: const Text('LOW'),
              value: () => pub.setVideoQuality(VideoQuality.LOW),
            ),
          ],
        ),
      );
}

// ============================================================================
// A small, self-contained card that shows the three call states you provided.
// ============================================================================
class _CallStatusCard extends StatefulWidget {
  final String callStatus;
  final bool isIncoming;
  final String title; // number or name
  final VoidCallback? onAnswer;
  final VoidCallback? onHangup;
  final VoidCallback? onSwitchHold;

  final DateTime joinedAt;

  const _CallStatusCard({
    required this.callStatus,
    required this.title,
    required this.isIncoming,
    required this.onSwitchHold,
    this.onAnswer,
    this.onHangup,
    required this.joinedAt,
  });

  @override
  State<_CallStatusCard> createState() => _CallStatusCardState();
}

class _CallStatusCardState extends State<_CallStatusCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateTimer();
  }

  @override
  void didUpdateWidget(covariant _CallStatusCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.callStatus != oldWidget.callStatus) {
      _updateTimer();
    }
  }

  void _updateTimer() {
    _timer?.cancel();
    if (widget.callStatus == 'talking') {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _timer?.cancel();
    super.dispose();
  }

  // coloured main circle + animated ripples
  Widget _buildAvatar(Color colour, IconData icon) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 3 concentric animated rings
          for (int i = 3; i >= 1; i--)
            AnimatedBuilder(
              animation: _ctrl,
              builder: (_, __) {
                final progress = (_ctrl.value + (i * .2)) % 1;
                return Container(
                  width: 140 * progress,
                  height: 140 * progress,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colour.withOpacity(1 - progress),
                  ),
                );
              },
            ),
          // solid middle
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colour,
            ),
            child: Icon(icon, size: 40, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // decide visuals based on state
    late final Color mainClr;
    late final IconData avatarIcon;
    switch (widget.callStatus) {
      case 'ringing':
        mainClr = const Color(0xFF2FA5F9);
        avatarIcon = Icons.call_made_rounded;
        break;
      case 'talking':
        mainClr = const Color(0xFF2FA5F9);
        avatarIcon = Icons.person;
        break;
      case 'incoming':
        mainClr = const Color(0xFF4CAF50);
        avatarIcon = Icons.call_received_rounded;
        break;
      default:
        // hangup, dialing here
        mainClr = Colors.grey;
        avatarIcon = Icons.call;
    }

    // bottom buttons
    List<Widget> buttons;
    if (widget.isIncoming && widget.callStatus == 'ringing') {
      buttons = [
        _circButton(
            colour: const Color(0xFF4CAF50),
            iconPath: 'images/call_audio.svg',
            onTap: widget.onAnswer),
        const SizedBox(width: 40),
        _circButton(
            colour: const Color(0xFFF44336),
            iconPath: 'images/call_hangup.svg',
            onTap: widget.onHangup),
      ];
    } else {
      buttons = [
        _circButton(
            colour: const Color(0xFFF44336),
            iconPath: 'images/call_hangup.svg',
            onTap: widget.onHangup),
        const SizedBox(width: 40),
        _circButton(
            colour: Colors.yellow,
            iconPath: 'images/call_hold.svg',
            onTap: widget.onSwitchHold),
      ];
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAvatar(mainClr, avatarIcon),
          const SizedBox(height: 24),
          Text(widget.title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(widget.callStatus,
              style: const TextStyle(fontSize: 14, color: Color(0xFF8F9CA9))),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buttons,
          ),
          if (widget.callStatus == 'talking') ...[
            const SizedBox(height: 8),
            Text(_timerText(),
                style: const TextStyle(fontSize: 14, color: Color(0xFF8F9CA9))),
          ],
        ],
      ),
    );
  }

// very small helper to format the call duration (keeps old logic intact)
  String _timerText() {
    final secs = widget.joinedAt.difference(DateTime.now()).inSeconds.abs();
    final m = (secs ~/ 60).toString().padLeft(2, '0');
    final s = (secs % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  // helper to make a coloured circular button
  Widget _circButton(
      {required Color colour, required String iconPath, VoidCallback? onTap}) {
    return SizedBox(
      width: 72,
      height: 72,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const CircleBorder(),
          backgroundColor: colour,
        ),
        child: SvgPicture.asset(iconPath, height: 30, color: Colors.white),
      ),
    );
  }
}
