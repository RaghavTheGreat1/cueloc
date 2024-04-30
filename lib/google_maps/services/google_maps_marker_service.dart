import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../gen/assets.gen.dart';
import '../../models/alarm_form.dart';
import '../../models/coordinates.dart';

class GoogleMapsMarkersService {
  late final BitmapDescriptor activeAlarmMarker;
  late final BitmapDescriptor inActiveAlarmMarker;

  GoogleMapsMarkersService() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(32, 32),
      ),
      Assets.icons.alarm.path,
    ).then(
      (value) => activeAlarmMarker = value,
    );

    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(32, 32),
      ),
      Assets.icons.alarmBw.path,
    ).then((value) => inActiveAlarmMarker = value);
  }

  Marker getActiveAlarmMarker(AlarmForm alarm) {
    return Marker(
      markerId: MarkerId(alarm.id),
      position: alarm.coordinates.toLatLng,
      icon: activeAlarmMarker,
      infoWindow: InfoWindow(title: alarm.label),
    );
  }

  Marker getInactiveAlarmMarker(AlarmForm alarm) {
    return Marker(
      markerId: MarkerId(alarm.id),
      position: alarm.coordinates.toLatLng,
      icon: inActiveAlarmMarker,
      infoWindow: InfoWindow(title: alarm.label),
    );
  }
}
