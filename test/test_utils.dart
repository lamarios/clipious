import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Pair<T, V> {
  T left;
  V right;

  Pair(this.left, this.right);
}

class LocalizedTest extends StatelessWidget {
  final Widget child;

  const LocalizedTest({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Localizations(locale: const Locale('en'), delegates: AppLocalizations.localizationsDelegates, child: child);
  }
}
