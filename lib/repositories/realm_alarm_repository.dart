import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';

import '../database/models/alarm_realm_model.dart';
import '../database/services/realm_model_parsers.dart';
import '../models/alarm_form.dart';
import 'alarm_repository.dart';

class RealmAlarmRepository extends AlarmRepository {
  late final Realm realm;

  RealmAlarmRepository() {
    final config = Configuration.local(
      [AlarmRealmModel.schema, CoordinatesRealmModel.schema],
      schemaVersion: 0,
    );

    realm = Realm(config);
  }

  @override
  Future<void> addAlarm(AlarmForm alarm) async {
    await realm.writeAsync<AlarmRealmModel>(() {
      return realm.add<AlarmRealmModel>(alarm.toRealmModel());
    });
  }

  Stream<RealmResultsChanges<AlarmRealmModel>> getAlarms() {
    return realm.all<AlarmRealmModel>().changes;
  }

  @override
  Future<List<AlarmForm>> fetchAllAlarms() async {
    final alarmsAsRealmModel = realm.all<AlarmRealmModel>().toList();

    final alarms = await compute(
        RealmModelParsers.parseAlarmRealmModelList, alarmsAsRealmModel);
    return alarms;
  }

  @override
  Stream<List<AlarmForm>> streamAlarms() async* {
    final alarmsAsRealmModelStream = realm.all<AlarmRealmModel>().changes;
    await for (final event in alarmsAsRealmModelStream) {
      final realmAlarms = event.results.toList();
      yield RealmModelParsers.parseAlarmRealmModelList(realmAlarms);
    }
  }

  @override
  Future<List<AlarmForm>> fetchAlarms(
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

  @override
  Future<void> toggleAlarm(AlarmForm alarm, bool isActive) async {
    final realmObjectToToggle = realm.find<AlarmRealmModel>(alarm.id);

    if (realmObjectToToggle != null) {
      await realm.writeAsync(
        () {
          realmObjectToToggle.isActive = isActive;
        },
      );
    }
  }

  @override
  Future<void> deleteAlarm(AlarmForm alarm) async {
    final realmObjectToDelete = realm.find<AlarmRealmModel>(alarm.id);

    if (realmObjectToDelete != null) {
      await realm
          .writeAsync(() => realm.delete<AlarmRealmModel>(realmObjectToDelete));
    }
  }

  @override
  Future<void> updateAlarm(AlarmForm alarm) async {
    final realmObjectToToggle = realm.find<AlarmRealmModel>(alarm.id);

    if (realmObjectToToggle != null) {
      await realm.writeAsync(
        () {
          realm.delete<AlarmRealmModel>(realmObjectToToggle);
          realm.add(alarm.toRealmModel());
        },
      );
    }
  }
}
