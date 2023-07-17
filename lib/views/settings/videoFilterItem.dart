import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/db/videoFilter.dart';

class VideoFilterItem extends StatelessWidget {
  final VideoFilter filter;

  const VideoFilterItem({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Container(
          decoration: BoxDecoration(
              color: colors.secondaryContainer,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: filter.filterAll
                ? Text(locals.videoFilterHideAllFromChannel)
                : Text(filter.localizedLabel(locals)),
          )),
    );
  }
}
