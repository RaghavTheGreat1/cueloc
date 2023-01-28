import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_my_nap/database/models/alarm_realm_model.dart';

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  factory Coordinates.raw() {
    return Coordinates(latitude: 0, longitude: 0);
  }

  CoordinatesRealmModel toRealmModel() {
    return CoordinatesRealmModel(latitude, longitude);
  }

  factory Coordinates.fromRealmModel(
      CoordinatesRealmModel coordinatesRealmModel) {
    return Coordinates(
      latitude: coordinatesRealmModel.latitude,
      longitude: coordinatesRealmModel.longitude,
    );
  }
}

extension CoordinatesExt on Coordinates {
  LatLng get toLatLng {
    return LatLng(
      latitude,
      longitude,
    );
  }
}
