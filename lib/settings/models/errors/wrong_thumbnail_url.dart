import 'package:clipious/settings/models/errors/cannot_add_server_error.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';

class WrongThumbnailUrl extends CannotAddServerError {
  WrongThumbnailUrl({super.error = 'Wrong thumbnail url'});

  @override
  String getLabel(AppLocalizations locals) {
    return locals.wrongThumbnailConfiguration;
  }
}
