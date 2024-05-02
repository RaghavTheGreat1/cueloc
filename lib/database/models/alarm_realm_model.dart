import 'package:realm/realm.dart';

part 'alarm_realm_model.realm.dart';

@RealmModel()
class _AlarmRealmModel {
  @PrimaryKey()
  late String id;

  late String label;
  late _CoordinatesRealmModel? coordinates;
  late double radius;
  late String triggerOn;
  late bool isActive = false;
  late String notes;
}

@RealmModel()
class _CoordinatesRealmModel {
  late double latitude;
  late double longitude;
}
