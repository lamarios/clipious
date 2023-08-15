import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/baseVideo.dart';
import 'package:logging/logging.dart';
import 'package:objectbox/objectbox.dart';

import '../../../models/pair.dart';

final log = Logger('Video Filter DB');

enum FilterType {
  title,
  channelName,
  length;

  static String localizedType(FilterType type, AppLocalizations locals) {
    switch (type) {
      case FilterType.channelName:
        return locals.videoFilterTypeChannelName;
      case FilterType.length:
        return locals.videoFilterTypeVideoLength;
      case FilterType.title:
        return locals.videoFilterTypeVideoTitle;
    }
  }
}

enum FilterOperation {
  contain,
  notContain,
  lowerThan,
  higherThan;

  static String localizedLabel(FilterOperation op, AppLocalizations locals) {
    switch (op) {
      case FilterOperation.contain:
        return locals.videoFilterOperationContains;
      case FilterOperation.notContain:
        return locals.videoFilterOperationNotContain;
      case FilterOperation.lowerThan:
        return locals.videoFilterOperationLowerThan;
      case FilterOperation.higherThan:
        return locals.videoFilterOperationHigherThan;
    }
  }
}

@Entity()
class VideoFilter {
  @Id()
  int id = 0;

  String? channelId;

  @Transient()
  FilterOperation? operation = FilterOperation.contain;
  @Transient()
  FilterType? type = FilterType.title;

  String? value;

  bool filterAll = false;
  bool hideFromFeed = false;

  VideoFilter({required this.value, this.channelId});

  String? get dbType {
    return type?.name ?? '';
  }

  set dbType(String? value) {
    type = FilterType.values.where((element) => element.name == value).firstOrNull;
  }

  String? get dbOperation {
    return operation?.name ?? '';
  }

  set dbOperation(String? value) {
    operation = FilterOperation.values.where((element) => element.name == value).firstOrNull;
  }

  static BaseVideo _innerFilterVideo(BaseVideo v, List<VideoFilter> filters) {
    final log = Logger('VideoFilterCompute');
    var matches = filters.where((element) => element.filterVideo(v)).toList();
    v.matchedFilters = matches;
    v.filtered = matches.isNotEmpty;
    log.fine('Video ${v.title} filtered ? ${v.filtered}');
    v.filterHide = v.filtered && matches.any((element) => element.hideFromFeed);
    return v;
  }

  /// Returns the number of videos removed
  static Future<List<BaseVideo>> filterVideos(List<BaseVideo>? videos) async {
    List<VideoFilter> filters = db.getAllFilters();

    log.fine('filtering videos, we have ${filters.length} filters');

    videos = await Future.wait(videos?.map((v) {
          return compute((message) => _innerFilterVideo(message.first, message.last), Couple(v, filters));
        }).toList() ??
        []);

    return videos;
  }

  bool filterVideo(BaseVideo video) {
    String videoChannel = video.authorId?.replaceAll("/channel/", '') ?? '';

    if (channelId != null && channelId != videoChannel) {
      log.fine('Showing videos, no same channel $channelId (filter) -  ${videoChannel} / ${video.author} (video)');
      return false;
    }
    // Channel hide all
    if (channelId != null && filterAll == true && videoChannel == channelId) {
      log.fine('Video filtered because hide all == $filterAll, video channel id: ${videoChannel}, channel id ${channelId}');
      return true;
    }

    switch (type) {
      // string base operation
      case FilterType.title:
        return filterVideoStringOperation(video.title);
      case FilterType.channelName:
        return video.author != null ? filterVideoStringOperation(video.author!) : true;
      // int base operation
      case FilterType.length:
        return filterVideoNumberOperation(video.lengthSeconds);
      default:
        return false;
    }
  }

  bool filterVideoNumberOperation(int numberToCompare) {
    int intValue = int.parse(value ?? "0");

    log.fine('Number compare: ${numberToCompare} ${operation?.name} $intValue');

    switch (operation) {
      case FilterOperation.higherThan:
        return numberToCompare > intValue;
      case FilterOperation.lowerThan:
        return numberToCompare < intValue;
      default:
        return false;
    }
  }

  bool filterVideoStringOperation(String stringToCompare) {
    var contains = stringToCompare.contains(RegExp(value ?? '', caseSensitive: false));
    log.fine('String compare: "$stringToCompare" ${operation?.name} "$value", contains ? $contains');
    switch (operation) {
      case FilterOperation.contain:
        return contains;
      case FilterOperation.notContain:
        return !contains;
      default:
        return false;
    }
  }

  String localizedLabel(AppLocalizations locals) {
    if (filterAll) {
      return locals.videoFilterWholeChannel(hideFromFeed ? locals.videoFilterHideLabel : locals.videoFilterFilterLabel);
    } else if (type != null && operation != null) {
      log.fine("Filter type $hideFromFeed");
      return locals.videoFilterDescriptionString(hideFromFeed ? locals.videoFilterHideLabel : locals.videoFilterFilterLabel, FilterType.localizedType(type!, locals).toLowerCase(),
          FilterOperation.localizedLabel(operation!, locals).toLowerCase(), value ?? '');
    } else {
      return "";
    }
  }
}
