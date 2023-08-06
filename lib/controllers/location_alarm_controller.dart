import 'package:alarm/alarm.dart' as alarm_plugin;
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/alarm.dart';
import '../providers/alarms_stream_provider.dart';
import '../providers/location_stream_provider.dart';
import '../repositories/alarm_repository.dart';

final locationAlarmControllerProvider =
    StateNotifierProvider<LocationAlarmControllerNotifier, AsyncValue<void>>(
        (ref) {
  final alarmRepository = ref.watch(alarmRepositoryProvider);
  return LocationAlarmControllerNotifier(
    ref,
    alarmRepository: alarmRepository,
  );
});

final runningAlarmProvider = StateProvider<Alarm?>((ref) {
  return null;
});

final class LocationAlarmControllerNotifier
    extends StateNotifier<AsyncValue<void>> {
  LocationAlarmControllerNotifier(
    this.ref, {
    required this.alarmRepository,
  }) : super(const AsyncValue.data(null));

  final Ref ref;
  late final ProviderSubscription<AsyncValue<Position>>
      locationStreamSubscription;

  final AlarmRepository alarmRepository;

  void initialize() {
    locationStreamSubscription = ref.listen<AsyncValue<Position>>(
      locationStreamProvider,
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

  List<Alarm> checkUserInRegionAlarms(Position position) {
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
  Future<void> triggerAlarm(Alarm alarm) async {
    if (alarm_plugin.Alarm.hasAlarm()) {
      return;
    }

    final alarmSettings = alarm_plugin.AlarmSettings(
      id: 0,
      dateTime: DateTime.now().add(const Duration(seconds: 2)),
      assetAudioPath: 'assets/google_pixel_alarm.mp3',
      loopAudio: true,
      vibrate: false,
      fadeDuration: 3.0,
      notificationTitle: alarm.label,
      notificationBody: 'You have reached your location',
      enableNotificationOnKill: true,
      stopOnNotificationOpen: false,
    );
    final isAlarmSet = await alarm_plugin.Alarm.set(
      alarmSettings: alarmSettings,
    );

    if (isAlarmSet) {
      ref.read(runningAlarmProvider.notifier).state = alarm;
    }
  }

  Future<void> stopAlarm(Alarm alarm) async {
    if (alarm_plugin.Alarm.hasAlarm()) {
      await alarm_plugin.Alarm.stop(0);
      await alarmRepository.toggleAlarm(alarm, false);
      ref.read(runningAlarmProvider.notifier).state = null;
    }
  }

  closeLocationStream() {
    locationStreamSubscription.close();
  }
}
