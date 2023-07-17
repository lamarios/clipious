import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/tv/tvPlainText.dart';

import '../../utils.dart';

class TvExpandableText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final double? fontSize;

  const TvExpandableText(
      {Key? key, required this.text, this.maxLines, this.fontSize})
      : super(key: key);

  showText(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvPlainText(text: text),
    ));
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
                    ? colors.secondaryContainer
                    : colors.background.withOpacity(0.5),
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
