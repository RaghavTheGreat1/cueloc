import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/repositories/alarm_repository.dart';

/// Provides all alarms that has been created irrespective of their status(active or inactive).
final allAlarmsStreamProvider = StreamProvider<List<Alarm>>((ref) async* {
  final alarmRepository = ref.watch(alarmRepositoryProvider);

  final alarmsStream = alarmRepository.streamAlarms();

  await for (final alarms in alarmsStream) {
    yield alarms;
  }
});

/// Provides all active alarms.
final activeAlarmsStreamProvider = StreamProvider<List<Alarm>>((ref) async* {
  final alarmRepository = ref.watch(alarmRepositoryProvider);

  final alarmsStream = alarmRepository.streamAlarms();

  await for (final alarms in alarmsStream) {
    yield alarms.where((alarm) => alarm.isActive).toList();
  }
});

/// Provides all inactive alarms.
final inactiveAlarmsStreamProvider = StreamProvider<List<Alarm>>((ref) async* {
  final alarmRepository = ref.watch(alarmRepositoryProvider);

  final alarmsStream = alarmRepository.streamAlarms();

  await for (final alarms in alarmsStream) {
    yield alarms.where((alarm) => !alarm.isActive).toList();
  }
});
