import 'package:flutter/material.dart';

import '../../../models/trigger_on.dart';


class TriggerOnSelector extends StatefulWidget {
  const TriggerOnSelector({
    super.key,
    this.initialValue = TriggerOn.entry,
    required this.onChanged,
  });

  final TriggerOn initialValue;
  final ValueChanged<TriggerOn> onChanged;

  @override
  State<TriggerOnSelector> createState() => _TriggerOnSelectorState();
}

class _TriggerOnSelectorState extends State<TriggerOnSelector> {
  late final ValueNotifier<TriggerOn> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = ValueNotifier(widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Trigger on",
          style: theme.textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(17),
            child: Row(
              children: List.generate(
                2,
                (index) {
                  TriggerOn currentTrigger = TriggerOn.values[index];
                  return Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: isSelected,
                      builder: (context, value, _) {
                        return GestureDetector(
                          onTap: () {
                            isSelected.value = currentTrigger;
                            widget.onChanged(currentTrigger);
                          },
                          child: Container(
                            height: 56,
                            color: value.index == index
                                ? theme.colorScheme.primary
                                : theme.colorScheme.primaryContainer,
                            child: Center(
                              child: Text(
                                currentTrigger == TriggerOn.entry
                                    ? "ENTRY"
                                    : "EXIT",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: value.index != index
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.primaryContainer,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
