import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/database.dart';

enum SponsorSegmentType {
  sponsor,
  selfpromo,
  interaction,
  intro,
  outro,
  preview,
  music_offtopic,
  filler;

  String settingsName() => '$SPONSOR_BLOCK_PREFIX$name';

  static String getLabel(SponsorSegmentType type, AppLocalizations locals) {
    switch (type) {
      case SponsorSegmentType.sponsor:
        return locals.sponsorBlockCategorySponsor;
      case SponsorSegmentType.selfpromo:
        return locals.sponsorBlockCategoryUnpaidSelfPromo;
      case SponsorSegmentType.interaction:
        return locals.sponsorBlockCategoryInteraction;
      case SponsorSegmentType.intro:
        return locals.sponsorBlockCategoryIntro;
      case SponsorSegmentType.outro:
        return locals.sponsorBlockCategoryOutro;
      case SponsorSegmentType.preview:
        return locals.sponsorBlockCategoryPreview;
      case SponsorSegmentType.music_offtopic:
        return locals.sponsorBlockCategoryMusicOffTopic;
      case SponsorSegmentType.filler:
        return locals.sponsorBlockCategoryFiller;
    }
  }

  static String getDescription(SponsorSegmentType type, AppLocalizations locals) {
    switch (type) {
      case SponsorSegmentType.sponsor:
        return locals.sponsorBlockCategorySponsorDescription;
      case SponsorSegmentType.selfpromo:
        return locals.sponsorBlockCategoryUnpaidSelfPromoDescription;
      case SponsorSegmentType.interaction:
        return locals.sponsorBlockCategoryInteractionDescription;
      case SponsorSegmentType.intro:
        return locals.sponsorBlockCategoryIntroDescription;
      case SponsorSegmentType.outro:
        return locals.sponsorBlockCategoryOutroDescription;
      case SponsorSegmentType.preview:
        return locals.sponsorBlockCategoryPreviewDescription;
      case SponsorSegmentType.music_offtopic:
        return locals.sponsorBlockCategoryMusicOffTopicDescription;
      case SponsorSegmentType.filler:
        return locals.sponsorBlockCategoryFillerDescription;
    }
  }
}
