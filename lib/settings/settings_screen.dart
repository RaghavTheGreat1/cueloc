import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: IconButton(
        onPressed: () async {
          context.go('/pick-audio');
        },
        icon: const Icon(
          FeatherIcons.upload,
        ),
      ),
    );
  }
}
