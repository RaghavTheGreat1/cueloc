import 'dart:async';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoaderListTile extends StatefulWidget {
  const LoaderListTile({
    super.key,
    this.isLoading,
    this.leading,
    this.hapticFeedback = true,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.visualDensity,
    this.shape,
    this.style,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.leadingAndTrailingTextStyle,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.focusNode,
    this.autofocus = false,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.titleAlignment,
  });

  final bool? isLoading;
  final bool hapticFeedback;

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;

  final bool isThreeLine;
  final bool? dense;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final ListTileStyle? style;
  final Color? selectedColor;
  final Color? iconColor;
  final Color? textColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? leadingAndTrailingTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final Function? onTap;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onFocusChange;
  final MouseCursor? mouseCursor;
  final bool selected;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? tileColor;
  final Color? selectedTileColor;
  final bool? enableFeedback;
  final double? horizontalTitleGap;
  final double? minVerticalPadding;
  final double? minLeadingWidth;
  final ListTileTitleAlignment? titleAlignment;

  @override
  State<LoaderListTile> createState() => _LoaderListTileState();
}

class _LoaderListTileState extends State<LoaderListTile> {
  late final ValueNotifier<bool> isLoadingNotifier;

  @override
  void initState() {
    super.initState();
    isLoadingNotifier = ValueNotifier(widget.isLoading ?? false);
    isLoadingNotifier.value = widget.isLoading ?? false;
  }

  @override
  void didUpdateWidget(covariant LoaderListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLoading != widget.isLoading) {
      setState(() {
        isLoadingNotifier.value = widget.isLoading ?? false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> executeFunction() async {
    if (widget.hapticFeedback) {
      await HapticFeedback.mediumImpact();
    }
    if (mounted) {
      setState(() {
        isLoadingNotifier.value = true;
      });
    }
    await widget.onTap?.call();
    if (mounted) {
      setState(() {
        isLoadingNotifier.value = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: isLoadingNotifier,
      builder: (context, isLoading, kid) {
        return InkWell(
          borderRadius: BorderRadius.circular(24),
          splashColor: theme.colorScheme.primaryContainer,
          highlightColor: theme.colorScheme.primaryContainer.withOpacity(0.2),
          onLongPress: () {},
          onTap: isLoading
              ? null
              : widget.onTap == null
                  ? null
                  : executeFunction,
          child: kid,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: ValueListenableBuilder(
              valueListenable: isLoadingNotifier,
              builder: (context, isLoading, _) {
                return ListTile(
                  leading: widget.leading,
                  title: widget.title,
                  subtitle: widget.subtitle,
                  trailing: Builder(
                    builder: (context) {
                      if (isLoading) {
                        return SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        );
                      }
                      return widget.trailing ??
                          const Icon(
                            FeatherIcons.chevronRight,
                          );
                    },
                  ),
                  isThreeLine: widget.isThreeLine,
                  dense: widget.dense,
                  visualDensity: widget.visualDensity,
                  shape: widget.shape,
                  style: widget.style,
                  selectedColor: widget.selectedColor,
                  iconColor: widget.iconColor,
                  textColor: widget.textColor,
                  titleTextStyle: widget.titleTextStyle,
                  subtitleTextStyle: widget.subtitleTextStyle,
                  leadingAndTrailingTextStyle:
                      widget.leadingAndTrailingTextStyle,
                  contentPadding: widget.contentPadding,
                  enabled: widget.enabled,
                  onFocusChange: widget.onFocusChange,
                  mouseCursor: widget.mouseCursor,
                  selected: widget.selected,
                  focusColor: widget.focusColor,
                  hoverColor: widget.hoverColor,
                  splashColor: widget.splashColor,
                  focusNode: widget.focusNode,
                  autofocus: widget.autofocus,
                  tileColor: widget.tileColor,
                  selectedTileColor: widget.selectedTileColor,
                  enableFeedback: widget.enableFeedback,
                  horizontalTitleGap: widget.horizontalTitleGap,
                  minVerticalPadding: widget.minVerticalPadding,
                  minLeadingWidth: widget.minLeadingWidth,
                  titleAlignment: widget.titleAlignment,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
