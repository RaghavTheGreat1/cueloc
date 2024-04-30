import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../gen/assets.gen.dart';
import '../models/ringtone.dart';

final appRintonesProvider = Provider<List<Ringtone>>((ref) {
  final ringtones = [
    Ringtone(
      id: '1',
      title: 'Morning',
      uri: Assets.alarmSounds.morning,
    ),
    Ringtone(
      id: '2',
      title: 'Sunrise',
      uri: Assets.alarmSounds.sunrise,
    ),
  ];
  return ringtones;
});
