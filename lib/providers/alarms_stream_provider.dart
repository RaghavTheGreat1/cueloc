import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/repositories/alarm_repository.dart';

final alarmsStreamProvider = StreamProvider<List<Alarm>>((ref) {
  final alarmRepository = ref.watch(alarmRepositoryProvider);

  return alarmRepository.streamAlarms();
});
