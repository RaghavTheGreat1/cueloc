import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/google_maps_marker_service.dart';

final googleMapsMarkerServiceProvider =
    Provider<GoogleMapsMarkersService>((ref) {
  return GoogleMapsMarkersService();
});
