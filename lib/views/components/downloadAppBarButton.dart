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
    var colors = Theme.of(context).colorScheme;
    return GetBuilder<DownloadController>(
      init: DownloadController(),
      tag: 'dl',
      builder: (_) => AnimateTo<BaseVideo>(
        // onArrival: _.addDownload,
        controller: _.animateToController,
        child: Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: openDownloadManager,
              icon: Icon(
                Icons.download,
                color: _.totalProgress > 0 ? colors.background : null,
              ),
            ),
            _.totalProgress > 0
                ? InkWell(
                    onTap: openDownloadManager,
                    child: SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                          value: _.totalProgress,
                          strokeWidth: 2,
                        )),
                  )
                : const SizedBox.shrink(),
            Positioned(top: 5, right: 5, child: _.videos.isNotEmpty ? Text(_.videos.length.toString()) : const SizedBox.shrink())
          ],
        ),
        builder: (context, child, animation) => Transform.translate(
          offset: Offset(sin(animation.value * 3 * pi) * 3, 0),
          child: child,
        ),
      ),
    );
  }

  void openDownloadManager() {
    navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_DOWNLOAD_MANAGER, builder: (context) => const DownloadManager()));
  }
}
