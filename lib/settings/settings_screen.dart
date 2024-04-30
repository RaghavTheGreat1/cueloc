import 'package:extension_utilities/extension_utilities.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../app_permissions/providers/app_permissions_controller.dart';
import '../app_preferences/providers/app_user_preferences_controller_provider.dart';
import '../extensions/location_accuracy_extension.dart';
import '../widgets/list_tile/loader_list_tile.dart';
import 'widgets/settings_card.dart';

class SettingsScreen extends StatefulHookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    final appPermissionsController =
        ref.read(appPermissionsControllerProvider.notifier);
    if (state == AppLifecycleState.resumed) {
      await appPermissionsController.checkAllPermissions();
    }
  }

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
                  Consumer(
                    builder: (context, ref, child) {
                      final locationAccuracy = ref.watch(
                          appUserPreferencesProvider.select(
                              (value) => value.value?.locationAccuracy));
                      return LoaderListTile(
                        leading: Icon(
                          FeatherIcons.mapPin,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        title: const Text(
                          'Location Accuracy',
                        ),
                        trailing: Text(
                          (locationAccuracy?.displayName ?? ''),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        onTap: () async {
                          await ref
                              .read(appUserPreferencesProvider.notifier)
                              .updateNextLocationAccuracy();
                        },
                      );
                    },
                  ),
                  LoaderListTile(
                    onTap: () {
                      context.go('/settings/pick-audio');
                    },
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
                        trailing: (appPermissions != null &&
                                    appPermissions.isLocationServicesEnabled
                                ? Icon(
                                    UniconsSolid.check_circle,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  )
                                : Icon(
                                    UniconsSolid.times_circle,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ))
                            .animate(
                              delay: const Duration(milliseconds: 200),
                            )
                            .fadeIn(
                              begin: 0,
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 500),
                            )
                            .slideY(
                              begin: 0.5,
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 500),
                            ),
                        onTap: () async {
                          await ref
                              .read(appPermissionsControllerProvider.notifier)
                              .requestLocationServices();
                        },
                      ),
                      LoaderListTile(
                        leading: Icon(
                          FeatherIcons.bell,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        title: const Text(
                          'Notifications',
                        ),
                        trailing: (appPermissions != null &&
                                    appPermissions.isAppNotificationsAllowed
                                ? Icon(
                                    UniconsSolid.check_circle,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  )
                                : Icon(
                                    UniconsSolid.times_circle,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ))
                            .animate(
                              delay: const Duration(milliseconds: 200),
                            )
                            .fadeIn(
                              begin: 0,
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 500),
                            )
                            .slideY(
                              begin: 0.5,
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 500),
                            ),
                        onTap: () async {
                          await ref
                              .read(appPermissionsControllerProvider.notifier)
                              .requestNotificationService();
                        },
                      ),
                      LoaderListTile(
                        leading: Icon(
                          FeatherIcons.battery,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        title: const Text(
                          'Battery Optimization',
                        ),
                        trailing: (appPermissions != null &&
                                    appPermissions.isBatteryOptimizationDisabled
                                ? Icon(
                                    UniconsSolid.check_circle,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  )
                                : Icon(
                                    UniconsSolid.times_circle,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ))
                            .animate(
                              delay: const Duration(milliseconds: 200),
                            )
                            .fadeIn(
                              begin: 0,
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 500),
                            )
                            .slideY(
                              begin: 0.5,
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 500),
                            ),
                        onTap: () async {
                          await ref
                              .read(appPermissionsControllerProvider.notifier)
                              .requestDisableBatteryOptimization();
                        },
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
                    onTap: () {
                      context.go('/settings/license');
                    },
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
