import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/settings/states/app_logs.dart';

import '../../../globals.dart';
import '../../../main.dart';
import '../../models/db/app_logs.dart';

class AppLogs extends StatelessWidget {
  const AppLogs({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => AppLogsCubit(AppLogsModel()),
      child: BlocBuilder<AppLogsCubit, AppLogsModel>(
        builder: (context, _) {
          var cubit = context.read<AppLogsCubit>();
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: colors.background,
              title: Text(locals.appLogs),
              actions: [IconButton(onPressed: cubit.selectAll, icon: const Icon(Icons.checklist))],
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
                            '${log.level ?? ''} - ${log.logger} - ${log.time}',
                            style: textTheme.labelSmall?.copyWith(color: colors.secondary),
                          ),
                          subtitle: Text('${log.message}${log.stacktrace != null ? '\n\n${log.stacktrace}' : ''}'),
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          value: _.selected.contains(log.id),
                          onChanged: (bool? value) => cubit.selectLog(log.id, value),
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
                        onTap: () {
                          cubit.copySelectedLogsToClipboard();
                          final ScaffoldMessengerState? scaffold = scaffoldKey.currentState;
                          scaffold?.showSnackBar(SnackBar(
                            content: Text(locals.logsCopied),
                            duration: const Duration(seconds: 1),
                          ));
                        },
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
                              Text('${locals.copyToClipBoard} (${_.selected.length})'),
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
