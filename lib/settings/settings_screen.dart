import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: IconButton(
        onPressed: () async {},
        icon: const Icon(
          FeatherIcons.upload,
        ),
      ),
    );
  }
}
