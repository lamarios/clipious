// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get subscriptions => 'Odběry';

  @override
  String get playlists => 'Seznamy Videí';

  @override
  String get popular => 'Populární';

  @override
  String get trending => 'Trendy';

  @override
  String get noVideoInPlayList => 'Žádná videa v seznamu videí';

  @override
  String get removeFromPlayList => 'Odstranit ze seznamu videí';

  @override
  String get deletePlayListQ => 'Smazat seznam videí?';

  @override
  String get irreversibleAction => 'Tato akce je nevratná';

  @override
  String get addPlayList => 'Přidat Seznam Videí';

  @override
  String get playListName => 'Název Seznamu Videí';

  @override
  String get playlistVisibility => 'Viditelnost';

  @override
  String get publicPlaylist => 'Veřejné';

  @override
  String get privatePlaylist => 'Soukromé';

  @override
  String get cancel => 'Zrušit';

  @override
  String get add => 'Přidat';

  @override
  String get unlistedPlaylist => 'Neuvedeno';

  @override
  String get info => 'Informace';

  @override
  String get videos => 'Videa';

  @override
  String get streams => 'Vysílání';

  @override
  String get latestVideos => 'Poslední Videa';

  @override
  String get subscribed => 'Odebíráno';

  @override
  String get subscribe => 'Odebrat';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Žádné odběry',
        'other': '$count odběrů',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Sdílet';

  @override
  String get shareYoutubeLink => 'Sdílet YouTube odkaz';

  @override
  String get shareInvidiousLink => 'Sdílet Invidious odkaz';

  @override
  String get redirectInvidiousLink => 'Sdílet přesměrovací odkaz invidious';

  @override
  String get shareLinkWithTimestamp => 'Přidat časové razítko';

  @override
  String get ok => 'OK';

  @override
  String get noChannels => 'Žádné kanály';

  @override
  String get noPlaylists => 'Žádné seznamy videí';

  @override
  String get channels => 'Kanály';

  @override
  String get couldntLoadVideo => 'Nepodařilo se načíst video';

  @override
  String get comments => 'Komentáře';

  @override
  String get recommended => 'Doporučené';

  @override
  String get couldntFetchVideos =>
      'Nepodařilo se nepodařilo načíst. Klikněte pro zkusení znovu.';

  @override
  String get wizardIntro =>
      'Vyberte veřejný server nebo přidejte svůj vlastní.(Může být změněno později v nastavení)';

  @override
  String get startUsingClipious => 'Začít používat Clipious';

  @override
  String get videoAddedToPlaylist => 'Video bylo přidáno do seznamu videí';

  @override
  String get videoAddedToQueue => 'Video bylo přidáno do fronty videí';

  @override
  String get errorAddingVideoToPlaylist =>
      'Chyba při přidání videa do seznamu videí';

  @override
  String get itemlistErrorGeneric => 'Nebylo možné načíst data';

  @override
  String get itemListErrorInvalidScope =>
      'Nemáte oprávnění ke shlédnutí tohoto obsahu. Jestliže jste pro přihlášení použil/a způsob pomocí tokenu, tak se zkuste odhlásit a znovu přihlásit';

  @override
  String get selectPlaylist => 'Vybrat Seznam Skladeb';

  @override
  String get createNewPlaylist => 'Vytvořit nový seznam skladeb';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString odpovědí',
      one: '1 odpověď',
      zero: 'Žádné odpovědi',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Načíst více';

  @override
  String get topSorting => 'Od zhora';

  @override
  String get newSorting => 'Nové';

  @override
  String get streamIsLive => 'Živě';

  @override
  String get sponsorSkipped => 'Sponzor přeskočen';

  @override
  String get selectBrowsingCountry => 'Vyberte zemi původu videí';

  @override
  String get showOnStart => 'Vyberte co bude ukázáno při zapnutí aplikace';

  @override
  String get settings => 'Nastavení';

  @override
  String get browsing => 'Prohlížení';

  @override
  String get country => 'Země';

  @override
  String get whenAppStartsShow => 'Když se aplikace zapne, ukaž…';

  @override
  String get servers => 'Servery';

  @override
  String get manageServers => 'Spravovat servery';

  @override
  String currentServer(String current) {
    return 'Momentálně využívan $current';
  }

  @override
  String get useSponsorBlock => 'Použít SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'Přeskočit sponzorské segmenty vybrané komunitou';

  @override
  String get about => 'O';

  @override
  String get name => 'Jméno';

  @override
  String get package => 'Balík';

  @override
  String get version => 'Verze';

  @override
  String get build => 'Sestavit';

  @override
  String get addServer => 'Přidat server';

  @override
  String get useThisServer => 'Použít tento server';

  @override
  String get logIn => 'Přihlásit se';

  @override
  String get delete => 'Smazat';

  @override
  String get invalidInvidiousServer => 'Neplatný Invidious server';

  @override
  String get yourServers => 'Vaše servery';

  @override
  String get loggedIn => 'Přihlášen';

  @override
  String get notLoggedIn => 'Nepřihlášen';

  @override
  String get addServerHelpText =>
      'Použijte tlačítko + pro přidání serveru nebo klikněte na veřejný server pro přidání.';

  @override
  String get publicServers => 'Veřejné Servery';

  @override
  String get loadingPublicServer => 'Načítám veřejné servery';

  @override
  String get tapToAddServer => 'Klikněte pro přidání serveru do vašeho seznamu';

  @override
  String get publicServersError =>
      'Nepodařilo se načíst seznam veřejných servrů. Klikněte pro zopakování.';

  @override
  String get appearance => 'Vzhled';

  @override
  String get useDynamicTheme => 'Dynamické barvy';

  @override
  String get useDynamicThemeDescription =>
      'Použít Material You barvy (dostpuné pouze na Androidu 12+)';

  @override
  String get useDash => 'Použít DASH';

  @override
  String get useDashDescription =>
      'Adaptivní vysílání DASH může být problematické, YouTube jej může omezit.';

  @override
  String get videoPlayer => 'Video přehrávač';

  @override
  String get videoListed => 'Veřejné';

  @override
  String get videoUnlisted => 'Neuvedeno';

  @override
  String get videoIsFamilyFriendly => 'Vhodné pro rodinu';

  @override
  String get tapToManage => 'Klikněte pro spravování';

  @override
  String get authentication => 'Autentifikace';

  @override
  String get tokenLogin => 'Přihlásit se pomocí tokenu';

  @override
  String get tokenLoginDescription => 'Doporučený způsob přihlášení';

  @override
  String get cookieLogin => 'Přihlásit se pomocí sušenky';

  @override
  String get cookieLoginDescription =>
      'Použijte tuto metodu pokud narazíte na problém při přihlášení tokenem';

  @override
  String get logout => 'Odhlásit se';

  @override
  String get username => 'Přezdívka';

  @override
  String get password => 'Heslo';

  @override
  String get wrongUsernamePassword => 'Špatné přihlašovací jméno nebo heslo';

  @override
  String get error => 'Chyba';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats není podle očekávání';

  @override
  String get malformedStatsEndpointDescription =>
      'Koncový bod statistik serveru neodpověděl s očekávanou odpovědí, klíč serveru \"software.name\" by měl být stejny s \"invidious\".\nOdpověď serveru:';

  @override
  String get serverIsNotReachable => 'Server dočasně neni dostupný';

  @override
  String get videoQueue => 'Fronta videí';

  @override
  String get addToQueueList => 'Přidat do fronty';

  @override
  String get addToPlaylist => 'Přidat do seznamu skladeb';

  @override
  String get playNext => 'Přehrát další';

  @override
  String get playNextAddedToQueue => 'Video bude přehráno jako další';

  @override
  String get addRecommendedToQueue =>
      'Jako další automaticky přehrát doporučené';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Vyberte který typ segmentu přeskočit';

  @override
  String get sponsorBlockCategorySponsor => 'Sponzor';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Placená propagace, placené doporučení a přímou reklamu. Ne osobní propagaci nebo neplacené propagace přího/tvůrců/stránek/produktů které má tvůrce rád.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo =>
      'Neplacená/Osobní Propagace';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Podobné \"sponzoru\" kromě neplacených nebo osobních propagací. Toto obsahuje sekci o zboží, darech, nebo informacích o kolaboracích. ';

  @override
  String get sponsorBlockCategoryInteraction => 'Připomenutí Interakce (Odběr)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Pokud je zobrazen krátké připomenutí lajku, odběru nebo sledování uprostřed kontentu. Pokud je moc dlouhé nebo něco specifické, mělo by být uvedeno pod osobní propagací.';

  @override
  String get sponsorBlockCategoryIntro => 'Přestávka/Vstupní Animace';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Interval bez skutečného kontentu. Může být pauza, statický snímek, opakující se animace. Toto by nemělo být využíváno pro přechod obsahující informace.';

  @override
  String get sponsorBlockCategoryOutro => 'Konečné karty/Poděkování';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Poděkování nebo když se objeví konečné YouTube karty. Ne závěry s informacemi.';

  @override
  String get sponsorBlockCategoryPreview => 'Ukázka/Rekapitulace';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Kolekce klipů které ukazují co bude nadcházet v tomto videu nebo jiných videích v sérii ve kterých jsou informace opakováný později ve videu.';

  @override
  String get sponsorBlockCategoryFiller => 'Výplň/Vtipy';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Tangential scenes added only for filler or humor that are not required to understand the main content of the video. This should not include segments providing context or background details. This is a very aggressive category meant for when you aren\'t in the mood for \"fun\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'Hudba: Sekce bez hudby';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Interval bez skutečného kontentu. Může být pauza, statický snímek, opakující se animace. Toto by nemělo být využíváno pro přechod obsahující informace.';

  @override
  String get useProxy => 'Proxy videí';

  @override
  String get useProxyDescription =>
      'Využivánín proxy pro vysílání videí ze serveru, může obejít regionální omezení nebo blokaci YouTube správcem sítě';

  @override
  String get pressDownToShowSettings =>
      'Stiskněte dolu pro zobrazení nastavení';

  @override
  String get quality => 'Kvalita';

  @override
  String get audio => 'Zvuk';

  @override
  String get subtitles => 'Titulky';

  @override
  String get playbackSpeed => 'Rychlost přehrávání';

  @override
  String get blackBackground => 'Černé pozadí';

  @override
  String get blackBackgroundDescription => 'Pro tmavé téma na OLED obrazovkách';

  @override
  String get search => 'Hledat';

  @override
  String get subtitleFontSize => 'Velikost fontu titulků';

  @override
  String get subtitleFontSizeDescription =>
      'Změňte velikost titulků pokud jsou moc malé nebo moc velké na vašem zařízení';

  @override
  String get skipSslVerification => 'Přeskočit ověření SSL certifikátu';

  @override
  String get skipSslVerificationDescription =>
      'Pro použití vlastnoručně podepsaného SSL certifikátu, nebo chyb se serverem při používání SSL.';

  @override
  String get themeBrightness => 'Téma';

  @override
  String get themeLight => 'Světlé';

  @override
  String get themeDark => 'Tmavé';

  @override
  String get followSystem => 'Podle systému';

  @override
  String get requiresRestart => 'Vyžaduje restartování aplikace';

  @override
  String get appLanguage => 'Jazyk aplikace';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString videí',
      one: '1 video',
      zero: 'Žádná videa',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Url must start with http:// or https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Zobrazit odhadovaný počet dislajků použitím API poskytované returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'Custom RYD instance url';

  @override
  String get rydCustomInstanceDescription =>
      'Use a different RYD instance, leave empty to use the default';

  @override
  String get autoplayVideoOnLoad => 'Automaticky přehrát video při načtení';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Automaticky začít přehrávat video po načtení';

  @override
  String get searchHistory => 'Historie vyhledávání';

  @override
  String get searchHistoryDescription => 'Nastavení historie vyhledávání';

  @override
  String get enableSearchHistory => 'Povolit historii vyhledávání';

  @override
  String get searchHistoryLimit => 'Limit historie vyhledávání';

  @override
  String get searchHistoryLimitDescription =>
      'Nastavte počet posledních vyhledávání v návrzích';

  @override
  String get shorts => 'Krátká videa';

  @override
  String get searchUploadDate => 'Datum zveřejnění';

  @override
  String get searchUploadDateAny => 'Nějaký datum';

  @override
  String get searchUploadDateHour => 'Poslední hodina';

  @override
  String get searchUploadDateToday => 'Dneska';

  @override
  String get searchUploadDateWeek => 'Tenhle týden';

  @override
  String get searchUploadDateMonth => 'Tenhle měsíc';

  @override
  String get searchUploadDateYear => 'Tenhle rok';

  @override
  String get searchDuration => 'Délka';

  @override
  String get searchDurationAny => 'Všechny délky';

  @override
  String get searchDurationShort => 'Krátké (<4 minut)';

  @override
  String get searchDurationLong => 'Dlouhé (>20 minut)';

  @override
  String get searchDurationMedium => 'Střední (4-20 minut)';

  @override
  String get searchSortBy => 'Seřadit podle';

  @override
  String get searchSortRelevance => 'Relevance';

  @override
  String get searchSortRating => 'Hodnocení';

  @override
  String get searchSortUploadDate => 'Datum zveřejnění';

  @override
  String get searchSortViewCount => 'Počet shlédnutí';

  @override
  String get clearSearchHistory => 'Vyčistit historii vyhledávání';

  @override
  String get appLogs => 'Protokoly aplikací';

  @override
  String get appLogsDescription =>
      'Dostat protokoly o tom, co se dějě v aplikaci, může být přínosné pro hlášení problémů';

  @override
  String get copyToClipBoard => 'Copy to clipboard';

  @override
  String get logsCopied => 'Logs copied to clipboard';

  @override
  String get rememberSubtitleLanguage => 'Pamatovat si jazyk titulek';

  @override
  String get videoFilters => 'Video filters';

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
      'Hide or Obfuscate videos from all the video feeds in the application based on the filters defined below. This allow you for example to hide sports spoilers or hide shorts from a certain channel.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Define rules to filter out videos';

  @override
  String get videoFilterAllChannels => 'All channels';

  @override
  String get addVideoFilter => 'Create filter';

  @override
  String get editVideoFilter => 'Edit filter';

  @override
  String get videoFilterType => 'Type';

  @override
  String get videoFilterOperation => 'Operation';

  @override
  String get videoFilterValue => 'Value';

  @override
  String get save => 'Save';

  @override
  String get videoFilterEditDescription =>
      'Select an optional channel, a filter type, operation and a value to filter OUT videos from lists. Example, type: video name, operation: contains, value: test will EXCLUDE all the videos with the word test in their name.';

  @override
  String get optional => 'optional';

  @override
  String get videoFilterHideLabel => 'Hide';

  @override
  String get videoFilterFilterLabel => 'Obfuscate';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter videos where $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered => 'Video filtered for the following reason(s):';

  @override
  String get videoFilterTapToReveal => 'Tap to reveal';

  @override
  String get videoFilterHide => 'Hide filtered videos';

  @override
  String get videoFilterHideDescription =>
      'By default filtered videos are not hidden but shown as obfuscated with the reason(s) why it has been filtered. This setting remove the filtered videos from lists.';

  @override
  String get videoFilterNoFilters =>
      'No video filters, tap the + button below to start adding filters.';

  @override
  String get videoFilterTypeVideoTitle => 'Video title';

  @override
  String get videoFilterTypeChannelName => 'Channel name';

  @override
  String get videoFilterTypeVideoLength => 'Video length (seconds)';

  @override
  String get videoFilterOperationContains => 'Contains';

  @override
  String get videoFilterOperationNotContain => 'Does not contain';

  @override
  String get videoFilterOperationLowerThan => 'Lower than';

  @override
  String get videoFilterOperationHigherThan => 'Higher than';

  @override
  String get channel => 'Channel';

  @override
  String get videoFilterHideAllFromChannel => 'Filter all videos from channel';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter all videos from channel';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Automatically set subtitles to last language selected, if available';

  @override
  String get lockFullScreenToLandscape =>
      'Lock full screen orientation to video aspect ratio';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Locks the full screen orientation based on video format, landscape for wide video and portrait for portrait videos';

  @override
  String get fillFullscreen => 'Maximize video to fit screen';

  @override
  String get fillFullscreenDescription =>
      'Adjusts the video to fill the entire screen in landscape mode';

  @override
  String get rememberPlaybackSpeed => 'Remember playback speed';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Automatically set playback speed to the last speed selected';

  @override
  String get downloads => 'Downloads';

  @override
  String get download => 'Download';

  @override
  String get videoAlreadyDownloaded => 'Video already downloaded';

  @override
  String get noDownloadedVideos =>
      'No downloaded videos, browse, long press on a video in a list or tap the download button on a video screen to download';

  @override
  String get downloadsPlayAll => 'Play all';

  @override
  String get videoDownloadStarted => 'Video download started';

  @override
  String get videoFailedDownloadRetry => 'Download failed, tap to retry';

  @override
  String get videoDownloadAudioOnly => 'Audio only';

  @override
  String get manageSubscriptions => 'Manage Subscriptions';

  @override
  String get noSubscriptions =>
      'No subscriptions, browse videos and subscribe to any channel you like.';

  @override
  String get youCanSubscribeAgainLater =>
      'You can subscribe to this channel again later';

  @override
  String get unSubscribeQuestion => 'Unsubscribe ?';

  @override
  String get clearHistoryQuestion => 'Clear history ?';

  @override
  String get clearHistoryQuestionExplanation =>
      'This will clear your viewing history of your account on the Invidious instance you use. This cannot be undone.';

  @override
  String get noHistory =>
      'No viewing history, watch some videos and it will appear here';

  @override
  String get homeLayoutEditor => 'Edit home layout';

  @override
  String get layoutEditorAddVideoSource => 'Add video source';

  @override
  String get layoutEditorExplanation =>
      'You can decide what to display on your home screen, you can have up to 2 small view with horizontal scrolling and one big source.';

  @override
  String get home => 'Home';

  @override
  String get library => 'Library';

  @override
  String get customizeAppLayout => 'Customize app sections';

  @override
  String get customizeAppLayoutExplanation =>
      'Select which sections you want to appear in the main app navigation bar. Click on the home icon to select which screen shows when the application starts. You can reorder the sections by dragging them around.';

  @override
  String get navigationBarStyle => 'Navigation bar style';

  @override
  String get navigationBarLabelAlwaysShowing => 'Label always showing';

  @override
  String get navigationBarLabelShowOnSelect => 'Label shown on selected item';

  @override
  String get navigationBarLabelNeverShow => 'Never show label';

  @override
  String get distractionFreeMode => 'Distraction free mode';

  @override
  String get distractionFreeModeDescription =>
      'Disable video comments and recommendations';

  @override
  String get secondsShortForm => 'secs';

  @override
  String get videoFilterApplyDateToFilter => 'Filter videos on given times';

  @override
  String get videoFilterDayOfWeek => 'Select days to apply filters';

  @override
  String get videoFilterDayOfWeekDescription =>
      'You can selectively choose days of the week and time to which the filters apply to, for example, avoid sport events spoilers.';

  @override
  String get videoFilterStartTime => 'Start time';

  @override
  String get videoFilterEndTime => 'End time';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Applied on $selectedDays';
  }

  @override
  String get from => 'From';

  @override
  String get to => 'To';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'From $from to $to';
  }

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsDescription =>
      'Enable and review what you are notified about';

  @override
  String get enableNotificationDescriptions =>
      'Runs foreground service to check and notify you on the changes you are monitoring';

  @override
  String get subscriptionNotification => 'Subscription notifications';

  @override
  String get subscriptionNotificationDescription =>
      'Get notified of new videos from your subscription feed if you are logged in to your current instance';

  @override
  String get subscriptionNotificationTitle =>
      'New videos from your subscriptions';

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
      'Disabling battery optimization required';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'In order to send notification Clipious needs to run a background service. For it to run smoothly it is required that Clipious is given unrestricted battery usage, tapping ok will open the battery optimization settings.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Notifications turned off';

  @override
  String get askToEnableBackgroundServiceContent =>
      'To get notifications, Clipious notifications need to be enabled, press OK to enable it.';

  @override
  String get otherNotifications => 'Other notifications sources (bell icons)';

  @override
  String get deleteChannelNotificationTitle => 'Delete channel notification ?';

  @override
  String get deleteChannelNotificationContent =>
      'You won\'t receive anymore notifications from this channel.';

  @override
  String get deletePlaylistNotificationTitle =>
      'Delete playlist notification ?';

  @override
  String get deletePlaylistNotificationContent =>
      'You won\'t receive anymore notifications from this playlist.';

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
    return 'New videos in $playlist playlist';
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
  String get foregroundServiceNotificationTitle => 'Video monitoring';

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
      'Checking subscriptions...';

  @override
  String get foregroundServiceUpdatingPlaylist => 'Checking playlists...';

  @override
  String get foregroundServiceUpdatingChannels => 'Checking channels...';

  @override
  String get notificationFrequencySettingsTitle => 'New video check frequency';

  @override
  String get notificationFrequencySettingsDescription =>
      'How often the application will check for new videos';

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
  String get subtitlesBackground => 'Subtitles background';

  @override
  String get subtitlesBackgroundDescription =>
      'Adds a black background to subtitles to make them more readable';

  @override
  String get history => 'History';

  @override
  String get deArrowSettingDescription =>
      'Replace click bait titles and thumbnails';

  @override
  String get deArrowReplaceThumbnails => 'Replace thumbnails';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Replace video thumbnails in addition of the titles';

  @override
  String get deArrowWarning =>
      'Enabling DeArrow can significantly reduce the browsing speed of the app as extra http requests are needed for every single video';

  @override
  String get copySettingsAsJson => 'Copy settings as JSON to clipboard';

  @override
  String get copySettingsAsJsonDescription =>
      'Copy the settings as JSON to help debugging if you encounter an issue with the app and decide to raise an issue';

  @override
  String get seeking => 'Seeking';

  @override
  String get skipStep => 'Skip forward/backward step';

  @override
  String get skipStepDescription =>
      'Seconds to skip on forward/backward actions';

  @override
  String get exponentialSkip => 'Exponential skip forward/backward';

  @override
  String get exponentialSkipDescription =>
      'The more you skip forward, the bigger the step is.';

  @override
  String get fullscreenOnLandscape => 'Full screen on landscape';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Switch to full screen when the device is rotated to landscape mode';

  @override
  String get enabled => 'Enabled';

  @override
  String get submitFeedback => 'Submit feedback';

  @override
  String get submitFeedbackDescription =>
      'Found a bug or have a suggestion? Use this tool to take screenshot of the app, annotate and submit feedback';

  @override
  String get feedbackDisclaimer =>
      'To submit feedback you will need a GitHub account and your screenshot will be submitted to Imgur anonymously.';

  @override
  String get feedbackScreenshotError =>
      'Error while uploading screenshot to Imgur';

  @override
  String get channelSortByNewest => 'Newest';

  @override
  String get channelSortByOldest => 'Oldest';

  @override
  String get channelSortByPopular => 'Popular';

  @override
  String get invidiousAccount => 'Invidious account';

  @override
  String get onDeviceSubscriptions => 'On device';

  @override
  String get both => 'Both';

  @override
  String get refresh => 'Refresh';

  @override
  String get addBasicAuth => 'Add Basic Authentication';

  @override
  String get addBasicAuthExplanation =>
      'If your server requires basic HTTP authentication, add the details below. These are not your invidious account details';

  @override
  String get addHeader => 'Add header';

  @override
  String get advancedConfiguration => 'Advanced Configuration';

  @override
  String get customHeaders => 'Custom headers';

  @override
  String get customHeadersExplanation =>
      'Set custom headers to be sent to the invidious server';

  @override
  String get value => 'Value';

  @override
  String get testAndAddServer => 'Test and add server';

  @override
  String get alsoTestServerConfig =>
      'Also test server configuration, like if thumbnails would display properly';

  @override
  String get serverAlreadyExists => 'Server already exists in settings';

  @override
  String get wrongThumbnailConfiguration =>
      'The server is reachable but is not configured properly, the video and channel thumbnails will not be displayed properly. Disable the server test configuration if you are OK with this, fix your server otherwise';

  @override
  String get openWikiLink => 'Open wiki for help';

  @override
  String get serverUnreachable =>
      'Server is unreachable, or is not a valid invidious server';

  @override
  String get copyToDownloadFolder => 'Copy to download folder';

  @override
  String get fileCopiedToDownloadFolder => 'File copied to download folder';

  @override
  String get videoDeleted => 'Video deleted';

  @override
  String get sleepTimer => 'Sleep timer';

  @override
  String get stopTheVideo => 'Stop the video';

  @override
  String get stopTheVideoExplanation =>
      'If enabled, the video will be closed, if disabled the video will be simply paused';

  @override
  String get setTimer => 'Set timer';

  @override
  String get cancelSleepTimer => 'Cancel sleep timer';

  @override
  String premieresIn(Object formattedDuration) {
    return 'Premieres in $formattedDuration';
  }

  @override
  String get screenControls => 'Screen controls';

  @override
  String get screenControlsExplanation =>
      'When watching a video in full screen, Vertically dragging from the left or the right will adjust the brightness or volume respectively';

  @override
  String get retry => 'Retry';

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
