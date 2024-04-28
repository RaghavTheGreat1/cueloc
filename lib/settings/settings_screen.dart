import 'package:feather_icons/feather_icons.dart';
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
              SettingsCard(
                title: 'Permissions',
                subSections: [
                  LoaderListTile(
                    leading: Icon(
                      UniconsLine.location_arrow,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    title: const Text(
                      'Location',
                    ),
                  ),
                  LoaderListTile(
                    leading: Icon(
                      FeatherIcons.bell,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    title: const Text(
                      'Notifications',
                    ),
                  ),
                  LoaderListTile(
                    leading: Icon(
                      FeatherIcons.battery,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    title: const Text(
                      'Battery Optimization',
                    ),
                  ),
                ],
              ),
              SettingsCard(
                title: 'About',
                subSections: [
                  LoaderListTile(
                    leading: Icon(
                      FeatherIcons.info,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    title: const Text(
                      'About',
                    ),
                  ),
                  LoaderListTile(
                    leading: Icon(
                      UniconsLine.copyright,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    title: const Text(
                      'Licenses',
                    ),
                  ),
                  LoaderListTile(
                    leading: Icon(
                      FeatherIcons.github,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    title: const Text(
                      'Source Code',
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
