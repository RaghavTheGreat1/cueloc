import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/screens/home/home_screen.dart';
import 'package:map_my_nap/screens/new_alarm/new_alarm_screen.dart';

final navigationKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

final routerServiceProvider = Provider<GoRouter>((ref) {
  final router = RouterService(ref);
  final key = ref.read(navigationKeyProvider);
  return GoRouter(
    navigatorKey: key,
    routes: router._routes,
  );
});

class RouterService extends ChangeNotifier {
  RouterService(
    this.ref,
  );

  final Ref ref;

  final List<RouteBase> _routes = [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          transitionsBuilder: rightToLeftFadeTransition,
          child: const HomeScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'new',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: rightToLeftFadeTransition,
              child: const NewAlarmScreen(),
            );
          },
        ),
      ],
    ),
  ];
}

Widget rightToLeftFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(animation),
    child: FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    ),
  );
}

Widget bottomToTopFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(animation),
    child: FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    ),
  );
}
