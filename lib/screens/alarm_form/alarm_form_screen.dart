import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../builders/read_only_builder.dart';
import '../../models/alarm_form.dart';
import '../../models/form_type.dart';
import 'alarm_preview/alarm_preview_screen.dart';
import 'new_alarm/new_alarm_screen.dart';
import 'new_alarm/provider/alarm_form_provider.dart';

class AlarmFormScreen extends HookConsumerWidget {
  const AlarmFormScreen({
    super.key,
    required this.alarm,
    required this.formType,
  });

  final AlarmForm alarm;

  final FormType formType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool readOnly = formType == FormType.read ? true : false;
    return ProviderScope(
      overrides: [
        alarmFormProvider
            .overrideWith(() => AlarmFormNotifier(initialAlarm: alarm)),
      ],
      child: ReadOnlyBuilder(
        readOnly: readOnly,
        readView: AlarmPreviewScreen(
          alarm: alarm,
        ),
        editView: NewAlarmScreen(
          formType: formType,
        ),
      ),
    );
  }
}
