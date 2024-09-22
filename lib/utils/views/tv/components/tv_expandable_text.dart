import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/router.dart';

import '../../../../utils.dart';

class TvExpandableText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final double? fontSize;

  const TvExpandableText(
      {super.key, required this.text, this.maxLines, this.fontSize});

  showText(BuildContext context) {
    AutoRouter.of(context).push(TvPlainTextRoute(text: text));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return DefaultTextStyle(
      style: textTheme.bodyLarge!,
      child: Focus(
          onKeyEvent: (node, event) =>
              onTvSelect(event, context, (context) => showText(context)),
          child: Builder(builder: (ctx) {
            final FocusNode focusNode = Focus.of(ctx);
            final bool hasFocus = focusNode.hasFocus;

            return AnimatedContainer(
              duration: animationDuration,
              decoration: BoxDecoration(
                color: hasFocus
                    ? colors.primaryContainer
                    : colors.surface.withOpacity(0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  text,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          })),
    );
  }
}
