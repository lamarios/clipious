import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../globals.dart';

class SubscribeButton extends StatefulWidget {
  final String channelId;
  final String subCount;

  const SubscribeButton({super.key, required this.channelId, required this.subCount});

  @override
  SubscribeButtonState createState() => SubscribeButtonState();
}

class SubscribeButtonState extends State<SubscribeButton> with AfterLayoutMixin<SubscribeButton> {
  bool isSubscribed = false;
  bool loading = true;
  final bool isLoggedIn = db.isLoggedInToCurrentServer();

  toggleSubscription() async {
    if (this.isSubscribed) {
      await service.unSubscribe(widget.channelId);
    } else {
      await service.subscribe(widget.channelId);
    }
    bool isSubscribed = await service.isSubscribedToChannel(widget.channelId);
    setState(() {
      this.isSubscribed = isSubscribed;
    });
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    // TODO: implement build
    return SizedBox(
        height: 25,
        child: FilledButton.tonal(

          onPressed: isLoggedIn ? toggleSubscription : null,
          child: Row(
            children: !loading && isLoggedIn
                ? [
                    Icon(isSubscribed ? Icons.done : Icons.add),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('${(isSubscribed ? locals.subscribed : locals.subscribe)} | ${widget.subCount}'),
                    ),
                  ]
                : [
                    const Icon(Icons.people),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      // child: Text('${widget.subCount.replaceAll("^0.00\$","no")} subscribers'),
                      child: Text(locals.nSubscribers(widget.subCount.replaceAll(RegExp(r'^0.00$'), "no"))),

                    ),
                  ],
          ),
        ));
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {

    bool isSubscribed = await service.isSubscribedToChannel(widget.channelId);
    setState(() {
      this.isSubscribed = isSubscribed;
      loading = false;
    });
  }
}
