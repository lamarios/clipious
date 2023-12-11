import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/channels/models/channel_sort_by.dart';

class SortDropdownButton extends StatelessWidget {
  final ChannelSortBy selectedSortingOption;
  final Function(ChannelSortBy) onChanged;

  const SortDropdownButton({
    super.key,
    required this.selectedSortingOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final locals = AppLocalizations.of(context)!;
    return DropdownButton<ChannelSortBy>(
      value: selectedSortingOption,
      items: ChannelSortBy.values
        .map((value) => DropdownMenuItem<ChannelSortBy>(
          value: value,
          child: Text(value.getLable(locals)),
        ))
        .toList(),
      onChanged: (ChannelSortBy? newValue) {
        onChanged(newValue ?? ChannelSortBy.newest);
      },
    );
  }
}
