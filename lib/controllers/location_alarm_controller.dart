import 'dart:async';

import 'package:alarm/alarm.dart' as alarm_plugin;
import 'package:alarm/model/alarm_settings.dart' as alarm_plugin_settings;
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../gen/assets.gen.dart';
import '../models/alarm_form.dart';
import '../providers/alarms_stream_provider.dart';
import '../providers/user_location_stream_provider.dart';
import '../repositories/alarm_repository.dart';

final runningAlarmProvider = StateProvider<AlarmForm?>((ref) {
  return null;
});

final locationAlarmControllerProvider =
    AsyncNotifierProvider<LocationAlarmControllerNotifier, void>(
  LocationAlarmControllerNotifier.new,
);

class LocationAlarmControllerNotifier extends AsyncNotifier<void> {
  AlarmRepository get _alarmRepository => ref.watch(alarmRepositoryProvider);

  late final ProviderSubscription<AsyncValue<Position>>
      _locationStreamSubscription;

  @override
  build() async {
    debugPrint("INITIALIZE LOCATION STREAM");
    _locationStreamSubscription = ref.listen<AsyncValue<Position>>(
      userLocationStreamProvider,
      (previous, next) {
        next.whenData((position) async {
          final readyToTriggerAlarms = checkUserInRegionAlarms(next.value!);

          if (readyToTriggerAlarms.isNotEmpty) {
            await triggerAlarm(readyToTriggerAlarms.first);
          }
        });
      },
      onError: (error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace, label: error.toString());
      },
      fireImmediately: true,
    );
  }

  List<AlarmForm> checkUserInRegionAlarms(Position position) {
    final activeAlarms = ref.read(activeAlarmsStreamProvider).value ?? [];
    final locationReachedAlarms = activeAlarms.where((element) {
      final distance = Geolocator.distanceBetween(
        element.coordinates.latitude,
        element.coordinates.longitude,
        position.latitude,
        position.longitude,
      );
      return distance <= element.radius;
    });

    return locationReachedAlarms.toList();
  }

  /// This method is called when the user gets into the specified area radius of the alarm.
  Future<void> triggerAlarm(AlarmForm alarm) async {
    if (alarm_plugin.Alarm.hasAlarm()) {
      return;
    }
    final id = alarmIntHash(alarm);
    final alarmSettings = alarm_plugin_settings.AlarmSettings(
      id: id,
      dateTime: DateTime.now().add(const Duration(seconds: 2)),
      assetAudioPath: Assets.alarmSounds.morning,
      loopAudio: true,
      vibrate: false,
      fadeDuration: 3.0,
      notificationTitle: alarm.label,
      notificationBody: 'You have reached your location',
      enableNotificationOnKill: true,
    );
    final isAlarmSet = await alarm_plugin.Alarm.set(
      alarmSettings: alarmSettings,
    );

    if (isAlarmSet) {
      ref.read(runningAlarmProvider.notifier).state = alarm;
      FlutterForegroundTask.wakeUpScreen();
      FlutterForegroundTask.launchApp();
      try {
        AndroidAlarmManager.oneShot(
          const Duration(seconds: 2),
          id,
          LocationAlarmControllerNotifier.launchApp,
          alarmClock: true,
          exact: true,
          wakeup: true,
          rescheduleOnReboot: true,
        );
      } catch (e, stack) {
        debugPrintStack(stackTrace: stack, label: e.toString());
      }
    }
  }

  Future<void> stopAlarm(AlarmForm alarm) async {
    if (alarm_plugin.Alarm.hasAlarm()) {
      final id = alarmIntHash(alarm);
      await alarm_plugin.Alarm.stop(id);
      await AndroidAlarmManager.cancel(id);
      await _alarmRepository.toggleAlarm(alarm, false);
      ref.read(runningAlarmProvider.notifier).state = null;
    }
  }

  closeLocationStream() {
    _locationStreamSubscription.close();
  }

  static launchApp() {
    FlutterForegroundTask.launchApp();
  }

  int alarmIntHash(AlarmForm alarm) {
    final coordinatesSum =
        alarm.coordinates.latitude + alarm.coordinates.longitude;

    final coordinatesHash =
        int.parse(coordinatesSum.toString().split('.').join().substring(7));
    return coordinatesHash;
  }
}
