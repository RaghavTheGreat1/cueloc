import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../maps.dart';
import '../../../models/alarm_form.dart';
import '../../../models/coordinates.dart';
import '../../../themes/custom_colors.dart';
import '../../../widgets/cupertino_back_button.dart';

class AlarmPreviewScreen extends StatelessWidget {
  const AlarmPreviewScreen({
    super.key,
    required this.alarm,
  });

  final AlarmForm alarm;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("CueLoc"),
        leading: const CupertinoBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: (alarm.isActive ? CustomColors.green : CustomColors.red)
                    .withOpacity(0.15),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  alarm.isActive ? "Active" : "Inactive",
                  style: TextStyle(
                    color:
                        alarm.isActive ? CustomColors.green : CustomColors.red,
                  ),
                ),
              ),
            ),
          )
        ],
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
                            height: screenSize.height / 1.9,
                            child: Maps(
                              initialLatLng: alarm.coordinates.toLatLng,
                              initialSelectedLatLng: alarm.coordinates,
                              radius: alarm.radius,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              alarm.label,
                              style: theme.textTheme.headlineLarge!.copyWith(
                                color: theme.colorScheme.onBackground,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  theme.colorScheme.primary.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "On ${alarm.triggerOn.name.substring(0, 1).toUpperCase()}${alarm.triggerOn.name.substring(1)}",
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${alarm.radius.toStringAsFixed(0)} m",
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
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
                          onPressed: () {
                            context.go(
                              '/alarm/edit/${alarm.id}',
                              extra: alarm,
                            );
                          },
                          child: const Text("EDIT"),
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
