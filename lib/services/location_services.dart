import 'package:geolocator/geolocator.dart';
import 'package:map_my_nap/extensions/position_extension.dart';
import 'package:map_my_nap/models/coordinates.dart';

class LocationServices {
  /// Returns the current coordinates of device.
  /// 
  ///Throws a [TimeoutException] when no location is received within the supplied [timeLimit] duration.
  ///
  /// Throws a [LocationServiceDisabledException] when the user allowed access, but the location services of the device are disabled.
 static Future<Coordinates> getCurrentLocation() async {
    final location = await Geolocator.getCurrentPosition();

    return location.toCoordinates;
  }
}
