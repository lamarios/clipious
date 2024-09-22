import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clipious/utils/views/tv/components/tv_overscan.dart';

@RoutePage()
class TvPlainTextScreen extends StatefulWidget {
  final String text;

  const TvPlainTextScreen({super.key, required this.text});

  @override
  State<TvPlainTextScreen> createState() => _TvPlainTextScreenState();
}

class _TvPlainTextScreenState extends State<TvPlainTextScreen> {
  final ScrollController _scrollController = ScrollController();

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
