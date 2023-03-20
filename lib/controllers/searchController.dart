import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  late TabController controller;

  SearchController(TickerProvider ticker){
    controller = TabController(length: 3, vsync: ticker);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}