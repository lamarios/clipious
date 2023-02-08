import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 25,
          child: FilledButton.tonal(
            onPressed: isLoggedIn ? toggleSubscription : null,
            child: Row(
              children: isLoggedIn
                  ? [
                      Icon(isSubscribed ? Icons.done : Icons.add),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('${(isSubscribed ? 'Subscribed' : 'Subscribe')} | ${widget.subCount}'),
                      ),
                    ]
                  : [
                      const Icon(Icons.people),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('${widget.subCount} subscribers'),
                      ),
                    ],
            ),
          )),
    );
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    bool isSubscribed = await service.isSubscribedToChannel(widget.channelId);
    setState(() {
      this.isSubscribed = isSubscribed;
    });
  }
}
