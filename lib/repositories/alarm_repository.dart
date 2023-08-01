import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/repositories/realm_alarm_repository.dart';

final alarmRepositoryProvider = Provider<AlarmRepository>((ref) {
  return RealmAlarmRepository();
});

abstract class AlarmRepository {
  Future<List<Alarm>> fetchAllAlarms();

  Future<void> addAlarm(Alarm alarm);

  Future<List<Alarm>> fetchAlarms(
      {required int startIndex, required int endIndex});

  Stream<List<Alarm>> streamAlarms();

  Future<void> toggleAlarm(Alarm alarm, bool isActive);

  Future<void> deleteAlarm(Alarm alarm);
}
