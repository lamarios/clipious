import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

import '../../globals.dart';
import '../../settings/models/db/server.dart';

final log = Logger('WelcomeWizard');

class WelcomeWizardCubit extends Cubit<Server?> {
  WelcomeWizardCubit(super.initialState);

  getSelectedServer() {
    try {
      emit(db.getCurrentlySelectedServer());
      log.info('selected server ${state?.url}');
    } catch (err) {
      emit(null);
      log.info('We don\'t have a server');
    }
  }
}
