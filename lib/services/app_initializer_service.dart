import 'package:alarm/alarm.dart' as alarm;
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

class AppInitializerService {
  AppInitializerService._private();

  static AppInitializerService instance = AppInitializerService._private();

  Future<void> initialize() async {
    await AndroidAlarmManager.initialize();

    await alarm.Alarm.init();
  }
}
