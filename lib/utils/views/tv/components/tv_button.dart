import 'package:flutter/material.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/utils.dart';

class TvButton extends StatelessWidget {
  final Widget? child;
  final Function(BuildContext context)? onPressed;
  final Color? focusedColor;
  final Color? unfocusedColor;
  final double? borderRadius;
  final bool? autofocus;
  final Function(bool focus)? onFocusChanged;
  final Widget Function(BuildContext context, bool hasFocus)? builder;

  const TvButton(
      {super.key,
      this.child,
      this.onPressed,
      this.focusedColor,
      this.unfocusedColor,
      this.borderRadius,
      this.autofocus,
      this.onFocusChanged,
      this.builder});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    ColorScheme colors = Theme.of(context).colorScheme;
    return Focus(
      autofocus: autofocus ?? false,
      onFocusChange: onFocusChanged,
      onKeyEvent: (node, event) => onPressed != null
          ? onTvSelect(event, context, onPressed!)
          : KeyEventResult.ignored,
      child: Builder(
        builder: (ctx) {
          bool hasFocus = Focus.of(ctx).hasFocus;

          return Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: animationDuration,
              decoration: BoxDecoration(
                color: hasFocus
                    ? focusedColor ??
                        (brightness == Brightness.dark
                            ? colors.primaryContainer
                            : colors.primary)
                    : unfocusedColor ?? colors.secondaryContainer,
                borderRadius: BorderRadius.circular(borderRadius ?? 2000),
              ),
              child: builder != null ? builder!(ctx, hasFocus) : child,
            ),
          );
        },
      ),
    );
  }
}
