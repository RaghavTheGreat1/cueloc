import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_preferences/providers/app_user_preferences_controller_provider.dart';
import '../../models/coordinates.dart';

class MapsPreview extends StatefulHookConsumerWidget {
  const MapsPreview({
    super.key,
    required this.coordinates,
    required this.radius,
  });

  final Coordinates coordinates;
  final double radius;

  @override
  ConsumerState<MapsPreview> createState() => _MapsPreviewState();
}

class _MapsPreviewState extends ConsumerState<MapsPreview>
    with WidgetsBindingObserver {
  late String darkMapStyle;
  late String lightMapStyle;

  late GoogleMapController controller;

  late LatLng currentLocation;

  late Set<Marker> markers;

  late Set<Circle> circles;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future(() async {
      await loadMapStyles();
      await setMapStyle();
    });

    currentLocation = widget.coordinates.toLatLng;

    markers = {
      Marker(
        markerId: const MarkerId("alarm_location"),
        position: currentLocation,
      ),
    };
  }

  @override
  void didUpdateWidget(covariant MapsPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.coordinates != widget.coordinates) {
      currentLocation = widget.coordinates.toLatLng;
      markers = {
        Marker(
          markerId: const MarkerId("alarm_location"),
          position: currentLocation,
        ),
      };
      controller.animateCamera(
        CameraUpdate.newLatLng(currentLocation),
      );
      setState(() {});
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
    return AbsorbPointer(
      absorbing: true,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 12,
        ),
        myLocationButtonEnabled: false,
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        markers: markers,
        circles: circles,
        onMapCreated: (value) async {
          controller = value;
          await setMapStyle();
        },
      ),
    );
  }
}
