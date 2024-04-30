import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controllers/location_alarm_controller.dart';
import '../../maps.dart';
import '../../models/coordinates.dart';

class TriggeredAlarmScreen extends HookConsumerWidget {
  const TriggeredAlarmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final alarm = ref.watch(runningAlarmProvider)!;
    final screenSize = MediaQuery.sizeOf(context);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('CueLoc'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  alarm.label,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: SizedBox(
                    height: screenSize.height / 1.9,
                    child: Maps(
                      initialLatLng: alarm.coordinates.toLatLng,
                      initialSelectedLatLng: alarm.coordinates,
                      radius: alarm.radius,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Alarm Destination Reached!",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(locationAlarmControllerProvider
                                        .notifier)
                                    .stopAlarm(alarm);
                              },
                              child: const Text(
                                "STOP",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
