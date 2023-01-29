import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/database/services/alarm_realm_services.dart';
import 'package:realm/realm.dart';

import '../database/models/alarm_realm_model.dart';

final alarmsStreamProvider =
    StreamProvider<RealmResultsChanges<AlarmRealmModel>>((ref) {
  final realm = AlarmRealmServices();
  return realm.getAlarms();
});
