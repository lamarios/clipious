import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/router.dart';
import 'package:invidious/subscription_management/models/subscription.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/utils/views/components/simple_list_item.dart';
import 'package:invidious/utils/views/components/top_loading.dart';

import '../../states/manage_subscriptions.dart';

@RoutePage()
class ManageSubscriptionsScreen extends StatelessWidget {
  const ManageSubscriptionsScreen({super.key});

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
        child: Center(
          child: Container(
            alignment: Alignment.topCenter,
            constraints: BoxConstraints(maxWidth: tabletMaxVideoWidth),
            child: BlocProvider(
              create: (context) => ManageSubscriptionCubit(const ManageSubscriptionsState()),
              child: BlocBuilder<ManageSubscriptionCubit, ManageSubscriptionsState>(
                builder: (context, _) {
                  var cubit = context.read<ManageSubscriptionCubit>();

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: !_.loading && _.subs.isEmpty
                        ? Center(child: Text(locals.noChannels))
                        : Stack(
                            children: [
                              RefreshIndicator(
                                onRefresh: () => cubit.refreshSubs(),
                                child: ListView.builder(
                                  itemCount: _.subs.length,
                                  itemBuilder: (context, index) {
                                    Subscription sub = _.subs[index];

                                    return GestureDetector(
                                      onTap: () => AutoRouter.of(context)
                                          .push(ChannelRoute(channelId: sub.authorId))
                                          .then((value) => cubit.refreshSubs()),
                                      child: SimpleListItem(
                                        key: ValueKey(sub.authorId),
                                        index: index,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(sub.author),
                                            IconButton.filledTonal(
                                              visualDensity: VisualDensity.compact,
                                              onPressed: () {
                                                okCancelDialog(
                                                    context,
                                                    locals.unSubscribeQuestion,
                                                    locals.youCanSubscribeAgainLater,
                                                    () => cubit.unsubscribe(sub.authorId));
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
                              if (_.loading) const TopListLoading()
                            ],
                          ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
