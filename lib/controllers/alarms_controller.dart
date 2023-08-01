import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/repositories/alarm_repository.dart';

import '../models/alarm.dart';

final alarmsControllerProvider =
    StateNotifierProvider<AlarmsControllerNotifier, AsyncValue>((ref) {
  final alarmRepository = ref.watch(alarmRepositoryProvider);
  return AlarmsControllerNotifier(
    alarmRepository: alarmRepository,
  );
});

class AlarmsControllerNotifier extends StateNotifier<AsyncValue> {
  AlarmsControllerNotifier({
    required this.alarmRepository,
  }) : super(const AsyncValue.data(null));

  final AlarmRepository alarmRepository;

  Future<void> saveAlarm(Alarm alarm) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      alarmRepository.addAlarm(alarm);
    });
  }

  Future<void> toggleAlarm(Alarm alarm, bool isActive) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      alarmRepository.toggleAlarm(alarm, isActive);
    });
  }

  Future<void> activateAlarm(Alarm alarm) async {
    await toggleAlarm(alarm, true);
  }

  Future<void> deactivateAlarm(Alarm alarm) async {
    await toggleAlarm(alarm, false);
  }
}
