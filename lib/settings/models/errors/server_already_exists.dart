import 'package:clipious/l10n/generated/app_localizations.dart';

import 'cannot_add_server_error.dart';

class ServerAlreadyExists extends CannotAddServerError {
  ServerAlreadyExists({super.error = 'Server already exists'});

  @override
  String getLabel(AppLocalizations locals) {
    return locals.serverAlreadyExists;
  }
}
