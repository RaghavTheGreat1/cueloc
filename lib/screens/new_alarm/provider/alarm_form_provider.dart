import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/models/coordinates.dart';
import 'package:map_my_nap/models/trigger_on.dart';
import 'package:map_my_nap/repositories/alarm_repository.dart';

import '../../../router/router.dart';

final alarmFormProvider =
    StateNotifierProvider.autoDispose<AlarmFormController, Alarm>((ref) {
  return AlarmFormController(
    Alarm.raw(),
    ref: ref,
  );
});

class AlarmFormController extends StateNotifier<Alarm> {
  final Ref ref;
  AlarmFormController(
    super.state, {
    required this.ref,
  });

  void updateLabel(String label) {
    state = state.copyWith(label: label);
  }

  void updateRadius(double radius) {
    state = state.copyWith(radius: radius);
  }

  void updateTriggerOn(TriggerOn triggerOn) {
    state = state.copyWith(triggerOn: triggerOn);
  }

  void updateCoordinates(Coordinates coordinates) {
    state = state.copyWith(coordinates: coordinates);
  }

  void saveAlarm() {
    final alarmRepository = ref.read(alarmRepositoryProvider);
    alarmRepository.addAlarm(state);
    ref.watch(routerServiceProvider).pop();
  }
}
