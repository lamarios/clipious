import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cannot_add_server_error.dart';

class ServerAlreadyExists extends CannotAddServerError {
  ServerAlreadyExists({super.error = 'Server already exists'});

  @override
  String getLabel(AppLocalizations locals) {
    return locals.serverAlreadyExists;
  }
}
