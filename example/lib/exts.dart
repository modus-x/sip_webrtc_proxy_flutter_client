import 'package:flutter/material.dart';

extension LKExampleExt on BuildContext {
  //
  Future<bool?> showPublishDialog() => showDialog<bool>(
        context: this,
        builder: (ctx) => AlertDialog(
          title: const Text('Опубликовать'),
          content: const Text('Вы хотите опубликовать свою камеру и микрофон?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('НЕТ'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('ДА'),
            ),
          ],
        ),
      );

  Future<bool?> showPlayAudioManuallyDialog() => showDialog<bool>(
        context: this,
        builder: (ctx) => AlertDialog(
          title: const Text('Воспроизвести аудио'),
          content: const Text(
              'Необходимо вручную активировать воспроизведение аудио в Safari на iOS!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Игнорировать'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Воспроизвести'),
            ),
          ],
        ),
      );

  Future<bool?> showUnPublishDialog() => showDialog<bool>(
        context: this,
        builder: (ctx) => AlertDialog(
          title: const Text('Отменить публикацию'),
          content:
              const Text('Вы хотите отключить публикацию камеры и микрофона?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('НЕТ'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('ДА'),
            ),
          ],
        ),
      );

  Future<void> showErrorDialog(dynamic exception, {VoidCallback? onPressed}) => showDialog<void>(
        context: this,
        builder: (ctx) => AlertDialog(
          title: const Text('Ошибка'),
          content: Text(exception.toString()),
          actions: [
            TextButton(
              onPressed: () {
                onPressed?.call();
                Navigator.pop(ctx);
              },
              child: const Text('ОК'),
            )
          ],
        ),
      );

  Future<bool?> showDisconnectDialog() => showDialog<bool>(
        context: this,
        builder: (ctx) => AlertDialog(
          title: const Text('Отключиться'),
          content: const Text('Вы уверены, что хотите отключиться?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Отключиться'),
            ),
          ],
        ),
      );

  Future<bool?> showReconnectDialog() => showDialog<bool>(
        context: this,
        builder: (ctx) => AlertDialog(
          title: const Text('Переподключиться'),
          content: const Text('Это принудительно пересоединит'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Переподключиться'),
            ),
          ],
        ),
      );

  Future<void> showReconnectSuccessDialog() => showDialog<void>(
        context: this,
        builder: (ctx) => AlertDialog(
          title: const Text('Переподключиться'),
          content: const Text('Переподключение прошло успешно.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('ОК'),
            ),
          ],
        ),
      );

  Future<bool?> showSendDataDialog() => showDialog<bool>(
        context: this,
        builder: (ctx) => AlertDialog(
          title: const Text('Отправить данные'),
          content: const Text(
              'Это отправит пример данных всем участникам в комнате'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Отправить'),
            ),
          ],
        ),
      );

  Future<bool?> showDataReceivedDialog(String data) => showDialog<bool>(
        context: this,
        builder: (ctx) => AlertDialog(
          title: const Text('Полученные данные'),
          content: Text(data),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('ОК'),
            ),
          ],
        ),
      );

  Future<bool?> showRecordingStatusChangedDialog(bool isActiveRecording) =>
      showDialog<bool>(
        context: this,
        builder: (ctx) => AlertDialog(
          title: const Text('Напоминание о записи комнаты'),
          content: Text(isActiveRecording
              ? 'Запись комнаты активна.'
              : 'Запись комнаты остановлена.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('ОК'),
            ),
          ],
        ),
      );

  Future<bool?> showSubscribePermissionDialog() => showDialog<bool>(
        context: this,
        builder: (ctx) => AlertDialog(
          title: const Text('Разрешить подписку'),
          content: const Text(
              'Разрешить всем участникам подписываться на дорожки, опубликованные локальным участником?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('НЕТ'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('ДА'),
            ),
          ],
        ),
      );

  Future<SimulateScenarioResult?> showSimulateScenarioDialog() =>
      showDialog<SimulateScenarioResult>(
        context: this,
        builder: (ctx) => SimpleDialog(
          title: const Text('Симуляция сценария'),
          children: SimulateScenarioResult.values
              .map((e) => SimpleDialogOption(
                    child: Text(e.name),
                    onPressed: () => Navigator.pop(ctx, e),
                  ))
              .toList(),
        ),
      );
}

enum SimulateScenarioResult {
  signalReconnect,
  fullReconnect,
  speakerUpdate,
  nodeFailure,
  migration,
  serverLeave,
  switchCandidate,
  e2eeKeyRatchet,
  participantName,
  participantMetadata,
  clear,
}