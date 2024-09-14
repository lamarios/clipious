import 'package:invidious/settings/models/errors/cannot_add_server_error.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WrongThumbnailUrl extends CannotAddServerError {
  WrongThumbnailUrl({super.error = 'Wrong thumbnail url'});

  @override
  String getLabel(AppLocalizations locals) {
    return locals.wrongThumbnailConfiguration;
  }
}
