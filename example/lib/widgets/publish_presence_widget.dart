import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';

import '../models/sip_signalling.pb.dart';

class PublishPresenceWidget extends StatefulWidget {
  final Room room;

  const PublishPresenceWidget({super.key, required this.room});

  @override
  State<PublishPresenceWidget> createState() => _PublishPresenceWidgetState();
}

class _PublishPresenceWidgetState extends State<PublishPresenceWidget> {
  final _noteController = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _onPublishPressed() async {
    final note = _noteController.text.trim();
    if (note.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter note')),
      );
      return;
    }

    final publish = SipPublishPresence(note: note);
    final cmd = SipControlCommand(
      publishPresence: publish,
      commandId: 'publish-presence-${DateTime.now().millisecondsSinceEpoch}',
    );

    setState(() => _submitting = true);
    try {
      await widget.room.localParticipant?.publishData(
        cmd.writeToBuffer(),
        reliable: true,
        topic: 'sip-control',
      );
    } catch (err) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Publish failed: $err')),
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
        Text('Publish Presence', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'Note',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _submitting ? null : _onPublishPressed,
                child: _submitting
                    ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Publish'),
              ),
            ),
          ],
        ),
      ],
    );
  }
} 