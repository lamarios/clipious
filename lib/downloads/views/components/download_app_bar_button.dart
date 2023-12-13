import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/router.dart';

import '../../states/download_manager.dart';

class AppBarDownloadButton extends StatelessWidget {
  const AppBarDownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return BlocBuilder<DownloadManagerCubit, DownloadManagerState>(
      // buildWhen: (previous, current) => previous.videos.length != current.videos.length || previous.totalProgress != current.totalProgress,
      builder: (context, _) {
        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: () => openDownloadManager(context),
              icon: Icon(
                Icons.download,
                color: _.downloadProgresses.isNotEmpty ? colors.background : null,
              ),
            ),
            _.downloadProgresses.isNotEmpty
                ? InkWell(
                    onTap: () => openDownloadManager(context),
                    child: SizedBox(
                        width: 15,
                        height: 15,
                        child: TweenAnimationBuilder(
                          builder: (context, value, child) {
                            return CircularProgressIndicator(
                              value: _.totalProgress == 0 ? null : value,
                              strokeWidth: 2,
                            );
                          },
                          duration: animationDuration,
                          tween: Tween<double>(begin: 0, end: _.totalProgress),
                        )),
                  )
                : const SizedBox.shrink(),
            Positioned(
                top: 1,
                right: 1,
                child: _.videos.isNotEmpty
                    ? GestureDetector(
                        onTap: () => openDownloadManager(context),
                        child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(color: colors.secondaryContainer, shape: BoxShape.circle),
                            child: Text(
                              _.videos.length.toString(),
                              style: textTheme.labelSmall,
                            )),
                      )
                    : const SizedBox.shrink())
          ],
        );
      },
    );
  }

  void openDownloadManager(BuildContext context) {
    AutoRouter.of(context).push(const DownloadManagerRoute());
  }
}
