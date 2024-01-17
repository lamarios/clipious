import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/settings/states/app_logs.dart';

import '../../../globals.dart';
import '../../models/db/app_logs.dart';

@RoutePage()
class AppLogsScreen extends StatelessWidget {
  const AppLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => AppLogsCubit(AppLogsState.init()),
      child: BlocBuilder<AppLogsCubit, AppLogsState>(
        builder: (context, _) {
          var cubit = context.read<AppLogsCubit>();
          return Scaffold(
            appBar: AppBar(
              title: Text(locals.appLogs),
              actions: [
                IconButton(
                    onPressed: cubit.selectAll,
                    icon: const Icon(Icons.checklist))
              ],
            ),
            body: SafeArea(
              bottom: false,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: animationDuration,
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: _.selected.isNotEmpty ? 50 : 0,
                    child: ListView.separated(
                      itemCount: _.logs.length,
                      itemBuilder: (context, index) {
                        AppLog log = _.logs[index];
                        return CheckboxListTile(
                          title: Text(
                            '${log.level} - ${log.logger} - ${log.time}',
                            style: textTheme.labelSmall
                                ?.copyWith(color: colors.secondary),
                          ),
                          subtitle: Text(
                              '${log.message}${log.stacktrace != null ? '\n\n${log.stacktrace}' : ''}'),
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          value: _.selected.contains(log.isarId),
                          onChanged: (bool? value) =>
                              cubit.selectLog(log.isarId, value),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                  ),
                  AnimatedPositioned(
                      left: 0,
                      right: 0,
                      bottom: _.selected.isNotEmpty ? 0 : -50,
                      duration: animationDuration,
                      child: InkWell(
                        onTap: cubit.copySelectedLogsToClipboard,
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          color: colors.secondaryContainer,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.copy,
                                  size: 15,
                                ),
                              ),
                              Text(
                                  '${locals.copyToClipBoard} (${_.selected.length})'),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
