import 'package:invidious/models/baseVideo.dart';
import 'package:objectbox/objectbox.dart';

enum FilterType { title, channelName, length }

enum FilterOperation {
  contain,
  notContain,
  lowerThan,
  higherThan,
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

  String value;

  VideoFilter({required this.value, this.channelId});

  String? get dbType {
    return type?.name ?? '';
  }

  set dbType(String? value) {
    type = FilterType.values.where((element) => element.name == value).firstOrNull;
  }

  String get dbOperation {
    return operation?.name ?? '';
  }

  set dbOperation(String value) {
    operation = FilterOperation.values.where((element) => element.name == value).firstOrNull;
  }

  bool showVideo(BaseVideo video) {
    switch (type) {
      // string base operation
      case FilterType.title:
        return compareString(video.title);
      case FilterType.channelName:
        return video.author != null ? compareString(video.author!) : true;
      // int base operation
      case FilterType.length:
        return compareNumber(video.lengthSeconds);
      default:
        return true;
    }
  }

  bool compareNumber(int numberToCompare) {
    int intValue = int.parse(value);
    switch (operation) {
      case FilterOperation.higherThan:
        return numberToCompare > intValue;
      case FilterOperation.lowerThan:
        return numberToCompare < intValue;
      default:
        return true;
    }
  }

  bool compareString(String stringToCompare) {
    switch (operation) {
      case FilterOperation.contain:
        return value == stringToCompare;
      case FilterOperation.notContain:
        return value != stringToCompare;
      default:
        return true;
    }
  }
}
