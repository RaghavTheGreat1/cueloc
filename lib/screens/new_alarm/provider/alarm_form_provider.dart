import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/database/services/alarm_realm_services.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/models/coordinates.dart';
import 'package:map_my_nap/models/trigger_on.dart';

final alarmFormProvider = StateNotifierProvider.autoDispose
    .family<AlarmFormProvider, Alarm, Alarm>((ref, alarm) {
  return AlarmFormProvider(alarm, ref: ref);
});

class AlarmFormProvider extends StateNotifier<Alarm> {
  final Ref ref;
  AlarmFormProvider(
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
    final alarmRealm = AlarmRealmServices();
    alarmRealm.addAlarm(state);
  }
}
