import 'package:flutter/material.dart';
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
    final router = ref.read(routerServiceProvider);

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: lightTheme(),
    );
  }
}
