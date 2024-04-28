import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ElevatedLoaderButton extends StatefulWidget {
  const ElevatedLoaderButton({
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
  State<ElevatedLoaderButton> createState() => _ElevatedLoaderButtonState();
}

class _ElevatedLoaderButtonState extends State<ElevatedLoaderButton> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = widget.isLoading ?? false;
  }

  @override
  void didUpdateWidget(covariant ElevatedLoaderButton oldWidget) {
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
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: isLoading
          ? null
          : widget.onPressed == null
              ? null
              : executeFunction,
      style: widget.style ??
          ButtonStyle(
            foregroundColor:
                MaterialStatePropertyAll(theme.colorScheme.primaryContainer),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey;
              }
              return theme.colorScheme.onPrimaryContainer;
            }),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
      child: renderButtonChild(),
    );
  }

  Widget renderButtonChild() {
    if (isLoading) {
      return const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpinKitRing(
            color: Colors.white,
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
