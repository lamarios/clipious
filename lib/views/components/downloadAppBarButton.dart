import 'dart:math';

import 'package:animate_to/animate_to.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/models/baseVideo.dart';

import '../../controllers/downloadController.dart';
import '../../main.dart';
import '../../myRouteObserver.dart';
import '../downloadManager.dart';

class AppBarDownloadButton extends StatelessWidget {
  const AppBarDownloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DownloadController>(
      init: DownloadController(),
      tag: 'dl',
      builder: (_) => AnimateTo<BaseVideo>(
        onArrival: _.addDownload,
        controller: _.animateToController,
        child: Stack(
          children: [
            IconButton(
              onPressed: () {
                navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_DOWNLOAD_MANAGER, builder: (context) => const DownloadManager()));
              },
              icon: const Icon(Icons.download),
            ),
            _.downloads > 0 ? Text(_.downloads.toString()) : SizedBox.shrink()
          ],
        ),
        builder: (context, child, animation) => Transform.translate(
          offset: Offset(sin(animation.value * 3 * pi) * 3, 0),
          child: child,
        ),
      ),
    );
  }
}
