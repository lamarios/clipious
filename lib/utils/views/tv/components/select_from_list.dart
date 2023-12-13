import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:invidious/settings/views/tv/screens/settings.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';

@RoutePage()
class TvSelectFromListScreen extends StatelessWidget {
  final List<String> options;
  final String title;
  final String selected;
  final Function(String selected) onSelect;

  const TvSelectFromListScreen(
      {super.key, required this.options, required this.selected, required this.onSelect, required this.title});

  selectOption(BuildContext context, String s) {
    onSelect(s);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TvOverscan(
      child: Column(
        children: [
          SettingsTitle(title: title),
          Expanded(
            child: ListView(
              children: options
                  .map((s) => SettingsTile(
                        leading: s == selected ? const Icon(Icons.done) : null,
                        title: s,
                        onSelected: (context) => selectOption(context, s),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    ));
  }
}
