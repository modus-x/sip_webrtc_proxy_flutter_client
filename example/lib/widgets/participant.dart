import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:livekit_example/theme.dart';

import 'no_video.dart';
import 'participant_info.dart';
import 'participant_stats.dart';

abstract class ParticipantWidget extends StatefulWidget {
  // Convenience method to return relevant widget for participant
  static ParticipantWidget widgetFor(ParticipantTrack participantTrack,
      {bool showStatsLayer = false,
      Function(SipCallStatus status)? answer,
      Function(SipCallStatus status)? hangup}) {
    if (participantTrack.participant is LocalParticipant) {
      return LocalParticipantWidget(
          participantTrack.participant as LocalParticipant,
          participantTrack.type,
          showStatsLayer);
    } else if (participantTrack.participant is RemoteParticipant) {
      return RemoteParticipantWidget(
          participantTrack.participant as RemoteParticipant,
          participantTrack.type,
          showStatsLayer,
          answer: answer,
          hangup: hangup);
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

  final Function(SipCallStatus status)? answer;
  final Function(SipCallStatus status)? hangup;

  const RemoteParticipantWidget(
    this.participant,
    this.type,
    this.showStatsLayer, {
    this.answer,
    this.hangup,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _RemoteParticipantWidgetState();
}

abstract class _ParticipantWidgetState<T extends ParticipantWidget>
    extends State<T> {
  bool _visible = true;
  VideoTrack? get activeVideoTrack;
  AudioTrack? get activeAudioTrack;
  TrackPublication? get videoPublication;
  TrackPublication? get audioPublication;
  bool get isScreenShare => widget.type == ParticipantTrackType.kScreenShare;
  EventsListener<ParticipantEvent>? _listener;

  bool out = false;

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
  }

  @override
  void dispose() {
    widget.participant.removeListener(_onParticipantChanged);
    _listener?.dispose();
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
    SipCallStatus sipCallStatus = SipCallStatus.none;

    if (widget.participant is RemoteParticipant) {
      sipCallStatus = (widget.participant as RemoteParticipant).sipCallStatus;
    }

    return Container(
      foregroundDecoration: BoxDecoration(
        border: widget.participant.isSpeaking && !isScreenShare
            ? Border.all(
                width: 5,
                color: LKColors.lkBlue,
              )
            : null,
      ),
      decoration: BoxDecoration(
        color: Theme.of(ctx).cardColor,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Video
          InkWell(
            onTap: () => setState(() => _visible = !_visible),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: activeVideoTrack != null && !activeVideoTrack!.muted
                      ? VideoTrackRenderer(
                          renderMode: VideoRenderMode.auto,
                          activeVideoTrack!,
                          fit: RTCVideoViewObjectFit.RTCVideoViewObjectFitContain,
                        )
                      : const NoVideoWidget(),
                ),
                // SIP state
                if (sipCallStatus == SipCallStatus.ringing ||
                    sipCallStatus == SipCallStatus.incoming)
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sipCallStatus == SipCallStatus.incoming
                              ? 'Входящий вызов'
                              : 'Исходящий вызов',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
          // Bottom bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...extraWidgets(isScreenShare),
                ParticipantInfoWidget(
                  title: widget.participant.name.isNotEmpty
                      ? '${widget.participant.name} (${widget.participant.identity})'
                      : widget.participant.identity,
                  audioAvailable: audioPublication?.muted == false &&
                      audioPublication?.subscribed == true,
                  connectionQuality: widget.participant.connectionQuality,
                  isScreenShare: isScreenShare,
                  enabledE2EE: widget.participant.isEncrypted,
                ),
              ],
            ),
          ),

          if (widget.showStatsLayer)
            Positioned(
                top: 130,
                right: 30,
                child: ParticipantStatsWidget(
                  participant: widget.participant,
                )),
        ],
      ),
    );
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

    var sipCallStatus = widget.participant.sipCallStatus;

    // incoming, add answer button
    if (sipCallStatus == SipCallStatus.incoming) {
      widgets.add(
        Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  widget.answer?.call(sipCallStatus);
                },
                child: const FittedBox(child: Text('Принять')))),
      );
    } else if ([
      SipCallStatus.incoming,
      SipCallStatus.ringing,
      SipCallStatus.talking
    ].contains(sipCallStatus)) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              widget.hangup?.call(sipCallStatus);
            },
            child: const FittedBox(child: Text('Завершить'))),
      ));
    }
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
