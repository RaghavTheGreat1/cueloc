import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/models/coordinates.dart';
import 'package:map_my_nap/models/form_type.dart';
import 'package:map_my_nap/screens/alarm_form/new_alarm/provider/alarm_form_provider.dart';
import 'package:map_my_nap/widgets/cupertino_back_button.dart';
import 'package:map_my_nap/widgets/textfields/custom_text_field.dart';

import '../../../maps.dart';
import '../../../models/trigger_on.dart';
import 'widgets/radius_slider.dart';
import 'widgets/trigger_on_selector.dart';

class NewAlarmScreen extends ConsumerWidget {
  const NewAlarmScreen({
    super.key,
    this.initialAlarm,
    required this.formType,
  });

  final Alarm? initialAlarm;

  final FormType formType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    final alarmRef = ref.read(alarmFormProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Map My Nap"),
        leading: const CupertinoBackButton(),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 24.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          child: SizedBox(
                            height: 360,
                            child: HookConsumer(
                              builder: (context, ref, _) {
                                final radius = ref.watch(alarmFormProvider
                                    .select((value) => value.radius));
                                return Maps(
                                  initialLatLng:
                                      initialAlarm?.coordinates.toLatLng,
                                  initialSelectedLatLng:
                                      initialAlarm?.coordinates,
                                  radius: radius,
                                  onLocationSelect: (value) async {
                                    await alarmRef.updateCoordinates(value);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      CustomTextFormField(
                        key: const ValueKey("label"),
                        controller: ref
                            .read(alarmFormProvider.notifier)
                            .labelTextController,
                        label: "Label",
                        onChanged: (value) {
                          alarmRef.updateLabel(value);
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      RadiusSlider(
                        onChanged: (double value) {
                          alarmRef.updateRadius(value);
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TriggerOnSelector(
                        onChanged: (TriggerOn value) {
                          alarmRef.updateTriggerOn(value);
                        },
                      ),
                      const SizedBox(
                        height: 128,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                border: const Border(
                  top: BorderSide(
                    width: 0.1,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () async {
                            await alarmRef.saveAlarm(formType);
                          },
                          child: const Text("MAP IT"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
