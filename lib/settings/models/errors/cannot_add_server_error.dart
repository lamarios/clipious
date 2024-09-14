import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CannotAddServerError extends Error {
  final String error;

  CannotAddServerError({required this.error});

  String getLabel(AppLocalizations locals) {
    return '${locals.serverUnreachable}\n\n$error';
  }
}
