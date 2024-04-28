import 'package:extension_utilities/extension_utilities.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../app_permissions/providers/app_permissions_controller.dart';
import '../app_preferences/providers/app_user_preferences_provider.dart';
import '../widgets/list_tile/loader_list_tile.dart';
import 'widgets/settings_card.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  Consumer(
                    builder: (context, ref, child) {
                      final appPreferencesAsync =
                          ref.watch(appUserPreferencesProvider);

                      return LoaderListTile(
                        onTap: () {
                          ref
                              .read(appUserPreferencesProvider.notifier)
                              .updateNextTheme();
                        },
                        isLoading: appPreferencesAsync.when(
                          data: (preferences) => false,
                          loading: () => true,
                          error: (error, stackTrace) {
                            debugPrintStack(
                                stackTrace: stackTrace,
                                label: error.toString());
                            return false;
                          },
                        ),
                        leading: Icon(
                          UniconsLine.brush_alt,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        title: const Text(
                          'Theme Mode',
                        ),
                        trailing: Text(
                          appPreferencesAsync.maybeWhen(
                            data: (preferences) =>
                                preferences.themeMode.name.capitalize(),
                            orElse: () => '',
                          ),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      );
                    },
                  ),
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
              Consumer(
                builder: (context, ref, child) {
                  final appPermissions = ref.watch(
                      appPermissionsControllerProvider
                          .select((value) => value.value));

                  return SettingsCard(
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
                        trailing: appPermissions != null &&
                                appPermissions.isGpsEnabled
                            ? Icon(
                                UniconsSolid.check_circle,
                                color: theme.colorScheme.onPrimaryContainer,
                              )
                            : Icon(
                                UniconsSolid.times_circle,
                                color: theme.colorScheme.onPrimaryContainer,
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
                        trailing: appPermissions != null &&
                                appPermissions.isAppNotificationsAllowed
                            ? Icon(
                                UniconsSolid.check_circle,
                                color: theme.colorScheme.onPrimaryContainer,
                              )
                            : Icon(
                                UniconsSolid.times_circle,
                                color: theme.colorScheme.onPrimaryContainer,
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
                        trailing: appPermissions != null &&
                                appPermissions.isBatteryOptimizationDisabled
                            ? Icon(
                                UniconsSolid.check_circle,
                                color: theme.colorScheme.onPrimaryContainer,
                              )
                            : Icon(
                                UniconsSolid.times_circle,
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                      ),
                    ],
                  );
                },
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
