import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:clipious/channels/models/channel.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../subscription_management/view/components/subscribe_button.dart';
import '../../../utils/models/image_object.dart';
import '../../../videos/views/components/video_in_list.dart';
import '../../../videos/views/components/video_thumbnail.dart';

class ChannelInfo extends StatelessWidget {
  final Channel channel;

  const ChannelInfo({super.key, required this.channel});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    final deviceType = getDeviceType();
    List<Widget> widgets = [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Thumbnail(
              width: 50,
              height: 50,
              thumbnailUrl:
                  ImageObject.getBestThumbnail(channel.authorThumbnails)?.url ??
                      '',
              decoration: BoxDecoration(
                color: colors.secondaryContainer,
                shape: BoxShape.circle,
              )),
          const SizedBox(
            width: 8,
          ),
          Text(
            channel.author,
            style: textTheme.titleLarge?.copyWith(color: colors.primary),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            SubscribeButton(
                channelId: channel.authorId,
                subCount: compactCurrency.format(channel.subCount)),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SelectableLinkify(
            text: channel.description,
            linkStyle: TextStyle(
                color: colors.primary, decoration: TextDecoration.none),
            onOpen: (link) => launchUrl(Uri.parse(link.url),
                mode: LaunchMode.externalApplication),
            options: const LinkifyOptions(humanize: true, removeWww: true)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          locals.latestVideos,
          style: textTheme.titleMedium?.copyWith(color: colors.secondary),
        ),
      ),
    ];

    widgets.add(GridView.count(
        crossAxisCount: getGridCount(context),
        padding: const EdgeInsets.all(4),
        crossAxisSpacing: 5,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        mainAxisSpacing: 5,
        childAspectRatio: getGridAspectRatio(context),
        children: channel.latestVideos?.map((e) {
              return VideoListItem(
                video: e,
              );
            }).toList() ??
            []));

    final bannerUrl = ImageObject.getBestThumbnail(channel.authorBanners)?.url;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (bannerUrl != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: innerHorizontalPadding),
              child: SizedBox(
                height: deviceType == DeviceType.phone ? 100 : 230,
                child: Thumbnail(
                    width: double.infinity,
                    thumbnailUrl: bannerUrl,
                    decoration: BoxDecoration(
                        color: colors.secondaryContainer,
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: innerHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgets,
            ),
          )
        ],
      ),
    );
  }
}
