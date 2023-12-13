import 'package:flutter_linkify/flutter_linkify.dart';

final _timeStampRegex = RegExp(
    r'^(.*?)(((([01])?[0-9]|2[0-3]):)?(([0-5])?[0-9](:[0-5][0-9])))',
    caseSensitive: false,
    dotAll: true);

class TimestampLinkifier extends Linkifier {
  const TimestampLinkifier();

  @override
  List<LinkifyElement> parse(
      List<LinkifyElement> elements, LinkifyOptions options) {
    final list = <LinkifyElement>[];

    for (var element in elements) {
      if (element is TextElement) {
        var match = _timeStampRegex.firstMatch(element.text);

        if (match == null) {
          list.add(element);
        } else {
          final text = element.text.replaceFirst(match.group(0)!, '');

          // check if there's something in front
          if (match.group(1)?.isNotEmpty == true) {
            list.add(TextElement(match.group(1)!));
          }

          // that's our actual timestamp
          if (match.group(2)?.isNotEmpty == true) {
            var originalUrl = match.group(2)!;
            var originText = originalUrl;
            String? end;

            if ((options.excludeLastPeriod) &&
                originalUrl[originalUrl.length - 1] == ".") {
              end = ".";
              originText = originText.substring(0, originText.length - 1);
              originalUrl = originalUrl.substring(0, originalUrl.length - 1);
            }

            list.add(TimestampElement(originalUrl));

            if (end != null) {
              list.add(TextElement(end));
            }
          }

          if (text.isNotEmpty) {
            list.addAll(parse([TextElement(text)], options));
          }
        }
      } else {
        list.add(element);
      }
    }

    return list;
  }
}

/// Represents an element containing an user tag
class TimestampElement extends LinkableElement {
  final String timestamp;

  TimestampElement(this.timestamp) : super(timestamp, timestamp);

  @override
  String toString() {
    return "TimestampElement: '$timestamp' ($text)";
  }

  @override
  bool operator ==(other) => equals(other);

  @override
  int get hashCode => Object.hash(text, originText, url, timestamp);

  @override
  bool equals(other) =>
      other is TimestampElement &&
      super.equals(other) &&
      other.timestamp == timestamp;
}
