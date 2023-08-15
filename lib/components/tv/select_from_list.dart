import 'package:flutter/material.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:invidious/settings/views/tv/screens/settings.dart';

class TvSelectFromList extends StatelessWidget {
  final List<String> options;
  final String title;
  final String selected;
  final Function(String selected) onSelect;

  const TvSelectFromList({Key? key, required this.options, required this.selected, required this.onSelect, required this.title}) : super(key: key);

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
                        leading: s == selected ? Icon(Icons.done) : null,
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
