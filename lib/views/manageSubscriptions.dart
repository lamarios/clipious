import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/manageSubscriptionController.dart';
import 'package:invidious/main.dart';
import 'package:invidious/models/subscription.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ManageSubscriptions extends StatelessWidget {
  const ManageSubscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: colors.background,
        title: Text(locals.manageSubscriptions),
      ),
      body: SafeArea(
        bottom: true,
        child: GetBuilder<ManageSubscriptionsController>(
          global: false,
          init: ManageSubscriptionsController(),
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: !_.loading && _.subs.isEmpty
                  ? Center(child: Text(locals.noChannels))
                  : Stack(
                      children: [
                        SmartRefresher(
                          onRefresh: _.refreshSubs,
                          controller: _.refreshController,
                          child: ListView.builder(
                            itemCount: _.subs.length,
                            itemBuilder: (context, index) {
                              Subscription sub = _.subs[index];

                              return GestureDetector(
                                onTap: () => navigatorKey.currentState?.pushNamed(PATH_CHANNEL, arguments: sub.authorId).then((value) => _.refreshSubs()),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(color: index % 2 != 0 ? colors.secondaryContainer.withOpacity(0.5) : colors.background, borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(sub.author),
                                      IconButton.filledTonal(
                                        visualDensity: VisualDensity.compact,
                                        onPressed: () {
                                          okCancelDialog(context, locals.unSubscribeQuestion, locals.youCanSubscribeAgainLater, () => _.unsubscribe(sub.authorId));
                                        },
                                        icon: const Icon(
                                          Icons.clear,
                                          size: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if (_.loading)
                          const LinearProgressIndicator(
                            minHeight: 2,
                          ),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
