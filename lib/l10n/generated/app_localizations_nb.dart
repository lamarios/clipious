// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get subscriptions => 'Abonnementer';

  @override
  String get playlists => 'Spillelister';

  @override
  String get popular => 'Populært';

  @override
  String get trending => 'På vei opp';

  @override
  String get noVideoInPlayList => 'Tom spilleliste';

  @override
  String get removeFromPlayList => 'Fjern fra spilleliste';

  @override
  String get deletePlayListQ => 'Slett spilleliste?';

  @override
  String get irreversibleAction => 'Dette kan ikke angres';

  @override
  String get addPlayList => 'Legg til spilleliste';

  @override
  String get playListName => 'Spillelistenavn';

  @override
  String get playlistVisibility => 'Synlighet';

  @override
  String get publicPlaylist => 'Offentlig';

  @override
  String get privatePlaylist => 'Privat';

  @override
  String get cancel => 'Avbryt';

  @override
  String get add => 'Legg til';

  @override
  String get unlistedPlaylist => 'Ulistet';

  @override
  String get info => 'Info';

  @override
  String get videos => 'Videoer';

  @override
  String get streams => 'Strømmer';

  @override
  String get latestVideos => 'Nyligste videoer';

  @override
  String get subscribed => 'Abonnert';

  @override
  String get subscribe => 'Abonner';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Ingen abonnenter',
        'other': '$count abonnenter',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Del';

  @override
  String get shareYoutubeLink => 'Del YouTube-lenke';

  @override
  String get shareInvidiousLink => 'Del Invidious-lenke';

  @override
  String get redirectInvidiousLink => 'Del Invidious omdirigeringslenke';

  @override
  String get shareLinkWithTimestamp => 'Legg til tidsstempel';

  @override
  String get ok => 'OK';

  @override
  String get noChannels => 'Ingen kanaler';

  @override
  String get noPlaylists => 'Ingen spillelister';

  @override
  String get channels => 'Kanaler';

  @override
  String get couldntLoadVideo => 'Kunne ikke laste inn videoen';

  @override
  String get comments => 'Kommentarer';

  @override
  String get recommended => 'Anbefalt';

  @override
  String get couldntFetchVideos =>
      'Kunne ikke hente videoer. Trykk for å prøve igjen.';

  @override
  String get wizardIntro =>
      'Velg en offentlig tjener, eller legg til din egen. Du kan endre dette senere i innstillingene.';

  @override
  String get startUsingClipious => 'Begynn å bruke Clipious';

  @override
  String get videoAddedToPlaylist => 'Video lagt til på spilleliste';

  @override
  String get videoAddedToQueue => 'Video lagt til i køen';

  @override
  String get errorAddingVideoToPlaylist =>
      'Kunne ikke legge til video på spilleliste';

  @override
  String get itemlistErrorGeneric => 'Kunne ikke hente data';

  @override
  String get itemListErrorInvalidScope =>
      'Du har ikke tillatelse til å se dette, hvis du logget inn med token-metoden, prøv å logge ut og inn igjen';

  @override
  String get selectPlaylist => 'Velg spilleliste';

  @override
  String get createNewPlaylist => 'Opprett ny spilleliste';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString svar',
      one: '1 svar',
      zero: 'Ingen svar',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Last inn flere';

  @override
  String get topSorting => 'Topp';

  @override
  String get newSorting => 'Nye';

  @override
  String get streamIsLive => 'Direkte';

  @override
  String get sponsorSkipped => 'Segment skippet';

  @override
  String get selectBrowsingCountry => 'Velg utforskningsland';

  @override
  String get showOnStart => 'Velg hva som skal vises når programmet starter';

  @override
  String get settings => 'Innstillinger';

  @override
  String get browsing => 'Utforskning';

  @override
  String get country => 'Land';

  @override
  String get whenAppStartsShow => 'Når programmer starter, vis …';

  @override
  String get servers => 'Tjenere';

  @override
  String get manageServers => 'Håndter tjenere';

  @override
  String currentServer(String current) {
    return 'Bruker for øyeblikket $current';
  }

  @override
  String get useSponsorBlock => 'Bruk SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'Hopp over sponsorsegmenter gemenskapen finner';

  @override
  String get about => 'Om';

  @override
  String get name => 'Navn';

  @override
  String get package => 'Pakke';

  @override
  String get version => 'Versjon';

  @override
  String get build => 'Bygg';

  @override
  String get addServer => 'Legg til tjener';

  @override
  String get useThisServer => 'Bruk denne tjeneren';

  @override
  String get logIn => 'Logg inn';

  @override
  String get delete => 'Slett';

  @override
  String get invalidInvidiousServer => 'Ugyldig Invidious-tjener';

  @override
  String get yourServers => 'Dine tjenere';

  @override
  String get loggedIn => 'Innlogget';

  @override
  String get notLoggedIn => 'Ikke innlogget. Trykk for å logge inn.';

  @override
  String get addServerHelpText =>
      'Bruk «+»-knappen for å legge til egne tjenere, eller trykk på en offentlig tjener for å legge den til.';

  @override
  String get publicServers => 'Offentlige tjenere';

  @override
  String get loadingPublicServer => 'Laster inn offentlige tjenere';

  @override
  String get tapToAddServer => 'Trykk for å legge til en tjener på listen din';

  @override
  String get publicServersError =>
      'Kunne ikke hente liste over offentlige tjenere. Trykk for å prøve igjen.';

  @override
  String get appearance => 'Utseende';

  @override
  String get useDynamicTheme => 'Dynamiske farger';

  @override
  String get useDynamicThemeDescription =>
      'Bruker Material You-farger (kun tilgjengelig på Android 12+)';

  @override
  String get useDash => 'Bruk DASH';

  @override
  String get useDashDescription =>
      'Adaptiv DASH-strømming kan noen ganger være problematisk, YouTube kan strupe det.';

  @override
  String get videoPlayer => 'Videospiller';

  @override
  String get videoListed => 'Offentlig';

  @override
  String get videoUnlisted => 'Ulistet';

  @override
  String get videoIsFamilyFriendly => 'Familievennlig';

  @override
  String get tapToManage => 'Trykk for å håndtere';

  @override
  String get authentication => 'Identitetsbekreftelse';

  @override
  String get tokenLogin => 'Logg inn med symbol';

  @override
  String get tokenLoginDescription => 'Anbefalt innloggingsmetode';

  @override
  String get cookieLogin => 'Logg inn med kake';

  @override
  String get cookieLoginDescription =>
      'Bruk denne metoden hvis du har problemer med symbol-identitetsbekreftelse';

  @override
  String get logout => 'Logg ut';

  @override
  String get username => 'Brukernavn';

  @override
  String get password => 'Passord';

  @override
  String get wrongUsernamePassword => 'Feil brukernavn eller passord';

  @override
  String get error => 'Feil';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats er ikke som forventet';

  @override
  String get malformedStatsEndpointDescription =>
      'Serverstatistikk endepunktet svarte ikke med et forventet svar, nøkkelen \"software.name\" skal være lik \"invidious\".\nSvar fra serveren:';

  @override
  String get serverIsNotReachable => 'Tjeneren er ikke tilgjengelig';

  @override
  String get videoQueue => 'Videokø';

  @override
  String get addToQueueList => 'Legg til i kø';

  @override
  String get addToPlaylist => 'Legg til i spilleliste';

  @override
  String get playNext => 'Spill av neste';

  @override
  String get playNextAddedToQueue => 'Video spilles av neste';

  @override
  String get addRecommendedToQueue => 'Spill av neste anbefalte automatisk';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Velg segmenttyper å hoppe over';

  @override
  String get sponsorBlockCategorySponsor => 'Sponsor';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Betalt promotering, betalte henvisninger og direktereklame. Ikke for egenreklame eller gratis nevning av formål/skapere/nettsteder/produkter skaperen liker.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => 'Ubetalt/Selvpromotering';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Ligner \"Sponsor\", men for ubetalt-/ selvpromotering. Inkluderer seksjoner om varer, donasjoner, eller informasjon om hvem skaperen har samarbeidet med. ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Interaksjonspåminnelse (abonnering)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Når det er en kort påminnelse om abonnering, liking eller følging midt i innhold. Lange innlegg skal legges i «Selvpromotering».';

  @override
  String get sponsorBlockCategoryIntro => 'Pause/Introanimasjon';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Intervall uten innhold. Kan være pause, statisk bilde, eller gjentagende animasjon. Ikke for overganger som inneholder info.';

  @override
  String get sponsorBlockCategoryOutro => 'Sluttkort/Rulletekst';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Når sluttsekvensen vises. Ikke for konklusjoner med info.';

  @override
  String get sponsorBlockCategoryPreview => 'Forhåndsvisning/Oppsummering';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Samling av klipp som viser det som kommer i serien der all info gjentas senere i videoen.';

  @override
  String get sponsorBlockCategoryFiller => 'Fyllstoff/avsporing';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Ting kun for humor eller som ikke kreves for å forstå hovedinnholdet i videoen. Ikke for segmenter som har bindeleddsinfo eller bakgrunnsinfo. Veldig aggressiv kategori ment for dem som ikke er interessert i «gøy».';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'Musikk: Stille del';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Intervall uten innhold. Pause, statisk bilde, eller gjentagende animasjon. Ikke for overganger som inneholder info.';

  @override
  String get useProxy => 'Mellomtjen videoer';

  @override
  String get useProxyDescription =>
      'Ved å mellomtjene videostrømmer fra tjeneren kan du omgå lokal blokkering eller ISP-er som blokkerer YouTube';

  @override
  String get pressDownToShowSettings => 'Trykk ↓ for å vise innstillinger';

  @override
  String get quality => 'Kvalitet';

  @override
  String get audio => 'Lyd';

  @override
  String get subtitles => 'Undertekster';

  @override
  String get playbackSpeed => 'Avspillingshastighet';

  @override
  String get blackBackground => 'Svart bakgrunn';

  @override
  String get blackBackgroundDescription => 'For mørkt tema på OLED skjermer.';

  @override
  String get search => 'Søk';

  @override
  String get subtitleFontSize => 'Skriftstørrelse for undertekster';

  @override
  String get subtitleFontSizeDescription =>
      'Endre størrelsen på undertekstene hvis de er for store eller små på enheten din';

  @override
  String get skipSslVerification => 'Hopp over SSL-sertifikatsbekreftelse';

  @override
  String get skipSslVerificationDescription =>
      'For bruk av et selvsignert SSL-sertifikat, eller når du har SSL-relaterte problemer med tjeneren din.';

  @override
  String get themeBrightness => 'Tema';

  @override
  String get themeLight => 'Lyst';

  @override
  String get themeDark => 'Mørkt';

  @override
  String get followSystem => 'Følg system';

  @override
  String get requiresRestart => 'Krever omstart av appen';

  @override
  String get appLanguage => 'Språk';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString videoer',
      one: '1 video',
      zero: 'Ingen videoer',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Url must start with http:// or https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Vis anslåtte mengder dislike på videoer ved hjelp av API levert av returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'Custom RYD instance url';

  @override
  String get rydCustomInstanceDescription =>
      'Use a different RYD instance, leave empty to use the default';

  @override
  String get autoplayVideoOnLoad => 'Spill av video automatisk ved innlasting';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Start automatisk avspilling av videoen etter at den er lastet inn';

  @override
  String get searchHistory => 'Søkehistorikk';

  @override
  String get searchHistoryDescription => 'Instillinger for søkehistorikk';

  @override
  String get enableSearchHistory => 'Aktiver søkehistorikk';

  @override
  String get searchHistoryLimit => 'Søkehistorikk grense';

  @override
  String get searchHistoryLimitDescription =>
      'Angi hvor mange tidligere søk som skal vises i forslag';

  @override
  String get shorts => 'Shorts';

  @override
  String get searchUploadDate => 'Opplastningsdato';

  @override
  String get searchUploadDateAny => 'Alle datoer';

  @override
  String get searchUploadDateHour => 'Siste time';

  @override
  String get searchUploadDateToday => 'I dag';

  @override
  String get searchUploadDateWeek => 'Denne uken';

  @override
  String get searchUploadDateMonth => 'Denne måneden';

  @override
  String get searchUploadDateYear => 'Dette året';

  @override
  String get searchDuration => 'Lengde';

  @override
  String get searchDurationAny => 'Any duration';

  @override
  String get searchDurationShort => 'Kort (<4 minutter)';

  @override
  String get searchDurationLong => 'Lang (>20 minutter)';

  @override
  String get searchDurationMedium => 'Middels (4-20 minutter)';

  @override
  String get searchSortBy => 'Sorter etter';

  @override
  String get searchSortRelevance => 'Relevanse';

  @override
  String get searchSortRating => 'Vurdering';

  @override
  String get searchSortUploadDate => 'Opplastningsdato';

  @override
  String get searchSortViewCount => 'Seertall';

  @override
  String get clearSearchHistory => 'Slett søkehistorikk';

  @override
  String get appLogs => 'Applikasjonslogger';

  @override
  String get appLogsDescription =>
      'Få logger over hva som skjer i applikasjonen, kan være nyttig for å rapportere problemer';

  @override
  String get copyToClipBoard => 'Kopier til utklippstavle';

  @override
  String get logsCopied => 'Logger kopiert til utklippstavlen';

  @override
  String get rememberSubtitleLanguage => 'Husk undertekstspråk';

  @override
  String get videoFilters => 'Videofiltre';

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
      'Skjul eller obfusker videoer fra alle videofeedene i applikasjonen basert på filtrene som er definert nedenfor. Dette lar deg for eksempel skjule sportsspoilere eller skjule shorts fra en bestemt kanal.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Definer regler for å filtrere ut videoer';

  @override
  String get videoFilterAllChannels => 'Alle kanaler';

  @override
  String get addVideoFilter => 'Opprett filter';

  @override
  String get editVideoFilter => 'Rediger filter';

  @override
  String get videoFilterType => 'Filtertype';

  @override
  String get videoFilterOperation => 'Operasjon';

  @override
  String get videoFilterValue => 'Verdi';

  @override
  String get save => 'Lagre';

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
