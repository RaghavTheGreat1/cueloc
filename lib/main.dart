import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_permissions/providers/app_permissions_controller.dart';
import 'controllers/location_alarm_controller.dart';
import 'providers/location_stream_provider.dart';
import 'router/router.dart';
import 'services/app_initializer_service.dart';
import 'themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializerService.instance.initialize();

  runApp(
    const ProviderScope(
      child: MapMyNap(),
    ),
  );
}

class MapMyNap extends HookConsumerWidget {
  const MapMyNap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerServiceProvider);

    return _EagerInitialization(
      child: WillStartForegroundTask(
        onWillStart: () async {
          // Return whether to start the foreground service.
          return true;
        },
        androidNotificationOptions: AndroidNotificationOptions(
          channelId: 'notification_channel_id',
          channelName: 'Foreground Notification',
          channelDescription:
              'This notification appears when the foreground service is running.',
          channelImportance: NotificationChannelImportance.LOW,
          priority: NotificationPriority.LOW,
          isSticky: false, // important
          iconData: const NotificationIconData(
            resType: ResourceType.mipmap,
            resPrefix: ResourcePrefix.ic,
            name: 'launcher',
          ),
        ),
        iosNotificationOptions: const IOSNotificationOptions(
          showNotification: true,
          playSound: false,
        ),
        foregroundTaskOptions: const ForegroundTaskOptions(
          interval: 5000,
          isOnceEvent: false,
          allowWakeLock: false,
          allowWifiLock: false,
        ),
        notificationTitle: 'Foreground Service is running',
        notificationText: 'Tap to return to the app',
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
          theme: lightTheme(),
        ),
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appPermissionsControllerProvider);
    ref.watch(locationStreamProvider);
    ref.watch(locationAlarmControllerProvider.future);
    return child;
  }
}
