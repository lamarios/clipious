import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/main.dart';
import 'package:invidious/videos/states/download_modal_sheet.dart';
import 'package:invidious/videos/views/components/video_in_list.dart';

import '../../../downloads/states/download_manager.dart';
import '../../models/base_video.dart';

const List<String> qualities = <String>['144p', '360p', '720p'];

class DownloadModalSheet extends StatelessWidget {
  final bool animateDownload;
  final BaseVideo video;
  final VideoListSource source;

  // called when the download is triggerd
  final Function()? onDownload;

  // called when we know whether we can start downloading stuff
  final Function(bool isDownloadStarted)? onDownloadStarted;

  const DownloadModalSheet({Key? key, required this.video, this.animateDownload = false, this.onDownloadStarted, this.onDownload, required this.source}) : super(key: key);

  static showVideoModalSheet(BuildContext context, BaseVideo video,
      {bool animateDownload = false, Function(bool isDownloadStarted)? onDownloadStarted, Function()? onDownload, required VideoListSource source}) {
    showModalBottomSheet<void>(
        enableDrag: true,
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) {
          return DownloadModalSheet(
            video: video,
            source: source,
            animateDownload: animateDownload,
            onDownload: onDownload,
            onDownloadStarted: onDownloadStarted,
          );
        });
  }

  void downloadVideo(BuildContext context, DownloadModalSheetState _) async {
    var downloadManager = context.read<DownloadManagerCubit>();
    if (onDownload != null) {
      onDownload!();
    }
    var locals = AppLocalizations.of(context)!;
    Navigator.of(context).pop();
    var downloadController = context.read<DownloadManagerCubit>();
    if (animateDownload) {
      downloadController.state.animateToController.animateTag('video-animate-to-${video.videoId}-${source.name}', duration: const Duration(milliseconds: 300), curve: Curves.easeInOutQuad);
    } else {
      scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(locals.videoDownloadStarted)));
    }
    bool canDownload = await downloadManager.addDownload(video.videoId, audioOnly: _.audioOnly, quality: _.quality) ?? false;
    if (!canDownload) {
      scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(locals.videoAlreadyDownloaded)));
    }
    if (onDownloadStarted != null) {
      onDownloadStarted!(canDownload);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (BuildContext context) => DownloadModalSheetCubit(DownloadModalSheetState()),
      child: BlocBuilder<DownloadModalSheetCubit, DownloadModalSheetState>(builder: (context, _) {
        var cubit = context.read<DownloadModalSheetCubit>();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ToggleButtons(
                      isSelected: qualities.map((e) => e == _.quality).toList(),
                      onPressed: _.audioOnly ? null : (index) => cubit.setQuality(qualities[index]),
                      children: qualities.map((e) => Text(e)).toList(),
                    ),
                  ),
                  InkWell(
                    onTap: () => cubit.setAudioOnly(!_.audioOnly),
                    child: Row(
                      children: [
                        Text(locals.videoDownloadAudioOnly),
                        Switch(
                          value: _.audioOnly,
                          onChanged: cubit.setAudioOnly,
                        )
                      ],
                    ),
                  ),
                  IconButton.filledTonal(
                    onPressed: () => downloadVideo(context, _),
                    icon: const Icon(Icons.download),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
