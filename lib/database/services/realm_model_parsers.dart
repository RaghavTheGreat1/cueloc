import '../../models/alarm_form.dart';
import '../models/alarm_realm_model.dart';

class RealmModelParsers {
  static List<AlarmForm> parseAlarmRealmModelList(List<AlarmRealmModel> list) {
    List<AlarmForm> alarms = [];
    for (int i = 0; i < list.length; i++) {
      alarms.add(
        AlarmForm.fromRealmModel(list[i]),
      );
    }
    return alarms;
  }
}
