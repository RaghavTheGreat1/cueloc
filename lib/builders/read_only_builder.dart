import 'package:flutter/material.dart';

class ReadOnlyBuilder extends StatelessWidget {
  const ReadOnlyBuilder({
    super.key,
    required this.readOnly,
    this.readView,
    this.editView,
  });

  final bool readOnly;

  final Widget? readView;
  final Widget? editView;

  @override
  Widget build(BuildContext context) {
    if (readOnly) {
      return readView ?? const SizedBox.shrink();
    } else {
      return editView ?? const SizedBox.shrink();
    }
  }
}
