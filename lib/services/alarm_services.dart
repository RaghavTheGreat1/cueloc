import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/alarm.dart';
import '../providers/active_alarms_provider.dart';

final activeAlarmsServicesProvider = Provider<AlarmServices>((ref) {
  final activeAlarms = ref.watch(activeAlarmsProvider);
  return AlarmServices(
    ref,
    activeAlarms: activeAlarms,
  );
});

class AlarmServices {
  AlarmServices(
    this.ref, {
    required this.activeAlarms,
  }) {
    Geolocator.getPositionStream().listen((event) {
      print(event); 
    });
  }
  final Ref ref;

  final List<Alarm> activeAlarms;
}
