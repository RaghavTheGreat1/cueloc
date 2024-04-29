import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/alarm_form.dart';
import '../repositories/alarm_repository.dart';

/// Provides all alarms that has been created irrespective of their status(active or inactive).
final allAlarmsStreamProvider = StreamProvider<List<AlarmForm>>((ref) async* {
  final alarmRepository = ref.watch(alarmRepositoryProvider);

  final alarmsStream = alarmRepository.streamAlarms();

  await for (final alarms in alarmsStream) {
    yield alarms;
  }
});

/// Provides all active alarms.
final activeAlarmsStreamProvider =
    StreamProvider<List<AlarmForm>>((ref) async* {
  final alarmRepository = ref.watch(alarmRepositoryProvider);

  final alarmsStream = alarmRepository.streamAlarms();

  await for (final alarms in alarmsStream) {
    yield alarms.where((alarm) => alarm.isActive).toList();
  }
});

/// Provides all inactive alarms.
final inactiveAlarmsStreamProvider =
    StreamProvider<List<AlarmForm>>((ref) async* {
  final alarmRepository = ref.watch(alarmRepositoryProvider);

  final alarmsStream = alarmRepository.streamAlarms();

  await for (final alarms in alarmsStream) {
    yield alarms.where((alarm) => !alarm.isActive).toList();
  }
});
