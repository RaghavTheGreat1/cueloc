import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../database/models/alarm_realm_model.dart';

part 'coordinates.freezed.dart';

@Freezed()
class Coordinates with _$Coordinates {
  const Coordinates._();
  
  const factory Coordinates({
    required double latitude,
    required double longitude,
  }) = _Coordinates;

  factory Coordinates.raw() {
    return const Coordinates(latitude: 0, longitude: 0);
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
