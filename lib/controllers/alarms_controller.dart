import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/alarm.dart';
import '../repositories/alarm_repository.dart';

final alarmsControllerProvider =
    AsyncNotifierProvider<AlarmsNotifier, void>(AlarmsNotifier.new);

class AlarmsNotifier extends AsyncNotifier<void> {
  AlarmRepository get _alarmRepository => ref.watch(alarmRepositoryProvider);

  @override
  build() {
    return const AsyncValue.data(null);
  }

  Future<void> saveAlarm(Alarm alarm) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _alarmRepository.addAlarm(alarm);
    });
  }

  Future<void> updateAlarm(Alarm alarm) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _alarmRepository.updateAlarm(alarm);
    });
  }

  Future<void> toggleAlarm(Alarm alarm, bool isActive) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _alarmRepository.toggleAlarm(alarm, isActive);
    });
  }

  Future<void> activateAlarm(Alarm alarm) async {
    await toggleAlarm(alarm, true);
  }

  Future<void> deactivateAlarm(Alarm alarm) async {
    await toggleAlarm(alarm, false);
  }
}
