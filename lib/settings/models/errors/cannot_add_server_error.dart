import 'package:clipious/l10n/generated/app_localizations.dart';

class CannotAddServerError extends Error {
  final String error;

  CannotAddServerError({required this.error});

  String getLabel(AppLocalizations locals) {
    return '${locals.serverUnreachable}\n\n$error';
  }
}
