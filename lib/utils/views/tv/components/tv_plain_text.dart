import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';

class TvPlainText extends StatefulWidget {
  final String text;

  const TvPlainText({Key? key, required this.text}) : super(key: key);

  @override
  State<TvPlainText> createState() => _TvPlainTextState();
}

class _TvPlainTextState extends State<TvPlainText> {
  final ScrollController _scrollController = new ScrollController();

  KeyEventResult scroll(FocusNode node, KeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      _scrollController.jumpTo(_scrollController.position.pixels + 20);
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      _scrollController.jumpTo(_scrollController.position.pixels - 20);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: DefaultTextStyle(
        style: textTheme.displaySmall!,
        child: TvOverscan(
          child: Focus(
            onKeyEvent: scroll,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Text(
                widget.text,
                // style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
