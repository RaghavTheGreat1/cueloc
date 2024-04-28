import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_preferences/providers/app_user_preferences_provider.dart';

final userLocationStreamProvider = StreamProvider<Position>((ref) async* {
  final locationAccuracy = ref.watch(appUserPreferencesProvider
      .select((value) => value.value?.locationAccuracy));
  final geolocatorStream = Geolocator.getPositionStream(
    locationSettings: LocationSettings(
      accuracy: locationAccuracy ?? LocationAccuracy.low,
    ),
  );

  await for (final position in geolocatorStream) {
    print('locationAccuracy: $locationAccuracy');
    yield position;
  }
});
