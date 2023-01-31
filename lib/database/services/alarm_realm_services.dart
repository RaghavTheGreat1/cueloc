import 'package:map_my_nap/database/models/alarm_realm_model.dart';
import 'package:realm/realm.dart';

import '../../models/alarm.dart';

class AlarmRealmServices {
  late final Realm realm;

  AlarmRealmServices() {
    final config = Configuration.local(
      [AlarmRealmModel.schema, CoordinatesRealmModel.schema],
      schemaVersion: 1,
    );

    realm = Realm(config);
  }

  void addAlarm(Alarm alarm) {
    realm.write(() {
      realm.add(alarm.toRealmModel());
    });
  }

  Stream<RealmResultsChanges<AlarmRealmModel>> getAlarms() {
    return realm.all<AlarmRealmModel>().changes;
  }
}
