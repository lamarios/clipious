import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:invidious/controllers/searchController.dart';

class TvSearchController extends ClipiousSearchController {
  FocusNode resultFocus = FocusNode();
  FocusNode searchFocus = FocusNode();

  TvSearchController({super.query, super.searchNow});

  @override
  onClose() async {
    resultFocus.dispose();
    searchFocus.dispose();
  }

  KeyEventResult handleResultScopeKeyEvent(FocusNode node, KeyEvent event) {
    print(event);
    if (event is KeyUpEvent && event.logicalKey == LogicalKeyboardKey.goBack) {
      searchFocus.requestFocus();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }
}
