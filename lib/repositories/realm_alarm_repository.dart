import 'package:flutter/foundation.dart';
import 'package:map_my_nap/database/models/alarm_realm_model.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:realm/realm.dart';

import '../database/services/realm_model_parsers.dart';
import 'alarm_repository.dart';

class RealmAlarmRepository extends AlarmRepository {
  late final Realm realm;

  RealmAlarmRepository() {
    final config = Configuration.local(
      [AlarmRealmModel.schema, CoordinatesRealmModel.schema],
      schemaVersion: 1,
    );

    realm = Realm(config);
  }

  @override
  void addAlarm(Alarm alarm) {
    realm.write(() {
      realm.add(alarm.toRealmModel());
    });
  }

  Stream<RealmResultsChanges<AlarmRealmModel>> getAlarms() {
    return realm.all<AlarmRealmModel>().changes;
  }

  @override
  Future<List<Alarm>> fetchAllAlarms() async {
    final alarmsAsRealmModel = realm.all<AlarmRealmModel>().toList();

    final alarms = await compute(
        RealmModelParsers.parseAlarmRealmModelList, alarmsAsRealmModel);
    return alarms;
  }

  @override
  Stream<List<Alarm>> streamAlarms() async* {
    final alarmsAsRealmModelStream = realm.all<AlarmRealmModel>().changes;
    await for (final event in alarmsAsRealmModelStream) {
      final realmAlarms = event.results.toList();

      yield RealmModelParsers.parseAlarmRealmModelList(realmAlarms);
    }
  }

  @override
  Future<List<Alarm>> fetchAlarms(
      {required int startIndex, required int endIndex}) async {
    final alarms = realm.all<AlarmRealmModel>();
    final size = alarms.length;
    // All items fetched condition
    if (startIndex >= size) {
      return [];
    }
    final start = startIndex;
    final end = endIndex > alarms.length ? alarms.length : (endIndex + 1);

    final sublistedRealmAlarms = alarms.toList().sublist(start, end);
    final sublistedAlarms = compute(
        RealmModelParsers.parseAlarmRealmModelList, sublistedRealmAlarms);
    return sublistedAlarms;
  }
}
