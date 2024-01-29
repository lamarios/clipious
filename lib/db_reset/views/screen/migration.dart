import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/main.dart';
import 'package:invidious/utils/views/tv/components/tv_button.dart';

import '../../states/reset.dart';

@RoutePage()
class MigrationScreen extends StatelessWidget {
  const MigrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DbResetCubit(const DbResetState()),
      child: Scaffold(
        body: SafeArea(
          bottom: true,
          child: BlocBuilder<DbResetCubit, DbResetState>(
              builder: (context, state) {
            var cubit = context.read<DbResetCubit>();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                      'In order to keep the application fully open source, the local database backend needs to be switched. Unfortunately there is no simple way to migrate the data.'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'The application will be reset',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      'The application will close once the process if finished'),
                  isTv
                      ? TvButton(
                          child: const Text('Reset application'),
                          onPressed: (context) => cubit.resetDb())
                      : FilledButton.tonal(
                          onPressed: cubit.resetDb,
                          child: const Text('Reset application'))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
