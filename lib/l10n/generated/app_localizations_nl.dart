// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get subscriptions => 'Abonnementen';

  @override
  String get playlists => 'Afspeellijsten';

  @override
  String get popular => 'Populair';

  @override
  String get trending => 'Uitgelicht';

  @override
  String get noVideoInPlayList => 'Geen video\'s in afspeellijst';

  @override
  String get removeFromPlayList => 'Verwijderen uit afspeellijst';

  @override
  String get deletePlayListQ => 'Afspeellijst verwijderen?';

  @override
  String get irreversibleAction => 'Deze actie is onomkeerbaar';

  @override
  String get addPlayList => 'Afspeellijst maken';

  @override
  String get playListName => 'Afspeellijstnaam';

  @override
  String get playlistVisibility => 'Zichtbaarheid';

  @override
  String get publicPlaylist => 'Openbaar';

  @override
  String get privatePlaylist => 'Privé';

  @override
  String get cancel => 'Annuleren';

  @override
  String get add => 'Toevoegen';

  @override
  String get unlistedPlaylist => 'Verborgen';

  @override
  String get info => 'Info';

  @override
  String get videos => 'Video\'s';

  @override
  String get streams => 'Streams';

  @override
  String get latestVideos => 'Nieuwste video\'s';

  @override
  String get subscribed => 'Geabonneerd';

  @override
  String get subscribe => 'Abonneren';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Geen abonnees',
        'other': '$count abonnees',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Delen';

  @override
  String get shareYoutubeLink => 'YouTube-link delen';

  @override
  String get shareInvidiousLink => 'Invidious-link delen';

  @override
  String get redirectInvidiousLink => 'Invidious-omleidings­link delen';

  @override
  String get shareLinkWithTimestamp => 'Tijdstempel toevoegen';

  @override
  String get ok => 'OK';

  @override
  String get noChannels => 'Geen kanalen';

  @override
  String get noPlaylists => 'Geen afspeellijsten';

  @override
  String get channels => 'Kanalen';

  @override
  String get couldntLoadVideo => 'Kan video niet laden';

  @override
  String get comments => 'Opmerkingen';

  @override
  String get recommended => 'Aanbevolen';

  @override
  String get couldntFetchVideos =>
      'Kan video\'s niet laden. Klik om opnieuw te proberen.';

  @override
  String get wizardIntro =>
      'Selecteer een openbare server of voeg uw eigen server toe. (Kan later worden gewijzigd in de instellingen)';

  @override
  String get startUsingClipious => 'Beginnen';

  @override
  String get videoAddedToPlaylist => 'Video toe­gevoegd aan afspeel­lijst';

  @override
  String get videoAddedToQueue => 'Video toegevoegd aan wachtrij';

  @override
  String get errorAddingVideoToPlaylist =>
      'Fout bij toevoegen van video aan afspeellijst';

  @override
  String get itemlistErrorGeneric => 'Kon gegevens niet ophalen';

  @override
  String get itemListErrorInvalidScope =>
      'U heeft geen toestemming om dit te zien. Als u hebt ingelogd met de tokenmethode, probeer dan uit en weer in te loggen';

  @override
  String get selectPlaylist => 'Afspeellijst selecteren';

  @override
  String get createNewPlaylist => 'Afspeellijst aanmaken';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString reacties',
      one: '1 reactie',
      zero: 'Geen reacties',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Meer laden';

  @override
  String get topSorting => 'Top';

  @override
  String get newSorting => 'Nieuw';

  @override
  String get streamIsLive => 'Live';

  @override
  String get sponsorSkipped => 'Sponsor overgeslagen';

  @override
  String get selectBrowsingCountry => 'Land voor inhoud';

  @override
  String get showOnStart => 'Selecteer wat je wilt zien als je de app opent';

  @override
  String get settings => 'Instellingen';

  @override
  String get browsing => 'Bladeren';

  @override
  String get country => 'Land';

  @override
  String get whenAppStartsShow => 'Als de app start, toon…';

  @override
  String get servers => 'Servers';

  @override
  String get manageServers => 'Servers beheren';

  @override
  String currentServer(String current) {
    return '$current wordt gebruikt';
  }

  @override
  String get useSponsorBlock => 'Gebruik Sponsorblock';

  @override
  String get sponsorBlockDescription =>
      'Gesponsorde segmenten die zijn ingediend door de community overslaan';

  @override
  String get about => 'Over';

  @override
  String get name => 'Naam';

  @override
  String get package => 'Pakket';

  @override
  String get version => 'Versie';

  @override
  String get build => 'Bouwversie';

  @override
  String get addServer => 'Server toevoegen';

  @override
  String get useThisServer => 'Gebruik deze server';

  @override
  String get logIn => 'Inloggen';

  @override
  String get delete => 'Verwijderen';

  @override
  String get invalidInvidiousServer => 'Ongeldige Invidious-server';

  @override
  String get yourServers => 'Uw servers';

  @override
  String get loggedIn => 'Ingelogd';

  @override
  String get notLoggedIn => 'Niet ingelogd';

  @override
  String get addServerHelpText =>
      'Klik op de + om je eigen servers toe te voegen of klik op een publieke server en voeg die toe.';

  @override
  String get publicServers => 'Publieke servers';

  @override
  String get loadingPublicServer => 'Publieke servers laden';

  @override
  String get tapToAddServer => 'Klik om de server aan je lijst toe te voegen';

  @override
  String get publicServersError =>
      'Kon de lijst van publieke servers niet laden. Klik om opnieuw te proberen.';

  @override
  String get appearance => 'Uiterlijk';

  @override
  String get useDynamicTheme => 'Dynamische kleuren';

  @override
  String get useDynamicThemeDescription =>
      'Gebruik Material You kleuren (alleen beschikbaar op Android 12+)';

  @override
  String get useDash => 'Gebruik DASH';

  @override
  String get useDashDescription =>
      'DASH adaptieve streaming kan soms problematisch zijn; YouTube kan het vertragen.';

  @override
  String get videoPlayer => 'Videospeler';

  @override
  String get videoListed => 'Publiek';

  @override
  String get videoUnlisted => 'Verborgen';

  @override
  String get videoIsFamilyFriendly => 'Kindvriendelijk';

  @override
  String get tapToManage => 'Druk om te beheren';

  @override
  String get authentication => 'Authenticatie';

  @override
  String get tokenLogin => 'Inloggen met token';

  @override
  String get tokenLoginDescription => 'Aanbevolen inlog­methode';

  @override
  String get cookieLogin => 'Inloggen met cookie';

  @override
  String get cookieLoginDescription =>
      'Gebruik deze manier als je problemen ervaart met token authenticatie';

  @override
  String get logout => 'Uitloggen';

  @override
  String get username => 'Gebruikersnaam';

  @override
  String get password => 'Wachtwoord';

  @override
  String get wrongUsernamePassword =>
      'Verkeerde gebruikersnaam en/of verkeerd wachtwoord';

  @override
  String get error => 'Fout';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats is anders dan verwacht';

  @override
  String get malformedStatsEndpointDescription =>
      'Het server stats eindpunt gaf geen verwachte payload, de sleutel \"software.name\" moet \"invidious\" zijn.\nReactie van de server:';

  @override
  String get serverIsNotReachable => 'Server is onbereikbaar';

  @override
  String get videoQueue => 'Video­wachtrij';

  @override
  String get addToQueueList => 'Toevoegen aan wachtrij';

  @override
  String get addToPlaylist => 'Toevoegen aan afspeel­lijst';

  @override
  String get playNext => 'Volgende afspelen';

  @override
  String get playNextAddedToQueue => 'Video wordt hierna afgespeeld';

  @override
  String get addRecommendedToQueue =>
      'Aanbevolen video\'s automatisch afspelen';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Selecteer welk type segmenten je wilt overslaan';

  @override
  String get sponsorBlockCategorySponsor => 'Sponsor';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Betaalde promotie, betaalde verwijzingen en directe advertenties. Niet voor zelfpromotie of gratis shoutouts voor doelen, makers, websites of producten die ze leuk vinden.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => 'Onbetaald/Zelfpromotie';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Vergelijkbaar met \"sponsor\" maar dan voor onbetaalde of zelfpromotie. Dit is inclusief secties over merchandise, donaties of informatie over met wie ze hebben samengewerkt. ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Interactieherinnering (Abonneren)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Wanneer er een korte reminder is om te liken, te abonneren of te volgen midden in de inhoud. Als het segment lang is of over iets specifieks gaat, moet het onder zelfpromotie vallen.';

  @override
  String get sponsorBlockCategoryIntro => 'Pauze/Intro Animatie';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Een interval zonder daadwerkelijke inhoud. Kan een pauze, een stilstaand beeld of een herhalende animatie zijn. Deze categorie moet niet worden toegepast voor overgangen die informatie bevatten.';

  @override
  String get sponsorBlockCategoryOutro => 'Eindkaarten/credits';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Credits of als het Youtube eindscherm wordt getoond. Niet voor conclusies met informatie.';

  @override
  String get sponsorBlockCategoryPreview => 'Voorvertoning/terugblik';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Verzameling clips die laten zien wat er gaat komen in deze video of volgende video\'s in een serie, waarbij alle informatie later in de video wordt herhaald.';

  @override
  String get sponsorBlockCategoryFiller => 'Opvulling';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Extra scenes die alleen zijn toegevoegd als opvulling of voor de humor en niet nodig zijn om de inhoud van de video te begrijpen. Dit moet geen segmenten bevatten die achtergrond of context bieden. Dit is een erg agressieve categorie, bedoeld voor als je geen zin hebt in \"plezier\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'Muziek: Niet-Muziek Sectie';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Alleen te gebruiken in muziekvideo\'s. Dit moet alleen worden gebruikt voor delen van muziekvideo\'s die niet gedekt worden door een andere categorie.';

  @override
  String get useProxy => 'Video\'s omleiden';

  @override
  String get useProxyDescription =>
      'Door video\'s van de server te proxyen kan je regionale blokkades of een blokkade van je internetprovider voor YouTube omzeilen';

  @override
  String get pressDownToShowSettings => 'Druk op ⬇️ om instellingen te tonen';

  @override
  String get quality => 'Kwaliteit';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Ondertitels';

  @override
  String get playbackSpeed => 'Afspeel­snelheid';

  @override
  String get blackBackground => 'Zwarte achtergrond';

  @override
  String get blackBackgroundDescription =>
      'Voor donker thema op een OLED scherm';

  @override
  String get search => 'Zoeken';

  @override
  String get subtitleFontSize => 'Lettertype­grootte van ondertitels';

  @override
  String get subtitleFontSizeDescription =>
      'Verander de grootte van de ondertiteling als die te groot of te klein is op jouw apparaat';

  @override
  String get skipSslVerification => 'TLS-certificaat­verificatie overslaan';

  @override
  String get skipSslVerificationDescription =>
      'Voor het gebruik van een zelfondertekend SSL-certificaat, of als je SSL-gerelateerde problemen hebt met je server.';

  @override
  String get themeBrightness => 'Thema';

  @override
  String get themeLight => 'Licht';

  @override
  String get themeDark => 'Donker';

  @override
  String get followSystem => 'Systeem volgen';

  @override
  String get requiresRestart => 'Vereist herstart van app';

  @override
  String get appLanguage => 'App taal';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString video\'s',
      one: '1 video',
      zero: 'Geen video\'s',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Url moet beginnen met http:// of https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Toon geschatte video dislikes gebruikmakend van de API geleverd door returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'Aangepaste RYD-versie url';

  @override
  String get rydCustomInstanceDescription =>
      'Gebruik een andere RYD-versie, laat leeg om de standaard te gebruiken';

  @override
  String get autoplayVideoOnLoad => 'Video automatisch afspelen bij laden';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Start de video automatisch af te spelen nadat deze is geladen';

  @override
  String get searchHistory => 'Zoek­geschiedenis';

  @override
  String get searchHistoryDescription => 'Instellingen voor zoek­geschiedenis';

  @override
  String get enableSearchHistory => 'Zoek­geschiedenis inschakelen';

  @override
  String get searchHistoryLimit => 'Limiet van zoek­geschiedenis';

  @override
  String get searchHistoryLimitDescription =>
      'Stel in hoeveel eerdere zoekopdrachten worden weergegeven bij de suggesties';

  @override
  String get shorts => 'Shorts';

  @override
  String get searchUploadDate => 'Upload­datum';

  @override
  String get searchUploadDateAny => 'Elke datum';

  @override
  String get searchUploadDateHour => 'Afgelopen uur';

  @override
  String get searchUploadDateToday => 'Vandaag';

  @override
  String get searchUploadDateWeek => 'Afgelopen week';

  @override
  String get searchUploadDateMonth => 'Afgelopen maand';

  @override
  String get searchUploadDateYear => 'Afgelopen jaar';

  @override
  String get searchDuration => 'Duur';

  @override
  String get searchDurationAny => 'Elke duur';

  @override
  String get searchDurationShort => 'Kort (< 4 minuten)';

  @override
  String get searchDurationLong => 'Lang (> 20 minuten)';

  @override
  String get searchDurationMedium => 'Gemiddeld (4-20 minuten)';

  @override
  String get searchSortBy => 'Sorteren op';

  @override
  String get searchSortRelevance => 'Relevantie';

  @override
  String get searchSortRating => 'Beoordeling';

  @override
  String get searchSortUploadDate => 'Uploaddatum';

  @override
  String get searchSortViewCount => 'Weergaven';

  @override
  String get clearSearchHistory => 'Zoek­geschiedenis wissen';

  @override
  String get appLogs => 'App-logboek';

  @override
  String get appLogsDescription =>
      'Krijg logs van wat er gebeurt in de applicatie. Kan nuttig zijn om problemen te raporteren';

  @override
  String get copyToClipBoard => 'Kopiëren naar klembord';

  @override
  String get logsCopied => 'Log­boeken gekopieerd naar klem­bord';

  @override
  String get rememberSubtitleLanguage => 'Ondertitelings­taal onthouden';

  @override
  String get videoFilters => 'Video­filters';

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
      zero: 'Geen video\'s',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'Verberg of obfusceer video\'s van alle videofeeds in de app gebaseerd op de filters hieronder. Dit geeft bijvoorbeeld de mogelijkheid om sportuitslagen of shorts van een bepaald kanaal te verbergen.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Definieer regels om video\'s weg te filteren';

  @override
  String get videoFilterAllChannels => 'Alle kanalen';

  @override
  String get addVideoFilter => 'Filter aanmaken';

  @override
  String get editVideoFilter => 'Filter bewerken';

  @override
  String get videoFilterType => 'Type';

  @override
  String get videoFilterOperation => 'Handeling';

  @override
  String get videoFilterValue => 'Waarde';

  @override
  String get save => 'Opslaan';

  @override
  String get videoFilterEditDescription =>
      'Selecteer een optioneel kanaal, een filtertype, een bewerking en een waarde om video\'s uit lijsten WEG te filteren. Voorbeeld: type: videonaam, bewerking: bevat, waarde: test zal alle video\'s met het woord test in hun naam UITSLUITEN.';

  @override
  String get optional => 'optioneel';

  @override
  String get videoFilterHideLabel => 'Verbergen';

  @override
  String get videoFilterFilterLabel => 'Obfusceren';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter video\'s waar $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered => 'Video\'s gefilterd door de volgende reden(en):';

  @override
  String get videoFilterTapToReveal => 'Druk om te tonen';

  @override
  String get videoFilterHide => 'Gefilterde video\'s verbergen';

  @override
  String get videoFilterHideDescription =>
      'Standaard worden gefilterde video\'s niet verborgen maar verduisterd weergegeven met de reden(en) waarom ze zijn gefilterd. Deze instelling verwijdert de gefilterde video\'s uit de lijsten.';

  @override
  String get videoFilterNoFilters =>
      'Geen videofilters, klik op + om te beginnen met het toevoegen van filters.';

  @override
  String get videoFilterTypeVideoTitle => 'Videotitel';

  @override
  String get videoFilterTypeChannelName => 'Kanaal­naam';

  @override
  String get videoFilterTypeVideoLength => 'Video­lengte (seconden)';

  @override
  String get videoFilterOperationContains => 'Bevat';

  @override
  String get videoFilterOperationNotContain => 'Bevat geen';

  @override
  String get videoFilterOperationLowerThan => 'Minder dan';

  @override
  String get videoFilterOperationHigherThan => 'Meer dan';

  @override
  String get channel => 'Kanaal';

  @override
  String get videoFilterHideAllFromChannel =>
      'Alle video\'s van kanaal verbergen';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return 'Alle video\'s van kanaal $hideOrFilter';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Stel de ondertiteling automatisch in op de laatst geselecteerde taal, indien beschikbaar';

  @override
  String get lockFullScreenToLandscape =>
      'Koppel de oriëntatie van volledig scherm aan de beeldverhouding van de video';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Stelt de volledige schermoriëntatie in op basis van het videoformaat: landschap voor horizontale video\'s en portret voor verticale video\'s';

  @override
  String get fillFullscreen => 'Scherm­vullende video';

  @override
  String get fillFullscreenDescription =>
      'Past de video aan om in landschapsmodus het volledige scherm te vullen';

  @override
  String get rememberPlaybackSpeed => 'Afspeel­snelheid onthouden';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Stel de afspeelsnelheid automatisch in op de laatstgekozen snelheid';

  @override
  String get downloads => 'Downloads';

  @override
  String get download => 'Downloaden';

  @override
  String get videoAlreadyDownloaded => 'Video al gedownload';

  @override
  String get noDownloadedVideos =>
      'Geen gedownloade video\'s. Blader of zoek en houd een video in de resultaten lang ingedrukt of tik op de downloadknop op het afspeelscherm van een video om een video te downloaden';

  @override
  String get downloadsPlayAll => 'Alles afspelen';

  @override
  String get videoDownloadStarted => 'Downloaden van video gestart';

  @override
  String get videoFailedDownloadRetry =>
      'Download mislukt, druk om opnieuw te proberen';

  @override
  String get videoDownloadAudioOnly => 'Enkel audio';

  @override
  String get manageSubscriptions => 'Abonnementen beheren';

  @override
  String get noSubscriptions =>
      'Geen abonnementen. Blader door video\'s en abonneer je op de kanalen die je leuk vindt.';

  @override
  String get youCanSubscribeAgainLater =>
      'Je kan je later opnieuw op dit kanaal abonneren';

  @override
  String get unSubscribeQuestion => 'Deabonneren?';

  @override
  String get clearHistoryQuestion => 'Geschiedenis wissen?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Dit zal de kijkgeschiedenis wissen van je account op de Invidious-versie die je gebruikt. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get noHistory =>
      'Geen kijkgeschiedenis. Bekijk wat video\'s, dan worden ze hier weergegeven';

  @override
  String get homeLayoutEditor => 'Start-lay-out bewerken';

  @override
  String get layoutEditorAddVideoSource => 'Video­bron toevoegen';

  @override
  String get layoutEditorExplanation =>
      'Je kunt zelf beslissen wat je op je startscherm wilt weergeven. Je kunt maximaal 2 bronnen voor de kleine horizontale weergave en één bron met grote video\'s kiezen.';

  @override
  String get home => 'Start';

  @override
  String get library => 'Bibliotheek';

  @override
  String get customizeAppLayout => 'App-secties aanpassen';

  @override
  String get customizeAppLayoutExplanation =>
      'Selecteer welke items je wilt tonen in de hoofdnavigatiebalk van de app. Klik op het huisje om te kiezen welk scherm wordt weergegeven wanneer de applicatie start. Je kunt de volgorde aanpassen door de secties te slepen.';

  @override
  String get navigationBarStyle => 'Stijl van navigatie­balk';

  @override
  String get navigationBarLabelAlwaysShowing => 'Label altijd tonen';

  @override
  String get navigationBarLabelShowOnSelect =>
      'Label tonen op geselecteerd item';

  @override
  String get navigationBarLabelNeverShow => 'Label nooit tonen';

  @override
  String get distractionFreeMode => 'Afleidings­vrije modus';

  @override
  String get distractionFreeModeDescription =>
      'Video-opmerkingen en -aanbevelingen uitschakelen';

  @override
  String get secondsShortForm => 'sec';

  @override
  String get videoFilterApplyDateToFilter => 'Filter video\'s op gegeven tijd';

  @override
  String get videoFilterDayOfWeek =>
      'Selecteer dagen om de filters toe te passen';

  @override
  String get videoFilterDayOfWeekDescription =>
      'Je kunt selectief dagen van de week en tijdstippen kiezen waarop de filters van toepassing zijn, bijvoorbeeld om spoilers van sportevenementen te vermijden.';

  @override
  String get videoFilterStartTime => 'Starttijd';

  @override
  String get videoFilterEndTime => 'Eindtijd';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Toegepast op $selectedDays';
  }

  @override
  String get from => 'Van';

  @override
  String get to => 'Tot';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'Van $from tot $to';
  }

  @override
  String get notifications => 'Meldingen';

  @override
  String get notificationsDescription =>
      'Schakel meldingen in, en check waarover je meldingen ontvangt';

  @override
  String get enableNotificationDescriptions =>
      'Draait een voorgrondservice om de wijzigingen die je volg te controleren en je meldingen te geven';

  @override
  String get subscriptionNotification => 'Abonnement­meldingen';

  @override
  String get subscriptionNotificationDescription =>
      'Krijg meldingen van nieuwe video\'s van kanalen waarop je geabonneerd bent als je ingelogd bent op je huidige Invidious versie';

  @override
  String get subscriptionNotificationTitle =>
      'Nieuwe video\'s van je geabonneerde kanalen';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'zijn $countString nieuwe video\'s',
      one: 'is 1 nieuwe video',
      zero: 'zijn geen nieuwe video\'s',
    );
    return 'Er $_temp0 van je geabonneerde kanalen';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Batterij­optimalisatie uitschakelen vereist';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'Om meldingen te kunnen sturen moet Clipious een achtergrondservice uitvoeren. Voor een betrouwbare werking moet Clipious onbeperkt batterijgebruik krijgen. Door op ok te tikken, worden de instellingen voor batterijoptimalisatie geopend.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Meldingen uit­geschakeld';

  @override
  String get askToEnableBackgroundServiceContent =>
      'Om meldingen te ontvangen, moeten Clipious-meldingen zijn ingeschakeld. Druk op OK om deze meldingen in te schakelen.';

  @override
  String get otherNotifications => 'Andere meldingbronnen (bel pictogrammen)';

  @override
  String get deleteChannelNotificationTitle => 'Kanaal­melding verwijderen?';

  @override
  String get deleteChannelNotificationContent =>
      'Je zal geen meldingen meer ontvangen van dit kanaal.';

  @override
  String get deletePlaylistNotificationTitle =>
      'Afspeellijst­melding verwijderen?';

  @override
  String get deletePlaylistNotificationContent =>
      'Je zal geen meldingen meer ontvangen van deze afspeellijst.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Nieuwe video\'s van $channel';
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
      other: 'zijn $countString nieuwe video\'s',
      one: 'is 1 nieuwe video',
      zero: 'zijn geen nieuwe video\'s',
    );
    return 'Er $_temp0 van $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'Nieuwe video\'s in de afspeellijst $playlist';
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
      other: 'zijn $countString nieuwe video\'s',
      one: 'is 1 nieuwe video',
      zero: 'zijn geen nieuwe video\'s',
    );
    return 'Er $_temp0 in de afspeellijst $playlist';
  }

  @override
  String get foregroundServiceNotificationTitle => 'Video­monitoring';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'elk uur',
        '24': 'elke dag',
        'other': 'elke $hours uur',
      },
    );
    return 'Controleert voor nieuwe video\'s $_temp0';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'Abonnementen controleren…';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'Afspeel­lijsten controleren…';

  @override
  String get foregroundServiceUpdatingChannels => 'Kanalen controleren…';

  @override
  String get notificationFrequencySettingsTitle =>
      'Controle­frequentie voor nieuwe video\'s';

  @override
  String get notificationFrequencySettingsDescription =>
      'Hoe vaak de applicatie controleert voor nieuwe video\'s';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '1 dag',
        'other': '$hours uur',
      },
    );
    return '$_temp0';
  }

  @override
  String get subtitlesBackground => 'Achter­grond van onder­titels';

  @override
  String get subtitlesBackgroundDescription =>
      'Voegt een zwarte achtergrond toe aan de ondertiteling om deze beter leesbaar te maken';

  @override
  String get history => 'Geschiedenis';

  @override
  String get deArrowSettingDescription =>
      'Vervang clickbait titels en miniaturen';

  @override
  String get deArrowReplaceThumbnails => 'Miniaturen vervangen';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Vervang zowel videominiaturen als de titels';

  @override
  String get deArrowWarning =>
      'Het inschakelen van DeArrow kan de snelheid van bladeren door de app aanzienlijk verminderen, omdat voor elke afzonderlijke video extra HTTP-verzoeken nodig zijn';

  @override
  String get copySettingsAsJson =>
      'Kopieer instellingen als JSON naar het klembord';

  @override
  String get copySettingsAsJsonDescription =>
      'Kopieer de instellingen als JSON om te helpen bij het debuggen als je een probleem tegenkomt in de applicatie en dat besluit te melden';

  @override
  String get seeking => 'Zoeken';

  @override
  String get skipStep => 'Stap­grootte van voor-/achter­uit spoelen';

  @override
  String get skipStepDescription =>
      'Aantal seconden om over te slaan bij doorspoel/terugspoel acties';

  @override
  String get exponentialSkip => 'Exponentieel voor-/achter­uit spoelen';

  @override
  String get exponentialSkipDescription =>
      'Hoe meer je doorspoelt, des te groter de sprong wordt.';

  @override
  String get fullscreenOnLandscape => 'Volledig scherm bij landschaps­modus';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Schakel naar volledig scherm als het apparaat in landschapsmodus is';

  @override
  String get enabled => 'Ingeschakeld';

  @override
  String get submitFeedback => 'Feedback sturen';

  @override
  String get submitFeedbackDescription =>
      'Heb je een fout gevonden of heb je een suggestie? Gebruik deze tool om een screenshot van de app te maken, de feedback uit te leggen en te versturen';

  @override
  String get feedbackDisclaimer =>
      'Om feedback in te dienen heb je een GitHub-account nodig en wordt je screenshot anoniem naar Imgur verzonden.';

  @override
  String get feedbackScreenshotError =>
      'Fout tijdens het uploaden van de screenshot naar Imgur';

  @override
  String get channelSortByNewest => 'Nieuwste';

  @override
  String get channelSortByOldest => 'Oudste';

  @override
  String get channelSortByPopular => 'Populair';

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
