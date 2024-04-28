import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TextLoaderButton extends StatefulWidget {
  const TextLoaderButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.isLoading,
    this.hapticFeedback = true,
    this.style,
  });

  final Widget child;
  final bool? isLoading;
  final Function? onPressed;
  final bool hapticFeedback;
  final ButtonStyle? style;

  @override
  State<TextLoaderButton> createState() => _TextLoaderButtonState();
}

class _TextLoaderButtonState extends State<TextLoaderButton> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = widget.isLoading ?? false;
  }

  @override
  void didUpdateWidget(covariant TextLoaderButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLoading != widget.isLoading) {
      setState(() {
        isLoading = widget.isLoading ?? false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void executeFunction() async {
    if (widget.hapticFeedback) {
      await HapticFeedback.mediumImpact();
    }
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
    try {
      await widget.onPressed?.call();
    } catch (e) {
      isLoading = false;
      rethrow;
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading
          ? null
          : widget.onPressed == null
              ? null
              : executeFunction,
      style: widget.style ?? const ButtonStyle(),
      child: renderButtonChild(),
    );
  }

  Widget renderButtonChild() {
    final theme = Theme.of(context);
    if (isLoading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpinKitRing(
            color: theme.colorScheme.primary,
            size: 25,
            lineWidth: 2,
          ),
        ],
      );
    } else {
      return widget.child;
    }
  }
}
