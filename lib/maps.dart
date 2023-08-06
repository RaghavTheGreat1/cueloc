import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_my_nap/extensions/lat_lng_extension.dart';
import 'package:map_my_nap/models/coordinates.dart';
import 'package:map_my_nap/services/location_services.dart';

class Maps extends StatefulWidget {
  const Maps({
    super.key,
    this.initialLatLng,
    required this.radius,
    this.onLocationSelect,
    this.initialSelectedLatLng,
  });

  final LatLng? initialLatLng;
  final Coordinates? initialSelectedLatLng;
  final double radius;

  final ValueChanged<Coordinates>? onLocationSelect;

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController controller;

  late LatLng currentLocation;

  late Set<Marker> markers;

  late Set<Circle> circles;

  @override
  void initState() {
    super.initState();

    currentLocation = const LatLng(13.004033, 77.6079901);
    if (widget.initialLatLng == null) {
      getCurrentLocation();
    } else {
      currentLocation = widget.initialLatLng!;
    }

    markers = widget.initialSelectedLatLng != null
        ? {
            Marker(
              markerId: const MarkerId("alarm_location"),
              position: widget.initialSelectedLatLng!.toLatLng,
            ),
          }
        : {};
  }

  void getCurrentLocation() async {
    try {
      final coordinates = await LocationServices.getCurrentLocation();
      currentLocation = coordinates.toLatLng;
    } catch (e) {
      currentLocation = const LatLng(13.004033, 77.6079901);
    }
  }

  @override
  void didUpdateWidget(covariant Maps oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.radius != widget.radius) {
      controller
          .animateCamera(CameraUpdate.zoomTo(14 - ((widget.radius / 2000))));
    }
    if (oldWidget.radius != widget.radius) {
      controller
          .animateCamera(CameraUpdate.zoomTo(14 - ((widget.radius / 2000))));
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    circles = {
      Circle(
        circleId: const CircleId("radius"),
        fillColor: theme.colorScheme.primary.withOpacity(0.15),
        center: currentLocation,
        radius: widget.radius,
        strokeWidth: 1,
        strokeColor: theme.colorScheme.primary,
      ),
    };
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: currentLocation,
        zoom: 14,
      ),
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
      markers: markers,
      onTap: (argument) {
        if (widget.onLocationSelect != null) {
          setState(() {
            currentLocation = argument;
            markers = {
              Marker(
                markerId: const MarkerId("alarm_location"),
                position: currentLocation,
              ),
            };
            circles = {
              Circle(
                circleId: const CircleId("radius"),
                fillColor: theme.colorScheme.primary.withOpacity(0.15),
                center: currentLocation,
                radius: widget.radius,
                strokeWidth: 1,
                strokeColor: theme.colorScheme.primary,
              ),
            };
            controller.animateCamera(CameraUpdate.newLatLng(currentLocation));
            widget.onLocationSelect?.call(argument.toCoordinates);
          });
        }
      },
      circles: circles,
      onMapCreated: (value) async {
        controller = value;
        if (widget.initialLatLng == null) {
          final coordinates = await LocationServices.getCurrentLocation();
          final latLng = coordinates.toLatLng;
          controller.animateCamera(
            CameraUpdate.newLatLng(latLng),
          );
        }
      },
      gestureRecognizers: {
        Factory<OneSequenceGestureRecognizer>(
          () {
            return EagerGestureRecognizer();
          },
        ),
      },
    );
  }
}
