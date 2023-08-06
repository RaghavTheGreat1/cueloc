import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/controllers/location_alarm_controller.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/models/form_type.dart';
import 'package:map_my_nap/screens/home/home_screen.dart';
import 'package:map_my_nap/screens/triggered_alarm/triggered_alarm_screen.dart';

import '../screens/alarm_form/alarm_form_screen.dart';

final routerServiceProvider = Provider<GoRouter>((ref) {
  final router = RouterService(ref);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: router._routes,
    redirect: router.redirect,
  );
});

class RouterService extends ChangeNotifier {
  RouterService(
    this.ref,
  );

  final Ref ref;

  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    String? redirectPath;

    final alarm = ref.watch(runningAlarmProvider);

    if (alarm != null) {
      redirectPath = '/triggered/${alarm.id}';
    }
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
            path: 'triggered/:alarmId',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                transitionsBuilder: rightToLeftFadeTransition,
                child: const TriggeredAlarmScreen(),
              );
            },
          ),
          GoRoute(
            path: 'alarm/:operation/:busStopId',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                transitionsBuilder: rightToLeftFadeTransition,
                child: AlarmFormScreen(
                  formType: FormTypeExt.fromString(
                      state.pathParameters['operation'].toString()),
                  alarm:
                      state.extra == null ? Alarm.raw() : state.extra as Alarm,
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
