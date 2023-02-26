import 'package:geolocator/geolocator.dart';

class AppInitializerService {
  AppInitializerService._private();

  static AppInitializerService instance = AppInitializerService._private();

  Future<void> initialize() async {
    await Geolocator.requestPermission();
  }
}
