import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userLocationStreamProvider = StreamProvider<Position>((ref) async* {
  final geolocatorStream = Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.low,
    ),
  );

  await for (final position in geolocatorStream) {
    yield position;
  }
});
