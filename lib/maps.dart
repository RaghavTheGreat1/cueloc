import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_preferences/providers/app_user_preferences_controller_provider.dart';
import 'extensions/lat_lng_extension.dart';
import 'models/coordinates.dart';
import 'services/location_services.dart';

class Maps extends StatefulHookConsumerWidget {
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
  ConsumerState<Maps> createState() => _MapsState();
}

class _MapsState extends ConsumerState<Maps> with WidgetsBindingObserver {
  late GoogleMapController controller;

  late LatLng currentLocation;

  late Set<Marker> markers;

  late Set<Circle> circles;

  late String darkMapStyle;
  late String lightMapStyle;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future(() async {
      await loadMapStyles();
      await setMapStyle();
    });

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
  void didChangePlatformBrightness() {
    Future(() async {
      await setMapStyle();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void getCurrentLocation() async {
    try {
      final coordinates = await LocationServices.getCurrentLocation();
      currentLocation = coordinates.toLatLng;
    } catch (e) {
      currentLocation = const LatLng(13.004033, 77.6079901);
    }
  }

  Future loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString('map_styles/dark_theme.json');
    lightMapStyle = await rootBundle.loadString('map_styles/light_theme.json');
  }

  Future setMapStyle() async {
    final themeMode =
        ref.read(appUserPreferencesProvider).requireValue.themeMode;

    switch (themeMode) {
      case ThemeMode.system:
        final theme = View.of(context).platformDispatcher.platformBrightness;
        if (theme == Brightness.dark) {
          await controller.setMapStyle(darkMapStyle);
        } else {
          await controller.setMapStyle(lightMapStyle);
        }
        break;
      case ThemeMode.dark:
        await controller.setMapStyle(darkMapStyle);
        break;
      case ThemeMode.light:
        await controller.setMapStyle(lightMapStyle);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ref.listen(
      appUserPreferencesProvider
          .select((value) => value.requireValue.themeMode),
      (previous, next) async {
        await setMapStyle();
        setState(() {});
      },
    );
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
      myLocationEnabled: true,
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
          await controller.animateCamera(
            CameraUpdate.newLatLng(latLng),
          );
        }
        await setMapStyle();
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
