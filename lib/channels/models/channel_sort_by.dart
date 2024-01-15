import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum ChannelSortBy {
  newest,
  oldest,
  popular;

  String getLabel(AppLocalizations locals) {
    return switch (this) {
      (ChannelSortBy.newest) => locals.channelSortByNewest,
      (ChannelSortBy.oldest) => locals.channelSortByOldest,
      (ChannelSortBy.popular) => locals.channelSortByPopular,
    };
  }
}
