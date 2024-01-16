import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/videos/models/base_video.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:objectbox/objectbox.dart' as obox;

part 'video_filter.g.dart';

final log = Logger('Video Filter DB');

const defaultStartTime = "00:00:00";
const defaultEndTime = "23:59:59";
const wholeWeek = [1, 2, 3, 4, 5, 6, 7];

enum FilterType {
  title,
  channelName,
  length;

  static String localizedType(FilterType? type, AppLocalizations locals) {
    if (type == null) {
      return '';
    }
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

  static String localizedLabel(FilterOperation? op, AppLocalizations locals) {
    if (op == null) {
      return "";
    }
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

@obox.Entity()
@collection
@CopyWith(constructor: "_")
class VideoFilter {
  @obox.Id()
  @ignore
  int id = 0;

  @obox.Transient()
  Id isarId = Isar.autoIncrement;

  String? channelId;

  @obox.Transient()
  @ignore
  FilterOperation? operation = FilterOperation.contain;
  @obox.Transient()
  @ignore
  FilterType? type = FilterType.title;

  String? value;

  bool filterAll = false;
  bool hideFromFeed = false;

  VideoFilter._(
      this.id,
      this.channelId,
      this.operation,
      this.type,
      this.value,
      this.filterAll,
      this.hideFromFeed,
      this.daysOfWeek,
      this.startTime,
      this.isarId,
      this.endTime);

  VideoFilter({required this.value, this.channelId});

  String? get dbType {
    return type?.name ?? '';
  }

  List<int> daysOfWeek = wholeWeek;
  String startTime = defaultStartTime;
  String endTime = defaultEndTime;

  set dbType(String? value) {
    type =
        FilterType.values.where((element) => element.name == value).firstOrNull;
  }

  String? get dbOperation {
    return operation?.name ?? '';
  }

  set dbOperation(String? value) {
    operation = FilterOperation.values
        .where((element) => element.name == value)
        .firstOrNull;
  }

  static BaseVideo _innerFilterVideo(BaseVideo v, List<VideoFilter> filters) {
    var matches = filters.where((element) => element.filterVideo(v)).toList();
    v.matchedFilters = matches;
    v.filtered = matches.isNotEmpty;
    // log.fine('Video ${v.title} filtered ? ${v.filtered}');
    v.filterHide = v.filtered && matches.any((element) => element.hideFromFeed);
    return v;
  }

  /// Returns the number of videos removed
  static Future<List<BaseVideo>> filterVideos(List<BaseVideo>? videos) async {
    List<VideoFilter> filters = db.getAllFilters();

    log.fine('filtering videos, we have ${filters.length} filters');

/*
    videos = await Future.wait(videos?.map((v) {
          return compute((message) => _innerFilterVideo(message.first, message.last), Couple(v, filters));
        }).toList() ??
        []);
*/

    videos = videos?.map((v) => _innerFilterVideo(v, filters)).toList() ?? [];

    // leaving this for future self. CANNOT remove videos from list, otherwise it will break pagination
    // TODO: write test cases about this.
    // videos.removeWhere((element) => element.filtered && element.filterHide);

    return videos;
  }

  bool filterVideo(BaseVideo video) {
    String videoChannel = video.authorId?.replaceAll("/channel/", '') ?? '';

    if (channelId != null && channelId != videoChannel) {
      // log.fine('Showing videos, no same channel $channelId (filter) -  ${videoChannel} / ${video.author} (video)');
      return false;
    }
    // Channel hide all
    if (channelId != null && filterAll == true && videoChannel == channelId) {
      log.fine(
          'Video filtered because hide all == $filterAll, video channel id: $videoChannel, channel id $channelId');
      return !isTimeAllowed();
    }

    bool filter = false;

    switch (type) {
      // string base operation
      case FilterType.title:
        filter = filterVideoStringOperation(video.title);
      case FilterType.channelName:
        filter = video.author != null
            ? filterVideoStringOperation(video.author!)
            : true;
      // int base operation
      case FilterType.length:
        filter = filterVideoNumberOperation(video.lengthSeconds);
      default:
        filter = false;
    }

    if (!filter) {
      return false;
    }
    //if we need to filter, we need to check the time
    return filter && !isTimeAllowed();
  }

  bool isTimeAllowed() {
    var now = DateTime.now();

    var daysToTest = daysOfWeek.isEmpty ? wholeWeek : daysOfWeek;
    bool isDayAllowed = !daysToTest.contains(now.weekday);

    if (isDayAllowed) {
      log.fine(
          "Filter daysOfWeek $daysOfWeek, now day of week: ${now.weekday}");
      return true;
    }

    List<String> safeStartTime =
        (startTime.isEmpty ? defaultStartTime : startTime).split(":");
    List<String> safeEndTime =
        (endTime.isEmpty ? defaultEndTime : endTime).split(":");

    DateTime startDateTime = DateTime.now().copyWith(
        hour: int.parse(safeStartTime[0]),
        minute: int.parse(safeStartTime[1]),
        second: int.parse(safeStartTime[2]));
    DateTime endDateTime = DateTime.now().copyWith(
        hour: int.parse(safeEndTime[0]),
        minute: int.parse(safeEndTime[1]),
        second: int.parse(safeEndTime[2]));

    // we only allow the video if current time is outside current time range
    bool isTimeAllowed =
        now.isBefore(startDateTime) || now.isAfter(endDateTime);

    log.fine(
        "Filter daysOfWeek $daysOfWeek, now day of week: ${now.weekday}, Filter from $startDateTime to $endDateTime current time $now ");

    return isTimeAllowed;
  }

  bool filterVideoNumberOperation(int numberToCompare) {
    int intValue = int.parse(value ?? "0");

    log.fine('Number compare: $numberToCompare ${operation?.name} $intValue');

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
    var contains =
        stringToCompare.contains(RegExp(value ?? '', caseSensitive: false));
    log.fine(
        'String compare: "$stringToCompare" ${operation?.name} "$value", contains ? $contains');
    switch (operation) {
      case FilterOperation.contain:
        return contains;
      case FilterOperation.notContain:
        return !contains;
      default:
        return false;
    }
  }

  String localizedLabel(AppLocalizations locals, BuildContext context) {
    String str = "";
    if (filterAll) {
      str = locals.videoFilterWholeChannel(hideFromFeed
          ? locals.videoFilterHideLabel
          : locals.videoFilterFilterLabel);
    } else if (type != null && operation != null) {
      log.fine("Filter type $hideFromFeed");
      str = locals.videoFilterDescriptionString(
          hideFromFeed
              ? locals.videoFilterHideLabel
              : locals.videoFilterFilterLabel,
          FilterType.localizedType(type!, locals).toLowerCase(),
          FilterOperation.localizedLabel(operation!, locals).toLowerCase(),
          value ?? '');
    }

    String daysOfWeek = localizedDaysOfWeek(locals);
    if (daysOfWeek.isNotEmpty) {
      if (str.isNotEmpty) {
        str += "\n$daysOfWeek";
      } else {
        str = daysOfWeek;
      }
    }

    String localizedTime = localizedTimes(locals, context);
    if (localizedTime.isNotEmpty) {
      if (str.isNotEmpty) {
        str += "\n$localizedTime";
      } else {
        str = localizedTime;
      }
    }

    return str;
  }

  String localizedDaysOfWeek(AppLocalizations locals) {
    if (daysOfWeek.isNotEmpty && daysOfWeek.length != 7) {
      daysOfWeek.sort();
      return locals.videoFilterAppliedOn(
          daysOfWeek.map((e) => getWeekdayName(e)).join(", "));
    } else {
      return '';
    }
  }

  String localizedTimes(AppLocalizations locals, BuildContext context) {
    String str = '';
    if (startTime != defaultStartTime || endTime != defaultEndTime) {
      var start = timeStringToTimeOfDay(startTime);
      var end = timeStringToTimeOfDay(endTime);
      str = locals.videoFilterTimeOfDayFromTo(
          start.format(context), end.format(context));
    }

    return str;
  }
}
