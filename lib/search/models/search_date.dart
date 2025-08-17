import 'package:clipious/l10n/generated/app_localizations.dart';

enum SearchDate {
  any,
  hour,
  today,
  week,
  month,
  year;

  String getLabel(AppLocalizations locals) {
    return switch (this) {
      (SearchDate.any) => locals.searchUploadDateAny,
      (SearchDate.hour) => locals.searchUploadDateHour,
      (SearchDate.today) => locals.searchUploadDateToday,
      (SearchDate.week) => locals.searchUploadDateWeek,
      (SearchDate.month) => locals.searchUploadDateMonth,
      (SearchDate.year) => locals.searchUploadDateYear,
    };
  }
}
