import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/db_migration/states/migration.dart';

@RoutePage()
class MigrationScreen extends StatelessWidget {
  const MigrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DbMigrationCubit(const DbMigrationState()),
      child: Scaffold(
        body: SafeArea(
          bottom: true,
          child: BlocBuilder<DbMigrationCubit, DbMigrationState>(
              builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (state.progress < 1)
                    const Center(child: Text('Migrating database...')),
                  if (state.progress == 1)
                    const Center(
                      child: Text('Done !'),
                    ),
                  LinearProgressIndicator(
                    value: state.progress,
                  ),
                  if (state.progress == 1)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        'App will close in ${state.timer} seconds..., please start it again manually',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )),
                    )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
