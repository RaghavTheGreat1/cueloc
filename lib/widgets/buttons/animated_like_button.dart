import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedLikeButton extends StatefulWidget {
  const AnimatedLikeButton({
    super.key,
    required this.isLiked,
    this.iconSize,
    this.fillColor = Colors.red,
    this.borderColor,
    required this.onChanged,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.enableLoader = false,
  });

  final bool isLiked;

  final bool enableLoader;

  final double? iconSize;

  /// The fill color of the icon when it's liked. Defaults to [ColorScheme.primary]
  final Color? fillColor;

  /// The border color of the icon when it's not liked. Defaults to [ColorScheme.primary]
  final Color? borderColor;

  final Function(bool)? onChanged;

  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;

  @override
  State<AnimatedLikeButton> createState() => _AnimatedLikeButtonState();
}

class _AnimatedLikeButtonState extends State<AnimatedLikeButton>
    with TickerProviderStateMixin {
  late bool isLoading;
  late bool isLiked;
  late AnimationController controller;
  late Animation<double> scale;
  late Animation<double> curve;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    isLiked = widget.isLiked;
    curve = CurvedAnimation(parent: controller, curve: Curves.slowMiddle);
    scale = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.2),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1.0),
        weight: 50,
      ),
    ]).animate(curve);
  }

  @override
  void didUpdateWidget(covariant AnimatedLikeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLiked != oldWidget.isLiked) {
      setState(() {
        isLiked = widget.isLiked;
        if (isLiked) {
          controller.forward();
        } else {
          controller.reverse();
        }
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fillColor = (widget.fillColor ?? theme.colorScheme.primary);
    final borderColor = (widget.borderColor ?? theme.colorScheme.onBackground);
    return GestureDetector(
      // highlightColor: widget.highlightColor ?? splashColor.withOpacity(0.2),
      // splashColor: widget.splashColor ?? splashColor.withOpacity(0.1),
      // hoverColor: widget.hoverColor ?? splashColor.withOpacity(0.1),
      // enableFeedback: true,
      child: ScaleTransition(
        scale: scale,
        child: Icon(
          isLiked ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
          size: widget.iconSize ?? 24,
          color: isLiked ? fillColor : borderColor,
        ),
      ),
      onTap: () async {
        setState(() {
          isLiked = !isLiked;
        });

        if (widget.enableLoader) {
          setState(() {
            isLoading = true;
            controller.loop();
          });
        }
        try {
          await widget.onChanged?.call(isLiked);
        } catch (e) {
          isLoading = false;
          rethrow;
        }
        if (widget.enableLoader) {
          setState(() {
            isLoading = false;
            controller.stop();
          });
        }
      },
    );
  }
}
