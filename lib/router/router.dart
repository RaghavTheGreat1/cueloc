import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/controllers/location_alarm_controller.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/screens/alarm_preview/alarm_preview_screen.dart';
import 'package:map_my_nap/screens/home/home_screen.dart';
import 'package:map_my_nap/screens/new_alarm/new_alarm_screen.dart';

final routerServiceProvider = Provider<GoRouter>((ref) {
  final router = RouterService(ref);

  return GoRouter(
    routes: router._routes,
  );
});

class RouterService extends ChangeNotifier {
  RouterService(
    this.ref,
  );

  final Ref ref;
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    String? redirectPath;

    ref.listen(runningAlarmProvider, (previous, next) {

    });

    return redirectPath;
  }

  List<RouteBase> get _routes {
    return [
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
          GoRoute(
            path: 'preview/:id',
            pageBuilder: (context, state) {
              final alarm = state.extra as Alarm;
              return CustomTransitionPage(
                key: state.pageKey,
                transitionsBuilder: rightToLeftFadeTransition,
                child: AlarmPreviewScreen(
                  alarm: alarm,
                ),
              );
            },
          ),
            GoRoute(
            path: 'alarm/:id',
            pageBuilder: (context, state) {
              final alarm = state.extra as Alarm;
              return CustomTransitionPage(
                key: state.pageKey,
                transitionsBuilder: rightToLeftFadeTransition,
                child: AlarmPreviewScreen(
                  alarm: alarm,
                ),
              );
            },
          ),
        ],
      ),
    ];
  }
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
