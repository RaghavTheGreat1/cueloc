import 'package:alarm/alarm.dart' as alarm_plugin;
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/providers/alarms_stream_provider.dart';
import 'package:map_my_nap/providers/location_stream_provider.dart';
import 'package:map_my_nap/repositories/alarm_repository.dart';

final locationAlarmControllerProvider =
    StateNotifierProvider<LocationAlarmControllerNotifier, AsyncValue<void>>(
        (ref) {
  final activeAlarms = ref.watch(allAlarmsStreamProvider);
  final alarmRepository = ref.watch(alarmRepositoryProvider);
  return LocationAlarmControllerNotifier(
    ref,
    activeAlarms: activeAlarms.value ?? [],
    alarmRepository: alarmRepository,
  );
});

class LocationAlarmControllerNotifier extends StateNotifier<AsyncValue<void>> {
  LocationAlarmControllerNotifier(
    this.ref, {
    this.activeAlarms = const [],
    required this.alarmRepository,
  }) : super(const AsyncValue.data(null));

  final Ref ref;
  late final ProviderSubscription<AsyncValue<Position>>
      locationStreamSubscription;

  final AlarmRepository alarmRepository;

  final List<Alarm> activeAlarms;

  Future<void> initialize() async {
    locationStreamSubscription =
        ref.listen(locationStreamProvider, (previous, next) async {
      if (next.value != null) {
        final readyToTriggerAlarms = checkUserInRegionAlarms(next.value!);
        if (readyToTriggerAlarms.isNotEmpty) {
          await triggerAlarm(readyToTriggerAlarms.first);
        }
      }
    });
  }

  List<Alarm> checkUserInRegionAlarms(Position position) {
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
      dateTime: DateTime.now(),
      assetAudioPath: 'assets/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      fadeDuration: 3.0,
      notificationTitle: alarm.label,
      notificationBody: 'You have reached your location',
      enableNotificationOnKill: true,
      stopOnNotificationOpen: false,
    );
    final isAlarmSet = await alarm_plugin.Alarm.set(
      alarmSettings: alarmSettings,
    );

    if (isAlarmSet) {}
  }

  Future<void> stopAlarm(Alarm alarm) async {
    if (alarm_plugin.Alarm.hasAlarm()) {
      await alarm_plugin.Alarm.stop(0);
      await alarmRepository.toggleAlarm(alarm, false);
    }
  }

  closeLocationStream() {
    locationStreamSubscription.close();
  }
}
