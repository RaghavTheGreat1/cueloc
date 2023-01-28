import 'package:realm/realm.dart';

part 'alarm_realm_model.g.dart';

@RealmModel()
class _AlarmRealmModel {
  @PrimaryKey()
  late final String id;

  late final String label;
  late final _CoordinatesRealmModel? coordinates;
  late final double radius;
  late final String triggerOn;
}

@RealmModel()
class _CoordinatesRealmModel {
  late final double latitude;
  late final double longitude;
}
