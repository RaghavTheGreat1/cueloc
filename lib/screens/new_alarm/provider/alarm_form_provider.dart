import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/controllers/alarms_controller.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/models/coordinates.dart';
import 'package:map_my_nap/models/trigger_on.dart';

import '../../../router/router.dart';

final alarmFormProvider =
    StateNotifierProvider.autoDispose<AlarmFormController, Alarm>((ref) {
  final alarmControllerNotifier = ref.watch(alarmsControllerProvider.notifier);
  return AlarmFormController(
    Alarm.raw(),
    ref: ref,
    alarmsControllerNotifier: alarmControllerNotifier,
  );
});

final class AlarmFormController extends StateNotifier<Alarm> {
  final Ref ref;
  AlarmFormController(
    super.state, {
    required this.ref,
    required this.alarmsControllerNotifier,
  });

  final AlarmsControllerNotifier alarmsControllerNotifier;

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

  Future<void> saveAlarm() async {
    await alarmsControllerNotifier.saveAlarm(state);

    ref.watch(routerServiceProvider).pop();
  }
}
