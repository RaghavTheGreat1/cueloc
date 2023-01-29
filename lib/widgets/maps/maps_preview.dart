import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_my_nap/models/coordinates.dart';

class MapsPreview extends StatefulWidget {
  const MapsPreview({
    super.key,
    required this.coordinates,
    required this.radius,
  });

  final Coordinates coordinates;
  final double radius;

  @override
  State<MapsPreview> createState() => _MapsPreviewState();
}

class _MapsPreviewState extends State<MapsPreview> {
  late GoogleMapController controller;

  late LatLng currentLocation;

  late Set<Marker> markers;

  late Set<Circle> circles;

  @override
  void initState() {
    super.initState();

    currentLocation = widget.coordinates.toLatLng;

    markers = {
      Marker(
        markerId: const MarkerId("alarm_location"),
        position: currentLocation,
      ),
    };
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
    return AbsorbPointer(
      absorbing: true,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 12,
        ),
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        markers: markers,
        circles: circles,
        onMapCreated: (value) async {
          controller = value;
        },
      ),
    );
  }
}
