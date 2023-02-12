import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/interfaces/sharelink.dart';
import 'package:share_plus/share_plus.dart';

String prettyDuration(Duration duration) {
  var components = <String>[];

  var hours = duration.inHours % 24;
  if (hours != 0) {
    components.add('${hours}:');
  }
  var minutes = duration.inMinutes % 60;
  components.add('${minutes.toString().padLeft(2, '0')}:');

  var seconds = duration.inSeconds % 60;
  components.add('${seconds.toString().padLeft(2, '0')}');
  return components.join();
}

NumberFormat compactCurrency = NumberFormat.compactCurrency(
  decimalDigits: 2,
  symbol: '', // if you want to add currency symbol then pass that in this else leave it empty.
);

Future<void> showAlertDialog(BuildContext context, List<Widget> body) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: body,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showSharingSheet(BuildContext context, ShareLinks links) {

  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Share invidious link'),
                  onPressed: () {
                    Share.share(links.getInvidiousLink(db.getCurrentlySelectedServer()));
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: const Text('Share youtube link'),
                  onPressed: () {
                    Share.share(links.getYoutubeLink());
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}
