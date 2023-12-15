import '../../models/alarm.dart';

import '../models/alarm_realm_model.dart';

class RealmModelParsers {
  static List<Alarm> parseAlarmRealmModelList(List<AlarmRealmModel> list) {
    List<Alarm> alarms = [];
    for (int i = 0; i < list.length; i++) {
      alarms.add(
        Alarm.fromRealmModel(list[i]),
      );
    }
    return alarms;
  }
}
