import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';

import '../models/sip_signalling.pb.dart';

class SubscriptionWidget extends StatefulWidget {
  final Room room;
  final EventsListener<RoomEvent> listener;

  const SubscriptionWidget({super.key, required this.room, required this.listener});

  @override
  State<SubscriptionWidget> createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends State<SubscriptionWidget> {
  final _eventController = TextEditingController(text: 'presence');
  final _targetController = TextEditingController();

  final List<SipNotifyReceived> _events = [];
  bool _submitting = false;

  @override
  void initState() {
    super.initState();

    // Listen for data messages on the sip-control topic and collect NOTIFY events
    widget.listener.on<DataReceivedEvent>((event) {
      if (event.topic != 'sip-control') return;
      try {
        final response = SipControlResponse.fromBuffer(event.data);
        if (response.hasNotifyReceived()) {
          setState(() {
            _events.insert(0, response.notifyReceived);
          });
        }
      } catch (_) {
        // ignore parse errors
      }
    });
  }

  @override
  void dispose() {
    _eventController.dispose();
    _targetController.dispose();
    super.dispose();
  }

  Future<void> _onSubscribePressed() async {
    final event = _eventController.text.trim();
    final target = _targetController.text.trim();
    if (event.isEmpty || target.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter both event and target')),
      );
      return;
    }

    final subscribe = SipSubscribe(
      event: event,
      target: target,
      expires: 3600,
    );
    final cmd = SipControlCommand(
      subscribe: subscribe,
      commandId: 'subscribe-${DateTime.now().millisecondsSinceEpoch}',
    );

    setState(() => _submitting = true);
    try {
      await widget.room.localParticipant?.publishData(
        cmd.writeToBuffer(),
        reliable: true,
        topic: 'sip-control',
      );
      // Optionally wait for ack result here; we rely on NOTIFY stream mainly.
    } catch (err) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Subscribe failed: $err')),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('SIP Subscriptions', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _eventController,
                decoration: const InputDecoration(
                  labelText: 'Event (e.g. presence)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: _targetController,
                decoration: const InputDecoration(
                  labelText: 'Target (user)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _submitting ? null : _onSubscribePressed,
                child: _submitting ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Subscribe'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFDADADA)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _events.isEmpty
                ? const Center(child: Text('No events yet'))
                : ListView.builder(
                    itemCount: _events.length,
                    itemBuilder: (context, index) {
                      final ev = _events[index];
                      return ListTile(
                        dense: true,
                        title: Text(ev.event.isEmpty ? '(no event)' : ev.event),
                        subtitle: Text(
                          ev.text,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Text(ev.contentType),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
