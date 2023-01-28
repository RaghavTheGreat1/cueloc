import 'package:flutter/material.dart';
import 'package:map_my_nap/widgets/cupertino_back_button.dart';
import 'package:map_my_nap/widgets/textfields/custom_text_field.dart';

import '../../maps.dart';

class NewAlarmScreen extends StatelessWidget {
  const NewAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map My Nap"),
        leading: const CupertinoBackButton(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: const SizedBox(
                        height: 252,
                        child: Maps(),
                      ),
                    ),
                  ),
                  const CustomTextFormField(),
                  const RadiusSlider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadiusSlider extends StatefulWidget {
  const RadiusSlider({
    super.key,
  });

  @override
  State<RadiusSlider> createState() => _RadiusSliderState();
}

class _RadiusSliderState extends State<RadiusSlider> {
  ValueNotifier<double> sliderValue = ValueNotifier(250);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Radius (meters)",
              style: theme.textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: sliderValue,
              builder: (context, value, _) {
                return Text(
                  "$value m",
                  style: theme.textTheme.labelLarge!.copyWith(),
                  textAlign: TextAlign.right,
                );
              },
            ),
          ],
        ),
        ValueListenableBuilder(
          valueListenable: sliderValue,
          builder: (context, value, _) {
            return Slider.adaptive(
              value: value,
              label: value.toString(),
              min: 250,
              max: 5250,
              divisions: 20,
              onChanged: (value) {
                sliderValue.value = value;
                print(value);
              },
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "250",
              style: theme.textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "5000",
              style: theme.textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
