import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/controllers/location_alarm_controller.dart';
import 'package:map_my_nap/router/router.dart';
import 'package:map_my_nap/services/app_initializer_service.dart';
import 'package:map_my_nap/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInitializerService.instance.initialize();

  final container = ProviderContainer();

  await container.read(locationAlarmControllerProvider.notifier).initialize();

  runApp(
    UncontrolledProviderScope(
      container: container,
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
