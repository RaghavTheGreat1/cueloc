import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/alarm_form.dart';
import 'realm_alarm_repository.dart';

final alarmRepositoryProvider = Provider<AlarmRepository>((ref) {
  return RealmAlarmRepository();
});

abstract class AlarmRepository {
  Future<List<AlarmForm>> fetchAllAlarms();

  Future<void> addAlarm(AlarmForm alarm);

  Future<void> updateAlarm(AlarmForm alarm);

  Future<List<AlarmForm>> fetchAlarms(
      {required int startIndex, required int endIndex});

  Stream<List<AlarmForm>> streamAlarms();

  Future<void> toggleAlarm(AlarmForm alarm, bool isActive);

  Future<void> deleteAlarm(AlarmForm alarm);
}
