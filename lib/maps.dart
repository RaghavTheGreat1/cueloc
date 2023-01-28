import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatelessWidget {
  const Maps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(1.1, 1.1),
        ),
        gestureRecognizers: {
          Factory<OneSequenceGestureRecognizer>(
            () {
              return EagerGestureRecognizer();
            },
          ),
        },
      ),
    );
  }
}
