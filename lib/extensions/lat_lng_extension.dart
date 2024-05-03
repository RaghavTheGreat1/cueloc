import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/coordinates.dart';

extension LatLngExt on LatLng {
  Coordinates get toCoordinates {
    return Coordinates(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
