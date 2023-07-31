import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final locationStreamProvider = StreamProvider<Position>((ref) async* {
  await for (final locationStream in Geolocator.getPositionStream()) {
    yield locationStream;
  }
});
