import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/db/server.dart';
import '../utils.dart';

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
