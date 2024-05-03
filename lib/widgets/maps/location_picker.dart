import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_preferences/providers/app_user_preferences_controller_provider.dart';
import '../../extensions/lat_lng_extension.dart';
import '../../models/coordinates.dart';
import '../../services/location_services.dart';

class LocationPicker extends StatefulHookConsumerWidget {
  const LocationPicker({
    super.key,
    this.initialLatLng,
    required this.radius,
    this.onLocationSelect,
    this.initialMarkers = const {},
    this.initialSelectedLatLng,
    this.validator,
  });

  final LatLng? initialLatLng;
  final Set<Marker>? initialMarkers;
  final LatLng? initialSelectedLatLng;
  final double radius;
  final ValueChanged<Coordinates>? onLocationSelect;

  final String? Function(LatLng?)? validator;

  @override
  ConsumerState<LocationPicker> createState() => _MapPickerState();
}

class _MapPickerState extends ConsumerState<LocationPicker>
    with WidgetsBindingObserver {
  late final ValueNotifier<LatLng?> selectedLocation;

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

    selectedLocation = ValueNotifier(widget.initialSelectedLatLng);
    currentLocation = const LatLng(13.004033, 77.6079901);
    if (widget.initialLatLng == null) {
      getCurrentLocation();
    } else {
      currentLocation = widget.initialLatLng!;
    }

    markers = widget.initialMarkers?.toSet() ?? {};
    if (widget.initialSelectedLatLng != null) {
      markers.add(Marker(
        markerId: const MarkerId("alarm_location"),
        position: widget.initialSelectedLatLng!,
      ));
    }
  }

  @override
  void didUpdateWidget(covariant LocationPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.radius != widget.radius) {
      controller
          .animateCamera(CameraUpdate.zoomTo(14 - ((widget.radius / 2000))));
    }

    if (oldWidget.initialMarkers != widget.initialMarkers) {
      markers = widget.initialMarkers?.toSet() ?? {};
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
    return FormField(
      initialValue: widget.initialSelectedLatLng,
      validator: widget.validator,
      builder: (formState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: formState.hasError
                      ? Border.all(
                          color: theme.colorScheme.error,
                          width: 1,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: GoogleMap(
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
                              fillColor:
                                  theme.colorScheme.primary.withOpacity(0.15),
                              center: currentLocation,
                              radius: widget.radius,
                              strokeWidth: 1,
                              strokeColor: theme.colorScheme.primary,
                            ),
                          };
                          controller.animateCamera(
                              CameraUpdate.newLatLng(currentLocation));
                          selectedLocation.value = argument;
                          widget.onLocationSelect?.call(argument.toCoordinates);

                          formState.didChange(argument);
                        });
                      }
                    },
                    circles: circles,
                    onMapCreated: (value) async {
                      controller = value;
                      if (widget.initialLatLng == null) {
                        final coordinates =
                            await LocationServices.getCurrentLocation();
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
                  ),
                ),
              ),
            ),
            const Gap(8),
            formState.hasError
                ? Text(
                    'Pick a location',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
