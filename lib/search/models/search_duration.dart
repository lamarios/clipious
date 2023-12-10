import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SearchDuration {
  any,
  short,
  medium,
  long;

  String getLable(AppLocalizations locals) {
    return switch(this) {
      (SearchDuration.any) => locals.searchDurationAny,
      (SearchDuration.short) => locals.searchDurationShort,
      (SearchDuration.medium) => locals.searchDurationMedium,
      (SearchDuration.long) => locals.searchDurationLong,
    };
  }
}
