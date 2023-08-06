import 'package:flutter/material.dart';

class RadiusSlider extends StatefulWidget {
  const RadiusSlider({
    super.key,
    this.initialValue = 1000,
    required this.onChanged,
  });

  final double initialValue;
  final ValueChanged<double> onChanged;

  @override
  State<RadiusSlider> createState() => _RadiusSliderState();
}

class _RadiusSliderState extends State<RadiusSlider> {
  late final ValueNotifier<double> sliderValue;

  @override
  void initState() {
    super.initState();
    sliderValue = ValueNotifier(widget.initialValue);
  }

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
                widget.onChanged(value);
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
