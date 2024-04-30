import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../../app_permissions/providers/app_permissions_controller.dart';
import '../../settings/widgets/settings_card.dart';
import '../../widgets/list_tile/loader_list_tile.dart';

class AppPermissionsView extends StatelessWidget {
  const AppPermissionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            SettingsCard(
              title: "Location",
              subSections: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "We need your location to set & trigger alarms based on your location. \nPsst! We don't store/share your location data.",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Column(
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final location = ref.watch(
                            appPermissionsControllerProvider.select(
                                (value) => value.value?.isLocationGranted));
                        return LoaderListTile(
                          onTap: () async {
                            await ref
                                .read(appPermissionsControllerProvider.notifier)
                                .requestLocationService();
                          },
                          title: Text(
                            'Location',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "App needs you to turn on your 'location' permission so as to trigger alarms based on device's your location",
                            style: theme.textTheme.bodySmall,
                          ),
                          trailing: location != null && location
                              ? Icon(
                                  UniconsSolid.check_circle,
                                  color: theme.colorScheme.onPrimaryContainer,
                                )
                              : Icon(
                                  UniconsSolid.times_circle,
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                        );
                      },
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final alwaysOnLocation = ref.watch(
                            appPermissionsControllerProvider.select((value) =>
                                value.value?.isAlwaysOnLocationGranted));
                        return LoaderListTile(
                          onTap: () async {
                            await ref
                                .read(appPermissionsControllerProvider.notifier)
                                .requestLocationAlwaysOnService();

                            print('stuck');
                          },
                          title: Text(
                            'Always On Location',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "App needs your 'always on location' permission to trigger alarms based on device's your location",
                            style: theme.textTheme.bodySmall,
                          ),
                          trailing: alwaysOnLocation != null && alwaysOnLocation
                              ? Icon(
                                  UniconsSolid.check_circle,
                                  color: theme.colorScheme.onPrimaryContainer,
                                )
                              : Icon(
                                  UniconsSolid.times_circle,
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
            SettingsCard(
              title: 'Others',
              subSections: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "We need your permission to show alarm notifications & make app work in background",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Column(
                  children: [
                    const Gap(16),
                    Consumer(
                      builder: (context, ref, child) {
                        final notifications = ref.watch(
                            appPermissionsControllerProvider.select((value) =>
                                value.value?.isAppNotificationsAllowed));
                        return LoaderListTile(
                          onTap: () async {
                            await ref
                                .read(appPermissionsControllerProvider.notifier)
                                .requestNotificationService();
                          },
                          title: Text(
                            'Notifications',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "App needs you to turn on your 'notifications' permission so as to show notifications",
                            style: theme.textTheme.bodySmall,
                          ),
                          trailing: notifications != null && notifications
                              ? Icon(
                                  UniconsSolid.check_circle,
                                  color: theme.colorScheme.onPrimaryContainer,
                                )
                              : Icon(
                                  UniconsSolid.times_circle,
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
