import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_my_nap/database/models/alarm_realm_model.dart';
import 'package:map_my_nap/models/coordinates.dart';
import 'package:map_my_nap/models/trigger_on.dart';
import 'package:uuid/uuid.dart';

part 'alarm.freezed.dart';

@Freezed()
class Alarm with _$Alarm {
  const Alarm._();

  const factory Alarm({
    required String id,
    required String label,
    required Coordinates coordinates,
    required double radius,
    required TriggerOn triggerOn,
    required bool isActive,
  }) = _Alarm;

  factory Alarm.raw() {
    Uuid uuid = const Uuid();
    return Alarm(
      id: uuid.v1(),
      label: '',
      coordinates: Coordinates.raw(),
      radius: 1000,
      triggerOn: TriggerOn.entry,
      isActive: false,
    );
  }

  AlarmRealmModel toRealmModel() {
    return AlarmRealmModel(
      id,
      label,
      radius,
      triggerOn.name,
      coordinates: coordinates.toRealmModel(),
    );
  }

  factory Alarm.fromRealmModel(AlarmRealmModel alarmRealmModel) {
    return Alarm(
      id: alarmRealmModel.id,
      label: alarmRealmModel.label,
      coordinates: Coordinates.fromRealmModel(alarmRealmModel.coordinates!),
      radius: alarmRealmModel.radius,
      triggerOn: TriggerOnExt.fromName(alarmRealmModel.triggerOn),
      isActive: alarmRealmModel.isActive,
    );
  }
}
