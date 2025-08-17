// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get subscriptions => 'சந்தாக்கள்';

  @override
  String get playlists => 'பிளேலிச்ட்கள்';

  @override
  String get popular => 'மக்கள்';

  @override
  String get trending => 'ட்ரெண்டிங்';

  @override
  String get noVideoInPlayList => 'பிளேலிச்ட்டில் வீடியோ இல்லை';

  @override
  String get removeFromPlayList => 'பிளேலிச்ட்டில் இருந்து அகற்று';

  @override
  String get deletePlayListQ => 'பிளேலிச்ட்டை நீக்கவா?';

  @override
  String get irreversibleAction => 'இந்த நடவடிக்கை மாற்ற முடியாதது';

  @override
  String get addPlayList => 'பிளேலிச்ட்டைச் சேர்க்கவும்';

  @override
  String get playListName => 'பிளேலிச்ட் பெயர்';

  @override
  String get playlistVisibility => 'விழிமை';

  @override
  String get publicPlaylist => 'பொது';

  @override
  String get privatePlaylist => 'தனிப்பட்ட';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String get add => 'கூட்டு';

  @override
  String get unlistedPlaylist => 'பட்டியலிடப்படாதது';

  @override
  String get info => 'தகவல்';

  @override
  String get videos => 'வீடியோக்கள்';

  @override
  String get streams => 'நீரோடைகள்';

  @override
  String get latestVideos => 'அண்மைக் கால வீடியோக்கள்';

  @override
  String get subscribed => 'சந்தா';

  @override
  String get subscribe => 'குழுசேர்';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'No subscribers',
        'other': '$count subscribers',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'பங்கு';

  @override
  String get shareYoutubeLink => 'YouTube இணைப்பைப் பகிரவும்';

  @override
  String get shareInvidiousLink => 'வன்கவர்வு இணைப்பைப் பகிரவும்';

  @override
  String get redirectInvidiousLink =>
      'விலக்கப்பட்ட வழிமாற்றுத் இணைப்பைப் பகிரவும்';

  @override
  String get shareLinkWithTimestamp => 'நேர முத்திரை சேர்க்கவும்';

  @override
  String get ok => 'சரி';

  @override
  String get noChannels => 'சேனல்கள் இல்லை';

  @override
  String get noPlaylists => 'பிளேலிச்ட்கள் இல்லை';

  @override
  String get channels => 'சேனல்கள்';

  @override
  String get couldntLoadVideo => 'வீடியோவை ஏற்ற முடியவில்லை';

  @override
  String get comments => 'கருத்துகள்';

  @override
  String get recommended => 'பரிந்துரைக்கப்படுகிறது';

  @override
  String get couldntFetchVideos =>
      'வீடியோக்களைப் பெற முடியவில்லை. மீண்டும் முயற்சிக்க தட்டவும்.';

  @override
  String get wizardIntro =>
      'பொது சேவையகத்தைத் தேர்ந்தெடுக்கவும் அல்லது உங்கள் சொந்தத்தைச் சேர்க்கவும். (பின்னர் அமைப்புகளில் மாற்றலாம்)';

  @override
  String get startUsingClipious => 'கிளிபியசைப் பயன்படுத்தத் தொடங்குங்கள்';

  @override
  String get videoAddedToPlaylist => 'பிளேலிச்ட்டில் வீடியோ சேர்க்கப்பட்டது';

  @override
  String get videoAddedToQueue => 'வரிசையில் வீடியோ சேர்க்கப்பட்டது';

  @override
  String get errorAddingVideoToPlaylist =>
      'பிளேலிச்ட்டில் வீடியோவைச் சேர்க்கும்போது பிழை';

  @override
  String get itemlistErrorGeneric => 'தரவைப் பெற முடியவில்லை';

  @override
  String get itemListErrorInvalidScope =>
      'கிள்ளாக்கு முறையைப் பயன்படுத்துவதில் நீங்கள் உள்நுழைந்தால், வெளியேற முயற்சிக்கவும், மீண்டும் உள்நுழைந்தால், இதைப் பார்க்க உங்களுக்கு இசைவு இல்லை';

  @override
  String get selectPlaylist => 'பிளேலிச்ட்டைத் தேர்ந்தெடுக்கவும்';

  @override
  String get createNewPlaylist => 'புதிய பிளேலிச்ட்டை உருவாக்கவும்';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString replies',
      one: '1 reply',
      zero: 'No replies',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'மேலும் ஏற்றவும்';

  @override
  String get topSorting => 'மேலே';

  @override
  String get newSorting => 'புதிய';

  @override
  String get streamIsLive => 'வாழ';

  @override
  String get sponsorSkipped => 'ஒப்புரவாளர் தவிர்த்தது';

  @override
  String get selectBrowsingCountry => 'உலாவல் நாட்டைத் தேர்ந்தெடுக்கவும்';

  @override
  String get showOnStart =>
      'பயன்பாடு தொடங்கும் போது என்ன காண்பிக்க வேண்டும் என்பதைத் தேர்ந்தெடுக்கவும்';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get browsing => 'உலாவுதல்';

  @override
  String get country => 'நாடு';

  @override
  String get whenAppStartsShow => 'பயன்பாடு தொடங்கும் போது, காட்டு…';

  @override
  String get servers => 'சேவையகங்கள்';

  @override
  String get manageServers => 'சேவையகங்களை நிர்வகிக்கவும்';

  @override
  String currentServer(String current) {
    return 'தற்போது $current பயன்படுத்துகிறது';
  }

  @override
  String get useSponsorBlock => 'ஒப்புரவாளர் பிளாக் பயன்படுத்தவும்';

  @override
  String get sponsorBlockDescription =>
      'சமூகத்தால் சமர்ப்பிக்கப்பட்ட ஒப்புரவாளர் பிரிவுகளைத் தவிர்க்கவும்';

  @override
  String get about => 'பற்றி';

  @override
  String get name => 'பெயர்';

  @override
  String get package => 'தொகுப்பு';

  @override
  String get version => 'பதிப்பு';

  @override
  String get build => 'உருவாக்கு';

  @override
  String get addServer => 'சேவையகத்தைச் சேர்க்கவும்';

  @override
  String get useThisServer => 'இந்த சேவையகத்தைப் பயன்படுத்தவும்';

  @override
  String get logIn => 'புகுபதிகை';

  @override
  String get delete => 'நீக்கு';

  @override
  String get invalidInvidiousServer => 'தவறான அகாத சேவையகம்';

  @override
  String get yourServers => 'உங்கள் சேவையகங்கள்';

  @override
  String get loggedIn => 'உள்நுழைந்தது';

  @override
  String get notLoggedIn => 'உள்நுழையவில்லை';

  @override
  String get addServerHelpText =>
      'உங்கள் சொந்த சேவையகங்களைச் சேர்க்க + பொத்தானைப் பயன்படுத்தவும் அல்லது பொது சேவையகத்தில் தட்டவும், சேர்க்கவும்.';

  @override
  String get publicServers => 'பொது சேவையகங்கள்';

  @override
  String get loadingPublicServer => 'பொது சேவையகங்களை ஏற்றுகிறது';

  @override
  String get tapToAddServer =>
      'உங்கள் பட்டியலில் சேவையகத்தைச் சேர்க்க தட்டவும்';

  @override
  String get publicServersError =>
      'பொது சேவையகங்களின் பட்டியலைப் பெற முடியவில்லை. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get appearance => 'தோற்றம்';

  @override
  String get useDynamicTheme => 'மாறும் வண்ணங்கள்';

  @override
  String get useDynamicThemeDescription =>
      'நீங்கள் வண்ணங்களைப் பயன்படுத்தவும் (Android 12+ இல் மட்டுமே கிடைக்கும்)';

  @override
  String get useDash => 'கோடு பயன்படுத்தவும்';

  @override
  String get useDashDescription =>
      'டாச் அடாப்டிவ் ச்ட்ரீமிங் சில நேரங்களில் சிக்கலாக இருக்கும், யூடியூப் அதைத் தூண்டலாம்.';

  @override
  String get videoPlayer => 'வீடியோ பிளேயர்';

  @override
  String get videoListed => 'பொது';

  @override
  String get videoUnlisted => 'பட்டியலிடப்படாதது';

  @override
  String get videoIsFamilyFriendly => 'குடும்ப நட்பு';

  @override
  String get tapToManage => 'நிர்வகிக்க தட்டவும்';

  @override
  String get authentication => 'ஏற்பு';

  @override
  String get tokenLogin => 'டோக்கனுடன் உள்நுழைக';

  @override
  String get tokenLoginDescription => 'உள்நுழைய பரிந்துரைக்கப்பட்ட வழி';

  @override
  String get cookieLogin => 'குக்கீயுடன் உள்நுழைக';

  @override
  String get cookieLoginDescription =>
      'கிள்ளாக்கு அங்கீகாரத்துடன் சிக்கல்களை எதிர்கொண்டால் இந்த முறையைப் பயன்படுத்தவும்';

  @override
  String get logout => 'விடுபதிகை';

  @override
  String get username => 'பயனர்பெயர்';

  @override
  String get password => 'கடவுச்சொல்';

  @override
  String get wrongUsernamePassword => 'தவறான பயனர்பெயர் அல்லது கடவுச்சொல்';

  @override
  String get error => 'பிழை';

  @override
  String get malformedStatsEndpoint =>
      '/API/V1/புள்ளிவிவரங்கள் எதிர்பார்த்தபடி இல்லை';

  @override
  String get malformedStatsEndpointDescription =>
      'சேவையக புள்ளிவிவரங்கள் இறுதிப்புள்ளி எதிர்பார்க்கப்படும் பேலோடிற்கு பதிலளிக்கவில்லை, முக்கிய \"மென்பொருள். பெயர்\" \"வெகுவாக\" சமமாக இருக்க வேண்டும்.\n சேவையகத்திலிருந்து பதில்:';

  @override
  String get serverIsNotReachable => 'சேவையகம் அடைய முடியாது';

  @override
  String get videoQueue => 'வீடியோ வரிசை';

  @override
  String get addToQueueList => 'வரிசையில் சேர்க்கவும்';

  @override
  String get addToPlaylist => 'பிளேலிச்ட்டில் சேர்க்கவும்';

  @override
  String get playNext => 'அடுத்து விளையாடுங்கள்';

  @override
  String get playNextAddedToQueue => 'வீடியோ அடுத்து விளையாடும்';

  @override
  String get addRecommendedToQueue =>
      'ஆட்டோ-பிளே அடுத்து பரிந்துரைக்கப்படுகிறது';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'எந்த வகையான பிரிவுகளைத் தவிர்க்க வேண்டும் என்பதைத் தேர்ந்தெடுக்கவும்';

  @override
  String get sponsorBlockCategorySponsor => 'ஒப்புரவாளர்';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'கட்டண பதவி உயர்வு, கட்டண பரிந்துரைகள் மற்றும் நேரடி விளம்பரங்கள். அவர்கள் விரும்பும் காரணங்கள்/படைப்பாளிகள்/வலைத்தளங்கள்/தயாரிப்புகளுக்கு தன்வய விளம்பர அல்லது இலவச கூச்சல்களுக்கு அல்ல.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo =>
      'செலுத்தப்படாத/சுய பதவி உயர்வு';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'செலுத்தப்படாத அல்லது தன்வய பதவி உயர்வு தவிர \"ஒப்புரவாளர்\" போன்றது. வணிகப் பொருட்கள், நன்கொடைகள் அல்லது அவர்கள் யார் ஒத்துழைத்தவர்கள் என்பது பற்றிய தகவல்கள் இதில் அடங்கும் ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'தொடர்பு நினைவூட்டல் (குழுசேர்)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'உள்ளடக்கத்தின் நடுவில் அவற்றை விரும்ப, குழுசேர அல்லது பின்பற்ற ஒரு குறுகிய நினைவூட்டல் இருக்கும்போது. இது நீண்டதாகவோ அல்லது குறிப்பிட்ட ஒன்றைப் பற்றியோ இருந்தால், அதற்கு பதிலாக தன்வய விளம்பரத்தின் கீழ் இருக்க வேண்டும்.';

  @override
  String get sponsorBlockCategoryIntro => 'இடைவெளி/அறிமுக அனிமேசன்';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'உண்மையான உள்ளடக்கம் இல்லாத இடைவெளி. இடைநிறுத்தம், நிலையான சட்டகம், மீண்டும் மீண்டும் அனிமேசன் இருக்கலாம். தகவல்களைக் கொண்ட மாற்றங்களுக்கு இது பயன்படுத்தப்படக்கூடாது.';

  @override
  String get sponsorBlockCategoryOutro => 'எண்ட்கார்டுகள்/வரவு';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'வரவு அல்லது YouTube EndCards தோன்றும் போது. தகவலுடன் முடிவுகளுக்கு அல்ல.';

  @override
  String get sponsorBlockCategoryPreview => 'முன்னோட்டம்/மறுபரிசீலனை';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'இந்த வீடியோ அல்லது பிற வீடியோக்களில் என்ன வரப்போகிறது என்பதைக் காட்டும் கிளிப்களின் தொகுப்பு ஒரு தொடரில் அனைத்து தகவல்களும் பின்னர் வீடியோவில் மீண்டும் மீண்டும் செய்யப்படுகின்றன.';

  @override
  String get sponsorBlockCategoryFiller => 'நிரப்பு தொடுகோடு/நகைச்சுவைகள்';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'வீடியோவின் முக்கிய உள்ளடக்கத்தைப் புரிந்து கொள்ளத் தேவையில்லாத நிரப்பு அல்லது நகைச்சுவைக்கு மட்டுமே சேர்க்கப்பட்ட காட்சிகள். சூழல் அல்லது பின்னணி விவரங்களை வழங்கும் பிரிவுகள் இதில் இருக்கக்கூடாது. இது மிகவும் ஆக்கிரோசமான வகையாகும், இது \"வேடிக்கைக்கான\" மனநிலையில் இல்லாதபோது.';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'இசை: இசை அல்லாத பிரிவு';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'இசை வீடியோக்களில் மட்டுமே பயன்படுத்த. இது ஏற்கனவே மற்றொரு வகையால் மூடப்படாத இசை வீடியோக்களின் பிரிவுகளுக்கு மட்டுமே பயன்படுத்தப்பட வேண்டும்.';

  @override
  String get useProxy => 'பதிலாள் வீடியோக்கள்';

  @override
  String get useProxyDescription =>
      'சேவையகத்திலிருந்து வீடியோ ச்ட்ரீம்களை வளர்ப்பதன் மூலம், நீங்கள் பிராந்திய தொகுதிகள் அல்லது ஐ.எச்.பி தடுக்கும் யூடியூப்பைத் தவிர்ப்பது';

  @override
  String get pressDownToShowSettings => 'அமைப்புகளைக் காட்ட கீழே அழுத்தவும்';

  @override
  String get quality => 'தகுதி';

  @override
  String get audio => 'ஆடியோ';

  @override
  String get subtitles => 'வசன வரிகள்';

  @override
  String get playbackSpeed => 'பிளேபேக் விரைவு';

  @override
  String get blackBackground => 'கருப்பு பின்னணி';

  @override
  String get blackBackgroundDescription =>
      'OLED திரையில் இருண்ட கருப்பொருளுக்கு';

  @override
  String get search => 'தேடல்';

  @override
  String get subtitleFontSize => 'வசன வரிகள் எழுத்துரு அளவு';

  @override
  String get subtitleFontSizeDescription =>
      'உங்கள் சாதனத்தில் மிகச் சிறியதாகவோ அல்லது மிகப் பெரியதாகவோ இருந்தால் வசன வரிகளின் அளவை மாற்றவும்';

  @override
  String get skipSslVerification => 'SSL சான்றிதழ் சரிபார்ப்பைத் தவிர்க்கவும்';

  @override
  String get skipSslVerificationDescription =>
      'தன்வய கையொப்பமிடப்பட்ட எச்எச்எல் சான்றிதழைப் பயன்படுத்துவதற்கு அல்லது உங்கள் சேவையகத்துடன் எச்எச்எல் தொடர்பான சிக்கல்களைக் கொண்டிருக்கும்போது.';

  @override
  String get themeBrightness => 'கருப்பொருள்';

  @override
  String get themeLight => 'ஒளி';

  @override
  String get themeDark => 'இருண்ட';

  @override
  String get followSystem => 'அமைப்பைப் பின்தொடரவும்';

  @override
  String get requiresRestart => 'பயன்பாட்டு மறுதொடக்கம் தேவை';

  @override
  String get appLanguage => 'பயன்பாட்டு மொழி';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString videos',
      one: '1 video',
      zero: 'No videos',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'முகவரி http: // அல்லது https: // உடன் தொடங்க வேண்டும்';

  @override
  String get returnYoutubeDislikeDescription =>
      'Returnyoutubedislike.com ஆல் வழங்கப்பட்ட பநிஇ ஐப் பயன்படுத்தி மதிப்பிடப்பட்ட வீடியோ விருப்பு வெறுப்புகளைக் காட்டு';

  @override
  String get rydCustomInstance => 'தனிப்பயன் ரைட் நிகழ்வு முகவரி';

  @override
  String get rydCustomInstanceDescription =>
      'வேறு ரைட் நிகழ்வைப் பயன்படுத்தவும், இயல்புநிலையைப் பயன்படுத்த காலியாக விடவும்';

  @override
  String get autoplayVideoOnLoad => 'தானாகவே வீடியோவை சுமையில் இயக்கவும்';

  @override
  String get autoplayVideoOnLoadDescription =>
      'வீடியோ ஏற்றப்பட்ட பிறகு தானாகவே விளையாடத் தொடங்குங்கள்';

  @override
  String get searchHistory => 'தேடல் வரலாறு';

  @override
  String get searchHistoryDescription => 'வரலாற்று அமைப்புகளைத் தேடுங்கள்';

  @override
  String get enableSearchHistory => 'தேடல் வரலாற்றை இயக்கவும்';

  @override
  String get searchHistoryLimit => 'தேடல் வரலாற்று வரம்பு';

  @override
  String get searchHistoryLimitDescription =>
      'பரிந்துரைகளில் எத்தனை முந்தைய தேடல்கள் காண்பிக்கப்படும் என்பதை அமைக்கவும்';

  @override
  String get shorts => 'குறுக்குகள்';

  @override
  String get searchUploadDate => 'தேதி பதிவேற்றும் தேதி';

  @override
  String get searchUploadDateAny => 'எந்த தேதி';

  @override
  String get searchUploadDateHour => 'கடைசி மணி';

  @override
  String get searchUploadDateToday => 'இன்று';

  @override
  String get searchUploadDateWeek => 'இந்த வாரம்';

  @override
  String get searchUploadDateMonth => 'இந்த மாதம்';

  @override
  String get searchUploadDateYear => 'இந்த ஆண்டு';

  @override
  String get searchDuration => 'காலம்';

  @override
  String get searchDurationAny => 'எந்த காலமும்';

  @override
  String get searchDurationShort => 'குறுகிய (<4 நிமிடங்கள்)';

  @override
  String get searchDurationLong => 'நீண்ட (> 20 நிமிடங்கள்)';

  @override
  String get searchDurationMedium => 'நடுத்தர (4-20 நிமிடங்கள்)';

  @override
  String get searchSortBy => 'வரிசைப்படுத்தவும்';

  @override
  String get searchSortRelevance => 'பொருத்தமானது';

  @override
  String get searchSortRating => 'செயல்வரம்பு';

  @override
  String get searchSortUploadDate => 'பதிவேற்ற தேதி';

  @override
  String get searchSortViewCount => 'எண்ணிக்கை காண்க';

  @override
  String get clearSearchHistory => 'தேடல் வரலாற்றை அழிக்கவும்';

  @override
  String get appLogs => 'பயன்பாட்டு பதிவுகள்';

  @override
  String get appLogsDescription =>
      'பயன்பாட்டில் என்ன நடக்கிறது என்பதற்கான பதிவுகளைப் பெறுங்கள், சிக்கல்களைப் புகாரளிக்க பயனுள்ளதாக இருக்கும்';

  @override
  String get copyToClipBoard => 'கிளிப்போர்டுக்கு நகலெடுக்கவும்';

  @override
  String get logsCopied => 'கிளிப்போர்டுக்கு நகலெடுக்கப்பட்ட பதிவுகள்';

  @override
  String get rememberSubtitleLanguage =>
      'வசன வரிகள் மொழியை நினைவில் கொள்ளுங்கள்';

  @override
  String get videoFilters => 'வீடியோ வடிப்பான்கள்';

  @override
  String nFilters(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString filters',
      one: '1 filter',
      zero: 'No videos',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'கீழே வரையறுக்கப்பட்ட வடிப்பான்களின் அடிப்படையில் பயன்பாட்டில் உள்ள அனைத்து வீடியோ ஊட்டங்களிலிருந்தும் வீடியோக்களை மறைக்கவும் அல்லது தெளிவுபடுத்தவும். This allow you க்கு example பெறுநர் மறை sports spoilers or மறை குறுக்குகள் இருந்து a certain channel.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'வீடியோக்களை வடிகட்ட விதிகளை வரையறுக்கவும்';

  @override
  String get videoFilterAllChannels => 'அனைத்து சேனல்களும்';

  @override
  String get addVideoFilter => 'வடிகட்டியை உருவாக்கவும்';

  @override
  String get editVideoFilter => 'வடிகட்டியைத் திருத்து';

  @override
  String get videoFilterType => 'வகை';

  @override
  String get videoFilterOperation => 'செயல்பாடு';

  @override
  String get videoFilterValue => 'மதிப்பு';

  @override
  String get save => 'சேமி';

  @override
  String get videoFilterEditDescription =>
      'பட்டியல்களிலிருந்து வீடியோக்களை வடிகட்ட ஒரு விருப்ப சேனல், வடிகட்டி வகை, செயல்பாடு மற்றும் மதிப்பைத் தேர்ந்தெடுக்கவும். எடுத்துக்காட்டு, வகை: வீடியோ பெயர், செயல்பாடு: கொண்டுள்ளது, மதிப்பு: சோதனை அனைத்து வீடியோக்களையும் சோதனை என்ற வார்த்தையுடன் அவற்றின் பெயரில் விலக்கும்.';

  @override
  String get optional => 'விரும்பினால்';

  @override
  String get videoFilterHideLabel => 'மறை';

  @override
  String get videoFilterFilterLabel => 'தெளிவற்ற';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter வீடியோக்கள் $type $operation \' $value \'.';
  }

  @override
  String get videoFiltered =>
      'வீடியோ பின்வரும் காரணத்திற்காக (கள்) வடிகட்டப்பட்டுள்ளது:';

  @override
  String get videoFilterTapToReveal => 'வெளிப்படுத்த தட்டவும்';

  @override
  String get videoFilterHide => 'வடிகட்டப்பட்ட வீடியோக்களை மறைக்கவும்';

  @override
  String get videoFilterHideDescription =>
      'முன்னிருப்பாக வடிகட்டப்பட்ட வீடியோக்கள் மறைக்கப்படவில்லை, ஆனால் அது ஏன் வடிகட்டப்பட்டுள்ளது என்பதற்கான காரணம் (கள்) உடன் தெளிவுபடுத்தப்பட்டதாகக் காட்டப்பட்டுள்ளது. இந்த அமைப்பு பட்டியல்களிலிருந்து வடிகட்டப்பட்ட வீடியோக்களை அகற்றவும்.';

  @override
  String get videoFilterNoFilters =>
      'வீடியோ வடிப்பான்கள் இல்லை, வடிப்பான்களைச் சேர்க்கத் தொடங்க கீழே உள்ள + பொத்தானைத் தட்டவும்.';

  @override
  String get videoFilterTypeVideoTitle => 'வீடியோ தலைப்பு';

  @override
  String get videoFilterTypeChannelName => 'சேனல் பெயர்';

  @override
  String get videoFilterTypeVideoLength => 'வீடியோ நீளம் (விநாடிகள்)';

  @override
  String get videoFilterOperationContains => 'கொண்டுள்ளது';

  @override
  String get videoFilterOperationNotContain => 'இல்லை';

  @override
  String get videoFilterOperationLowerThan => 'குறைவாக';

  @override
  String get videoFilterOperationHigherThan => 'விட அதிகமாக';

  @override
  String get channel => 'வாய்க்கால்';

  @override
  String get videoFilterHideAllFromChannel =>
      'சேனலில் இருந்து அனைத்து வீடியோக்களையும் வடிகட்டவும்';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter சேனலில் இருந்து அனைத்து வீடியோக்களும்';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'கிடைத்தால், தேர்ந்தெடுக்கப்பட்ட கடைசி மொழிக்கு தானாக வசன வரிகள் அமைக்கவும்';

  @override
  String get lockFullScreenToLandscape =>
      'முழு திரை நோக்குநிலையை வீடியோ விகித விகிதத்திற்கு பூட்டுங்கள்';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'வீடியோ வடிவமைப்பு, பரந்த வீடியோவுக்கான நிலப்பரப்பு மற்றும் உருவப்படம் வீடியோக்களுக்கான உருவப்படத்தின் அடிப்படையில் முழு திரை நோக்குநிலையைப் பூட்டுகிறது';

  @override
  String get fillFullscreen =>
      'திரைக்கு பொருந்தும் வகையில் வீடியோவை அதிகரிக்கவும்';

  @override
  String get fillFullscreenDescription =>
      'முழு திரையையும் இயற்கை பயன்முறையில் நிரப்ப வீடியோவை சரிசெய்கிறது';

  @override
  String get rememberPlaybackSpeed => 'பிளேபேக் வேகத்தை நினைவில் கொள்ளுங்கள்';

  @override
  String get rememberPlaybackSpeedDescription =>
      'தேர்ந்தெடுக்கப்பட்ட கடைசி வேகத்திற்கு தானாகவே பின்னணி வேகத்தை அமைக்கவும்';

  @override
  String get downloads => 'பதிவிறக்கங்கள்';

  @override
  String get download => 'பதிவிறக்கம்';

  @override
  String get videoAlreadyDownloaded =>
      'வீடியோ ஏற்கனவே பதிவிறக்கம் செய்யப்பட்டுள்ளது';

  @override
  String get noDownloadedVideos =>
      'பதிவிறக்கம் செய்யப்பட்ட வீடியோக்கள் இல்லை, உலாவுங்கள், ஒரு பட்டியலில் ஒரு வீடியோவில் நீண்ட நேரம் அழுத்தவும் அல்லது பதிவிறக்க வீடியோ திரையில் பதிவிறக்க பொத்தானைத் தட்டவும்';

  @override
  String get downloadsPlayAll => 'அனைத்தையும் விளையாடுங்கள்';

  @override
  String get videoDownloadStarted => 'வீடியோ பதிவிறக்கம் தொடங்கியது';

  @override
  String get videoFailedDownloadRetry =>
      'பதிவிறக்கம் தோல்வியுற்றது, மீண்டும் முயற்சிக்கவும்';

  @override
  String get videoDownloadAudioOnly => 'ஆடியோ மட்டும்';

  @override
  String get manageSubscriptions => 'சந்தாக்களை நிர்வகிக்கவும்';

  @override
  String get noSubscriptions =>
      'சந்தாக்கள் இல்லை, வீடியோக்களை உலாவவும், நீங்கள் விரும்பும் எந்த சேனலுக்கும் குழுசேரவும்.';

  @override
  String get youCanSubscribeAgainLater =>
      'இந்த சேனலுக்கு பின்னர் மீண்டும் குழுசேரலாம்';

  @override
  String get unSubscribeQuestion => 'குழுவிலகவா?';

  @override
  String get clearHistoryQuestion => 'வரலாற்றை அழிக்கவா?';

  @override
  String get clearHistoryQuestionExplanation =>
      'இது நீங்கள் பயன்படுத்தும் மோசமான நிகழ்வில் உங்கள் கணக்கின் பார்வை வரலாற்றை அழிக்கும். இதை செயல்தவிர்க்க முடியாது.';

  @override
  String get noHistory =>
      'பார்க்கும் வரலாறு இல்லை, சில வீடியோக்களைப் பாருங்கள், அது இங்கே தோன்றும்';

  @override
  String get homeLayoutEditor => 'வீட்டு தளவமைப்பைத் திருத்தவும்';

  @override
  String get layoutEditorAddVideoSource => 'வீடியோ மூலத்தைச் சேர்க்கவும்';

  @override
  String get layoutEditorExplanation =>
      'உங்கள் முகப்புத் திரையில் என்ன காண்பிக்க வேண்டும் என்பதை நீங்கள் தீர்மானிக்கலாம், கிடைமட்ட ச்க்ரோலிங் மற்றும் ஒரு பெரிய மூலத்துடன் 2 சிறிய பார்வை வரை இருக்கலாம்.';

  @override
  String get home => 'வீடு';

  @override
  String get library => 'நூலகம்';

  @override
  String get customizeAppLayout => 'பயன்பாட்டு பிரிவுகளைத் தனிப்பயனாக்குங்கள்';

  @override
  String get customizeAppLayoutExplanation =>
      'முதன்மையான பயன்பாட்டு வழிசெலுத்தல் பட்டியில் நீங்கள் எந்த பிரிவுகளைத் தோன்ற விரும்புகிறீர்கள் என்பதைத் தேர்ந்தெடுக்கவும். பயன்பாடு தொடங்கும் போது எந்தத் திரை காட்டுகிறது என்பதைத் தேர்ந்தெடுக்க முகப்பு ஐகானைக் சொடுக்கு செய்க. பிரிவுகளைச் சுற்றி இழுப்பதன் மூலம் அவற்றை மறுவரிசைப்படுத்தலாம்.';

  @override
  String get navigationBarStyle => 'வழிசெலுத்தல் பார் பாணி';

  @override
  String get navigationBarLabelAlwaysShowing => 'சிட்டை எப்போதும் காண்பிக்கும்';

  @override
  String get navigationBarLabelShowOnSelect =>
      'தேர்ந்தெடுக்கப்பட்ட உருப்படியில் காட்டப்பட்டுள்ளது';

  @override
  String get navigationBarLabelNeverShow => 'லேபிளைக் காட்ட வேண்டாம்';

  @override
  String get distractionFreeMode => 'கவனச்சிதறல் இல்லாத பயன்முறை';

  @override
  String get distractionFreeModeDescription =>
      'வீடியோ கருத்துகள் மற்றும் பரிந்துரைகளை முடக்கு';

  @override
  String get secondsShortForm => 'நொடி';

  @override
  String get videoFilterApplyDateToFilter =>
      'கொடுக்கப்பட்ட நேரங்களில் வீடியோக்களை வடிகட்டவும்';

  @override
  String get videoFilterDayOfWeek =>
      'வடிப்பான்களைப் பயன்படுத்த நாட்களைத் தேர்ந்தெடுக்கவும்';

  @override
  String get videoFilterDayOfWeekDescription =>
      'வடிப்பான்கள் பொருந்தும் வாரத்தின் நாட்களையும் நேரத்தையும் நீங்கள் தேர்வு செய்யலாம், எடுத்துக்காட்டாக, விளையாட்டு நிகழ்வுகள் ச்பாய்லர்களைத் தவிர்க்கவும்.';

  @override
  String get videoFilterStartTime => 'தொடக்க நேரம்';

  @override
  String get videoFilterEndTime => 'இறுதி நேரம்';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return '$selectedDays இல் பயன்படுத்தப்பட்டது';
  }

  @override
  String get from => 'இருந்து';

  @override
  String get to => 'பெறுநர்';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return '$from முதல் $to';
  }

  @override
  String get notifications => 'அறிவிப்புகள்';

  @override
  String get notificationsDescription =>
      'உங்களுக்கு அறிவிக்கப்பட்டதை இயக்கவும் மதிப்பாய்வு செய்யவும்';

  @override
  String get enableNotificationDescriptions =>
      'நீங்கள் கண்காணிக்கும் மாற்றங்களைச் சரிபார்க்கவும் அறிவிக்கவும் முன்புற சேவையை இயக்குகிறது';

  @override
  String get subscriptionNotification => 'சந்தா அறிவிப்புகள்';

  @override
  String get subscriptionNotificationDescription =>
      'உங்கள் தற்போதைய நிகழ்வில் நீங்கள் உள்நுழைந்திருக்கிறீர்களானால், உங்கள் சந்தா ஊட்டத்திலிருந்து புதிய வீடியோக்களைப் பற்றி அறிவிக்கவும்';

  @override
  String get subscriptionNotificationTitle =>
      'உங்கள் சந்தாக்களிலிருந்து புதிய வீடியோக்கள்';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString new videos',
      one: '1 new video',
      zero: 'no new videos',
    );
    return 'There are  $_temp0 in your subscription feed';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'பேட்டரி தேர்வுமுறை முடக்குதல் தேவை';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'அறிவிப்பை அனுப்ப, பின்னணி சேவையை இயக்க கிளிப்பியச் தேவைகள். இது சீராக இயங்குவதற்கு, கிளிபியசுக்கு கட்டுப்பாடற்ற பேட்டரி பயன்பாடு வழங்கப்பட வேண்டும், சரி தட்டுவது பேட்டரி உகப்பாக்கம் அமைப்புகளைத் திறக்கும்.';

  @override
  String get askToEnableBackgroundServiceTitle => 'அறிவிப்புகள் அணைக்கப்பட்டன';

  @override
  String get askToEnableBackgroundServiceContent =>
      'அறிவிப்புகளைப் பெற, கிளிப்பிய அறிவிப்புகள் இயக்கப்பட வேண்டும், அதை இயக்க சரி என்பதை அழுத்தவும்.';

  @override
  String get otherNotifications => 'பிற அறிவிப்புகள் ஆதாரங்கள் (பெல் ஐகான்கள்)';

  @override
  String get deleteChannelNotificationTitle => 'சேனல் அறிவிப்பை நீக்கவா?';

  @override
  String get deleteChannelNotificationContent =>
      'இந்த சேனலில் இருந்து நீங்கள் இனி அறிவிப்புகளைப் பெற மாட்டீர்கள்.';

  @override
  String get deletePlaylistNotificationTitle => 'பிளேலிச்ட் அறிவிப்பை நீக்கவா?';

  @override
  String get deletePlaylistNotificationContent =>
      'இந்த பிளேலிச்ட்டிலிருந்து இனி அறிவிப்புகளைப் பெற மாட்டீர்கள்.';

  @override
  String channelNotificationTitle(String channel) {
    return 'New videos from $channel';
  }

  @override
  String channelNotificationContent(String channel, num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString new videos',
      one: '1 new video',
      zero: 'no new videos',
    );
    return 'There are $_temp0 from $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return '$playlist பிளேலிச்ட்டில் புதிய வீடியோக்கள்';
  }

  @override
  String playlistNotificationContent(String playlist, num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString new videos',
      one: '1 new video',
      zero: 'no new videos',
    );
    return 'There are $_temp0 in the $playlist playlist';
  }

  @override
  String get foregroundServiceNotificationTitle => 'வீடியோ கண்காணிப்பு';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'per hour',
        '24': 'a day',
        'other': 'every $hours hours',
      },
    );
    return 'Will check for new videos once $_temp0';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'சந்தாக்களை சரிபார்க்கிறது ...';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'பிளேலிச்ட்களை சரிபார்க்கிறது ...';

  @override
  String get foregroundServiceUpdatingChannels =>
      'சேனல்களைச் சரிபார்க்கிறது ...';

  @override
  String get notificationFrequencySettingsTitle =>
      'புதிய வீடியோ சோதனை அதிர்வெண்';

  @override
  String get notificationFrequencySettingsDescription =>
      'பயன்பாடு புதிய வீடியோக்களை எத்தனை முறை சரிபார்க்கிறது';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '1d',
        'other': '${hours}h',
      },
    );
    return '$_temp0';
  }

  @override
  String get subtitlesBackground => 'வசன வரிகள் பின்னணி';

  @override
  String get subtitlesBackgroundDescription =>
      'வசன வரிகள் அவற்றை மேலும் படிக்கக்கூடியதாக மாற்ற ஒரு கருப்பு பின்னணியைச் சேர்க்கிறது';

  @override
  String get history => 'வரலாறு';

  @override
  String get deArrowSettingDescription =>
      'சொடுக்கு தூண்டில் தலைப்புகள் மற்றும் சிறுபடங்களை மாற்றவும்';

  @override
  String get deArrowReplaceThumbnails => 'சிறு உருவங்களை மாற்றவும்';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'தலைப்புகள் கூடுதலாக வீடியோ சிறு உருவங்களை மாற்றவும்';

  @override
  String get deArrowWarning =>
      'ஒவ்வொரு வீடியோவிற்கும் கூடுதல் HTTP கோரிக்கைகள் தேவைப்படுவதால், அன்பை இயக்குவது பயன்பாட்டின் உலாவல் வேகத்தை கணிசமாகக் குறைக்கும்';

  @override
  String get copySettingsAsJson =>
      'கிளிப்போர்டுக்கு சாதொபொகு ஆக அமைப்புகளை நகலெடுக்கவும்';

  @override
  String get copySettingsAsJsonDescription =>
      'பயன்பாட்டில் ஒரு சிக்கலை எதிர்கொண்டு சிக்கலை எழுப்ப முடிவு செய்தால் பிழைத்திருத்தத்திற்கு உதவ அமைப்புகளை சாதொபொகு ஆக நகலெடுக்கவும்';

  @override
  String get seeking => 'தேடுவது';

  @override
  String get skipStep => 'முன்னோக்கி/பின்தங்கிய படி தவிர்க்கவும்';

  @override
  String get skipStepDescription =>
      'முன்னோக்கி/பின்தங்கிய செயல்களைத் தவிர்க்க வினாடிகள்';

  @override
  String get exponentialSkip => 'அதிவேக முன்னோக்கி/பின்னோக்கி தவிர்க்கவும்';

  @override
  String get exponentialSkipDescription =>
      'நீங்கள் எவ்வளவு அதிகமாக முன்னேறுகிறீர்களோ, அவ்வளவு பெரிய படி.';

  @override
  String get fullscreenOnLandscape => 'நிலப்பரப்பில் முழுத் திரை';

  @override
  String get fullscreenOnLandscapeDescription =>
      'சாதனம் இயற்கை பயன்முறையில் சுழற்றும்போது முழுத் திரைக்கு மாறவும்';

  @override
  String get enabled => 'இயக்கப்பட்டது';

  @override
  String get submitFeedback => 'கருத்துக்களை சமர்ப்பிக்கவும்';

  @override
  String get submitFeedbackDescription =>
      'ஒரு பிழை கிடைத்ததா அல்லது பரிந்துரை உள்ளதா? பயன்பாட்டின் திரை சாட்டை எடுக்க இந்த கருவியைப் பயன்படுத்தவும், சிறுகுறிப்பு செய்து கருத்துக்களை சமர்ப்பிக்கவும்';

  @override
  String get feedbackDisclaimer =>
      'பின்னூட்டங்களைச் சமர்ப்பிக்க உங்களுக்கு ஒரு அறிவிலிமையம் கணக்கு தேவைப்படும், மேலும் உங்கள் திரை காட்சி அநாமதேயமாக இம்கூருக்கு சமர்ப்பிக்கப்படும்.';

  @override
  String get feedbackScreenshotError =>
      'திரை சாட்டை இம்கூரில் பதிவேற்றும்போது பிழை';

  @override
  String get channelSortByNewest => 'புதியது';

  @override
  String get channelSortByOldest => 'பழமையானது';

  @override
  String get channelSortByPopular => 'மக்கள்';

  @override
  String get invidiousAccount => 'வெகுவாகக் கணக்கு';

  @override
  String get onDeviceSubscriptions => 'சாதனத்தில்';

  @override
  String get both => 'இரண்டும்';

  @override
  String get refresh => 'புதுப்பிப்பு';

  @override
  String get addBasicAuth => 'அடிப்படை அங்கீகாரத்தைச் சேர்க்கவும்';

  @override
  String get addBasicAuthExplanation =>
      'உங்கள் சேவையகத்திற்கு அடிப்படை HTTP ஏற்பு தேவைப்பட்டால், கீழே உள்ள விவரங்களைச் சேர்க்கவும். இவை உங்கள் வன்கவர்வு கணக்கு விவரங்கள் அல்ல';

  @override
  String get addHeader => 'தலைப்புச் சேர்க்கவும்';

  @override
  String get advancedConfiguration => 'மேம்பட்ட உள்ளமைவு';

  @override
  String get customHeaders => 'தனிப்பயன் தலைப்புகள்';

  @override
  String get customHeadersExplanation =>
      'விருப்பமான சேவையகத்திற்கு அனுப்ப தனிப்பயன் தலைப்புகளை அமைக்கவும்';

  @override
  String get value => 'மதிப்பு';

  @override
  String get testAndAddServer => 'சேவையகத்தை சோதித்து சேர்க்கவும்';

  @override
  String get alsoTestServerConfig =>
      'சிறுபடங்கள் சரியாகக் காண்பிக்கப்படும் என்றால், சேவையக உள்ளமைவையும் சோதிக்கவும்';

  @override
  String get serverAlreadyExists => 'சேவையகம் ஏற்கனவே அமைப்புகளில் உள்ளது';

  @override
  String get wrongThumbnailConfiguration =>
      'சேவையகம் அடையக்கூடியது, ஆனால் சரியாக கட்டமைக்கப்படவில்லை, வீடியோ மற்றும் சேனல் சிறு உருவங்கள் சரியாக காட்டப்படாது. சேவையக சோதனை உள்ளமைவை முடக்கு நீங்கள் இதை சரியாக இருந்தால், உங்கள் சேவையகத்தை சரிசெய்யவும்';

  @override
  String get openWikiLink => 'உதவிக்கு விக்கியைத் திறக்கவும்';

  @override
  String get serverUnreachable =>
      'சேவையகம் அணுக முடியாதது, அல்லது சரியான அக்ஃபோடிச் சேவையகம் அல்ல';

  @override
  String get copyToDownloadFolder => 'கோப்புறையைப் பதிவிறக்க நகலெடுக்கவும்';

  @override
  String get fileCopiedToDownloadFolder =>
      'பதிவிறக்க கோப்புறைக்கு கோப்பு நகலெடுக்கப்பட்டது';

  @override
  String get videoDeleted => 'வீடியோ நீக்கப்பட்டது';

  @override
  String get sleepTimer => 'தூக்க நேரங்குறிகருவி';

  @override
  String get stopTheVideo => 'வீடியோவை நிறுத்துங்கள்';

  @override
  String get stopTheVideoExplanation =>
      'இயக்கப்பட்டால், வீடியோ மூடப்படும், முடக்கப்பட்டால் வீடியோ வெறுமனே இடைநிறுத்தப்படும்';

  @override
  String get setTimer => 'டைமரை அமைக்கவும்';

  @override
  String get cancelSleepTimer => 'ச்லீப் டைமரை ரத்துசெய்';

  @override
  String premieresIn(Object formattedDuration) {
    return '$formattedDuration இல் பிரீமியர்ச்';
  }

  @override
  String get screenControls => 'திரை கட்டுப்பாடுகள்';

  @override
  String get screenControlsExplanation =>
      'முழுத் திரையில் ஒரு வீடியோவைப் பார்க்கும்போது, இடது அல்லது வலதுபுறத்திலிருந்து செங்குத்தாக இழுப்பது முறையே ஒளி அல்லது அளவை சரிசெய்யும்';

  @override
  String get retry => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get forceTvUi => 'Force TV interface';

  @override
  String get forceTvUiExplanation =>
      'Force the interface to be the TV experience, can be useful for some devices that do not have the leanback system config. App restart required';

  @override
  String get noPublicServers => 'No public servers are available';

  @override
  String get tapToSeeHow => 'Tap to see how to host your own';

  @override
  String get referToInvidiousWebsiteForHostingInstructions =>
      'Refer to Invidious website for instructions on how to host invidious';
}
