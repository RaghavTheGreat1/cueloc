import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../database/models/alarm_realm_model.dart';
import 'coordinates.dart';
import 'trigger_on.dart';

part 'alarm_form.freezed.dart';
part 'alarm_form.g.dart';

@Freezed()
class AlarmForm with _$AlarmForm {
  const AlarmForm._();

  const factory AlarmForm({
    required String id,
    required String label,
    required Coordinates coordinates,
    required double radius,
    required TriggerOn triggerOn,
    required bool isActive,
  }) = _AlarmForm;

  factory AlarmForm.fromJson(Map<String, dynamic> json) =>
      _$AlarmFormFromJson(json);

  factory AlarmForm.raw() {
    Uuid uuid = const Uuid();
    return AlarmForm(
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

  factory AlarmForm.fromRealmModel(AlarmRealmModel alarmRealmModel) {
    return AlarmForm(
      id: alarmRealmModel.id,
      label: alarmRealmModel.label,
      coordinates: Coordinates.fromRealmModel(alarmRealmModel.coordinates!),
      radius: alarmRealmModel.radius,
      triggerOn: TriggerOnExt.fromName(alarmRealmModel.triggerOn),
      isActive: alarmRealmModel.isActive,
    );
  }
}
