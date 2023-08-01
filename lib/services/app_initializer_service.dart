import 'package:alarm/alarm.dart' as alarm;
import 'package:geolocator/geolocator.dart';

class AppInitializerService {
  AppInitializerService._private();

  static AppInitializerService instance = AppInitializerService._private();

  Future<void> initialize() async {
    await Geolocator.requestPermission();
    await alarm.Alarm.init();
  }
}
