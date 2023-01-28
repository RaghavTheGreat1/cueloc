import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/models/alarm.dart';

final alarmFormProvider = StateProvider<Alarm>((ref) {
  return Alarm.raw();
});