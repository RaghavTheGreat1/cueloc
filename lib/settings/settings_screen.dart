import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../widgets/list_tile/loader_list_tile.dart';
import 'widgets/settings_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.list(
            children: [
              SettingsCard(
                title: 'General',
                subSections: [
                  LoaderListTile(
                    leading: Icon(
                      UniconsLine.music,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    title: const Text(
                      'Alarm Ringtone',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
