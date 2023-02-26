import 'package:flutter/material.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/models/coordinates.dart';
import 'package:map_my_nap/widgets/cupertino_back_button.dart';

import '../../maps.dart';

class AlarmPreviewScreen extends StatelessWidget {
  const AlarmPreviewScreen({
    super.key,
    required this.alarm,
  });

  final Alarm alarm;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

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
                            child: Maps(
                              initialLatLng: alarm.coordinates.toLatLng,
                              initialSelectedLatLng: alarm.coordinates,
                              radius: alarm.radius,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        alarm.label,
                        style: theme.textTheme.displaySmall,
                      ),
                      const SizedBox(
                        height: 24,
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
                          onPressed: () {},
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
