import 'package:geolocator/geolocator.dart';

import '../models/coordinates.dart';

extension PositionExtension on Position {
  Coordinates get toCoordinates {
    return Coordinates(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
