import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/providers/alarms_stream_provider.dart';

final activeAlarmsProvider = StateProvider<List<Alarm>>((ref) {
  final alarms = ref.watch(allAlarmsStreamProvider);
  return alarms.value ?? [];
});
