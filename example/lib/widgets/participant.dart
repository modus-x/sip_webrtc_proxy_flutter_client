import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livekit_client/livekit_client.dart';

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
          (widget.participant as RemoteParticipant).attributes['sip.callStatus'] ?? '';
      // ── 1) If we are in a special SIP state, show the big card ──────────────
      if (callStatus == 'ringing' ||
          callStatus == 'incoming' ||
          callStatus == 'talking') {
        String? subtitle;
        if (callStatus == 'ringing') subtitle = 'Идет вызов…';
        if (callStatus == 'incoming') subtitle = 'Входящий вызов';
        if (callStatus == 'talking') subtitle = _timerText(); // hh:mm:ss

        return Center(
          child: _CallStatusCard(
            callStatus: callStatus,
            title: widget.participant.identity,
            subtitle: subtitle,
            onAnswer: callStatus == 'incoming' ? () => {} : null,
            onHangup: callStatus == 'incoming' ? () => {} : null,
          ),
        );
      }
    }

    return Container();
  }

// very small helper to format the call duration (keeps old logic intact)
  String _timerText() {
    final secs =
        widget.participant.joinedAt.difference(DateTime.now()).inSeconds.abs();
    final m = (secs ~/ 60).toString().padLeft(2, '0');
    final s = (secs % 60).toString().padLeft(2, '0');
    return '$m:$s';
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
        color: Colors.black.withOpacity(0.3),
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
        color: Colors.black.withOpacity(0.3),
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
        color: Colors.black.withOpacity(0.3),
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
  final String title; // number or name
  final String? subtitle; // "Идет вызов…", timer, etc.
  final VoidCallback? onAnswer;
  final VoidCallback? onHangup;

  const _CallStatusCard({
    required this.callStatus,
    required this.title,
    this.subtitle,
    this.onAnswer,
    this.onHangup,
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

  @override
  void dispose() {
    _ctrl.dispose();
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
        mainClr = Colors.grey;
        avatarIcon = Icons.call;
    }

    // bottom buttons
    List<Widget> buttons;
    if (widget.callStatus == 'incoming') {
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
          if (widget.subtitle != null) ...[
            const SizedBox(height: 4),
            Text(widget.subtitle!,
                style: const TextStyle(fontSize: 14, color: Color(0xFF8F9CA9))),
          ],
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buttons,
          ),
          if (widget.callStatus != 'incoming') ...[
            const SizedBox(height: 8),
            Text('Завершить', style: Theme.of(context).textTheme.bodySmall),
          ],
        ],
      ),
    );
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
