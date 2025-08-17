import 'package:clipious/l10n/generated/app_localizations.dart';

enum SearchDuration {
  any,
  short,
  medium,
  long;

  String getLabel(AppLocalizations locals) {
    return switch (this) {
      (SearchDuration.any) => locals.searchDurationAny,
      (SearchDuration.short) => locals.searchDurationShort,
      (SearchDuration.medium) => locals.searchDurationMedium,
      (SearchDuration.long) => locals.searchDurationLong,
    };
  }
}
