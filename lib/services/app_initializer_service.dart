import 'package:alarm/alarm.dart' as alarm;
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInitializerService {
  AppInitializerService._private();

  static AppInitializerService instance = AppInitializerService._private();

  Future<void> initialize() async {
    await AndroidAlarmManager.initialize();
    GoogleFonts.config.allowRuntimeFetching = false;
    await alarm.Alarm.init();
  }

  Future<void> registerLicenses() async {
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('assets/fonts/Rubik/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  }
}
