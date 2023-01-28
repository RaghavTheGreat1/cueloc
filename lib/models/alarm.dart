import 'package:map_my_nap/database/models/alarm_realm_model.dart';
import 'package:map_my_nap/models/coordinates.dart';
import 'package:map_my_nap/models/trigger_on.dart';
import 'package:uuid/uuid.dart';

class Alarm {
  Alarm({
    required this.id,
    required this.label,
    required this.coordinates,
    required this.radius,
    required this.triggerOn,
  });

  final String id;
  final String label;
  final Coordinates coordinates;
  final double radius;
  final TriggerOn triggerOn;

  factory Alarm.raw() {
    Uuid uuid = const Uuid();
    return Alarm(
      id: uuid.v1(),
      label: '',
      coordinates: Coordinates.raw(),
      radius: 1000,
      triggerOn: TriggerOn.entry,
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
      coordinates: Coordinates.fromRealmModel(alarmRealmModel.coordinates),
      radius: alarmRealmModel.radius,
      triggerOn: TriggerOnExt.fromName(alarmRealmModel.triggerOn),
    );
  }
}
