import 'package:bloc/bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/models/db/settings.dart';
import 'package:invidious/models/sponsorSegmentTypes.dart';

class SponsorBlockCubit extends Cubit<int> {
  SponsorBlockCubit(super.initialState);

  bool value(SponsorSegmentType t) => db.getSettings(t.settingsName())?.value == 'true';

  setValue(SponsorSegmentType t, bool value) {
    db.saveSetting(SettingsValue(t.settingsName(), value.toString()));
    emit(state + 1);
  }
}
