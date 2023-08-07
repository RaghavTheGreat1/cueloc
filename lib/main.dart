import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/router/router.dart';
import 'package:map_my_nap/services/app_initializer_service.dart';
import 'package:map_my_nap/themes/light_theme.dart';

import 'controllers/location_alarm_controller.dart';
import 'providers/location_stream_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializerService.instance.initialize();

  final container = ProviderContainer();

  container.read(locationStreamProvider);
  container.read(locationAlarmControllerProvider.notifier).initialize();

  runApp(
    ProviderScope(
      parent: container,
      child: const MapMyNap(),
    ),
  );
}

class MapMyNap extends HookConsumerWidget {
  const MapMyNap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerServiceProvider);

    return WillStartForegroundTask(
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
    );
  }
}
