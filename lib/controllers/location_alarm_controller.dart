import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/providers/alarms_stream_provider.dart';
import 'package:map_my_nap/providers/location_stream_provider.dart';

final locationAlarmControllerProvider =
    StateNotifierProvider<LocationAlarmControllerNotifier, AsyncValue<void>>(
        (ref) {
  final activeAlarms = ref.watch(allAlarmsStreamProvider);
  return LocationAlarmControllerNotifier(
    ref,
    activeAlarms: activeAlarms.value ?? [],
  );
});

class LocationAlarmControllerNotifier extends StateNotifier<AsyncValue<void>> {
  LocationAlarmControllerNotifier(
    this.ref, {
    this.activeAlarms = const [],
  }) : super(const AsyncValue.data(null));

  final Ref ref;
  late final ProviderSubscription<AsyncValue<Position>>
      locationStreamSubscription;

  final List<Alarm> activeAlarms;

  initialize() {
    locationStreamSubscription =
        ref.listen(locationStreamProvider, (previous, next) {});
  }

  checkUserInAlarmRegion(Position position) {
    // TODO: Check if user is in the region of any active alarm.
  }

  /// This method is called when the user gets into the specified area radius of the alarm.
  triggerAlarm() {
    // TODO: Alert through notification.
    // TODO: Mark Alarm as Inactive.
  }

  stopAlarm() {
    // TODO: Stop the alarm when user gets out of the specified area radius of the alarm or when user taps on stop.
  }

  closeLocationStream() {
    locationStreamSubscription.close();
  }
}
