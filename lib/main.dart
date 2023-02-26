import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/router/router.dart';
import 'package:map_my_nap/services/app_initializer_service.dart';
import 'package:map_my_nap/themes/light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppInitializerService.instance.initialize();
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
    final router = ref.read(routerServiceProvider);
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: lightTheme(),
    );
  }
}
