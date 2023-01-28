import 'package:flutter/material.dart';
import 'package:map_my_nap/maps.dart';

void main() {
  runApp(const MapMyNap());
}

class MapMyNap extends StatelessWidget {
  const MapMyNap({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Maps(),
    );
  }
}
