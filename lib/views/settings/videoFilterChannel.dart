import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/VideoFilterChannelController.dart';
import 'package:invidious/views/settings/videoFilterItem.dart';

import '../../models/db/videoFilter.dart';

class VideoFilterChannel extends StatelessWidget {
  final List<VideoFilter> filters;

  const VideoFilterChannel({Key? key, required this.filters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoFilterChannelController>(
      init: VideoFilterChannelController(filters: filters),
      global: false,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _.loading
              ? const SizedBox(height: 50, width: 50, child: CircularProgressIndicator())
              : Column(
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible: _.loading,
                          child: const SizedBox(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Expanded(child: Visibility(visible: _.channel != null, child: Text(_.channel?.author ?? ''))),
                      ],
                    ),
                    ..._.filters.map((e) => VideoFilterItem(filter: e)).toList()
                  ],
                ),
        );
      },
    );
  }
}
