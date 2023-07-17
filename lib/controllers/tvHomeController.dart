import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:invidious/globals.dart';

class TvHomeController extends GetxController {
  bool expandMenu = false;
  menuItemFocusChanged(bool focus) {
    if (focus) {
      expandMenu = true;
      EasyDebounce.cancel('expand-home-menu');
      update();
    } else {
      EasyDebounce.debounce(
          'expand-home-menu', const Duration(milliseconds: 50), () {
        expandMenu = false;
        update();
      });
    }
  }
}
