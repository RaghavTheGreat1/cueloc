import 'package:geolocator/geolocator.dart';

extension LocationAccuracyExt on LocationAccuracy {
  String get displayName {
    String locationAccuracyDisplayName = '';
    switch (this) {
      case LocationAccuracy.lowest:
        locationAccuracyDisplayName = 'Lowest';
        break;
      case LocationAccuracy.low:
        locationAccuracyDisplayName = 'Low';
        break;
      case LocationAccuracy.medium:
        locationAccuracyDisplayName = 'Medium';
        break;
      case LocationAccuracy.high:
        locationAccuracyDisplayName = 'High';
        break;
      case LocationAccuracy.best:
        locationAccuracyDisplayName = 'Best';
        break;
      case LocationAccuracy.reduced:
        locationAccuracyDisplayName = 'Reduced';
        break;
      case LocationAccuracy.bestForNavigation:
        locationAccuracyDisplayName = 'Best for Navigation';
        break;
    }
    return locationAccuracyDisplayName;
  }
}
