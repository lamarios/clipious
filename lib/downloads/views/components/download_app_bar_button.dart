import 'dart:math';

import 'package:animate_to/animate_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/videos/models/base_video.dart';

import '../../states/download_manager.dart';
import '../../../main.dart';
import '../../../myRouteObserver.dart';
import '../screens/download_manager.dart';

class AppBarDownloadButton extends StatelessWidget {
  const AppBarDownloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return BlocBuilder<DownloadManagerCubit, DownloadManagerState>(
      // buildWhen: (previous, current) => previous.videos.length != current.videos.length || previous.totalProgress != current.totalProgress,
      builder: (context, _) => AnimateTo<BaseVideo>(
        // onArrival: _.addDownload,
        controller: _.animateToController,
        child: Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: openDownloadManager,
              icon: Icon(
                Icons.download,
                color: _.downloadProgresses.isNotEmpty ? colors.background : null,
              ),
            ),
            _.downloadProgresses.isNotEmpty
                ? InkWell(
                    onTap: openDownloadManager,
                    child: SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                          value: _.totalProgress == 0 ? null : _.totalProgress,
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
