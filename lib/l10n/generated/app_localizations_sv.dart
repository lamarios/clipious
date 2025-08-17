// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get subscriptions => 'prenumerationer';

  @override
  String get playlists => 'Spellistor';

  @override
  String get popular => 'Populära';

  @override
  String get trending => 'Trendiga';

  @override
  String get noVideoInPlayList => 'Inga filmer i spellistan';

  @override
  String get removeFromPlayList => 'Ta bort från spellistan';

  @override
  String get deletePlayListQ => 'Ta bort spellistan?';

  @override
  String get irreversibleAction => 'Denna åtgärd är oåterkallelig';

  @override
  String get addPlayList => 'Lägg till spellista';

  @override
  String get playListName => 'Namn på spellista';

  @override
  String get playlistVisibility => 'Synlighet';

  @override
  String get publicPlaylist => 'Publik';

  @override
  String get privatePlaylist => 'Privat';

  @override
  String get cancel => 'Avbryt';

  @override
  String get add => 'Lägg till';

  @override
  String get unlistedPlaylist => 'Olistad';

  @override
  String get info => 'Info';

  @override
  String get videos => 'Filmer';

  @override
  String get streams => 'Strömmar';

  @override
  String get latestVideos => 'Senaste filmerna';

  @override
  String get subscribed => 'Prenumererar';

  @override
  String get subscribe => 'Prenumerera';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Inga prenumeranter',
        'other': '$count prenumeranter',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Dela';

  @override
  String get shareYoutubeLink => 'Dela YouTube-länk';

  @override
  String get shareInvidiousLink => 'Dela Invidious-länk';

  @override
  String get redirectInvidiousLink => 'Dela Invidious- omdirigeringslänk';

  @override
  String get shareLinkWithTimestamp => 'Lägg till tidsstämpel';

  @override
  String get ok => 'OK';

  @override
  String get noChannels => 'Inga kanaler';

  @override
  String get noPlaylists => 'Inga spellistor';

  @override
  String get channels => 'Kanaler';

  @override
  String get couldntLoadVideo => 'Kunde inte ladda filmen';

  @override
  String get comments => 'Kommentarer';

  @override
  String get recommended => 'Rekommenderade';

  @override
  String get couldntFetchVideos =>
      'Kunde inte få tag på filmen. Tryck för att försöka igen.';

  @override
  String get wizardIntro =>
      'Välj en publik eller lägg till din egen. (Kan ändras senare i inställningar)';

  @override
  String get startUsingClipious => 'Börja använda Clipious';

  @override
  String get videoAddedToPlaylist => 'Filmen har lagts till i din spellista';

  @override
  String get videoAddedToQueue => 'Filmen har lagts till i kön';

  @override
  String get errorAddingVideoToPlaylist =>
      'Fel uppstod när filmen försökte läggas till i spellistan';

  @override
  String get itemlistErrorGeneric => 'Kunde inte hämta data';

  @override
  String get itemListErrorInvalidScope =>
      'Du saknar behörighet att se detta, om du loggade in med hjälp av symbolmetoden så testa i så fall att logga ut och sen in igen';

  @override
  String get selectPlaylist => 'Välj spellista';

  @override
  String get createNewPlaylist => 'Skapa ny spellista';

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
      zero: 'Inga svar',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Ladda mer';

  @override
  String get topSorting => 'Topp';

  @override
  String get newSorting => 'Ny';

  @override
  String get streamIsLive => 'Direktsändning';

  @override
  String get sponsorSkipped => 'Hoppat över annonsering';

  @override
  String get selectBrowsingCountry => 'Välj utforskningsland';

  @override
  String get showOnStart =>
      'Välj vad som skall visas när applikationen startas';

  @override
  String get settings => 'Inställningar';

  @override
  String get browsing => 'Utforskning';

  @override
  String get country => 'Land';

  @override
  String get whenAppStartsShow => 'När applikationen startar, visa…';

  @override
  String get servers => 'Servrar';

  @override
  String get manageServers => 'Hantera servrar';

  @override
  String currentServer(String current) {
    return 'För stunden används $current';
  }

  @override
  String get useSponsorBlock => 'Använd AnnonseringsBlockerare';

  @override
  String get sponsorBlockDescription =>
      'Hoppa över annonseringssegment som rapporterats in av gemenskapen';

  @override
  String get about => 'Om';

  @override
  String get name => 'Namn';

  @override
  String get package => 'Paket';

  @override
  String get version => 'Version';

  @override
  String get build => 'Byggnummer';

  @override
  String get addServer => 'Lägg till server';

  @override
  String get useThisServer => 'Använd denna server';

  @override
  String get logIn => 'Logga in';

  @override
  String get delete => 'Ta bort';

  @override
  String get invalidInvidiousServer => 'Ogiltig Invidious-server';

  @override
  String get yourServers => 'Dina servrar';

  @override
  String get loggedIn => 'Inloggad';

  @override
  String get notLoggedIn => 'Inte inloggad';

  @override
  String get addServerHelpText =>
      'Tryck på \"+\" för att lägga till din egen server, eller tryck på en publik server för att använda den.';

  @override
  String get publicServers => 'Publika servrar';

  @override
  String get loadingPublicServer => 'Laddar listan med publika servrar';

  @override
  String get tapToAddServer =>
      'Tryck för att lägga till servern till din lista';

  @override
  String get publicServersError =>
      'Misslyckades med att hämta listan över publika servrar. Tryck för att försöka igen.';

  @override
  String get appearance => 'Utseende';

  @override
  String get useDynamicTheme => 'Dynamiska färger';

  @override
  String get useDynamicThemeDescription =>
      'Använd \"Material You\"-färger (endast tillgängligt på Android 12 och senare)';

  @override
  String get useDash => 'Använd DASH';

  @override
  String get useDashDescription =>
      'DASH adaptiva strömningar kan ibland vara problematiska, YouTube kan strypa dem.';

  @override
  String get videoPlayer => 'Videospelare';

  @override
  String get videoListed => 'Publik';

  @override
  String get videoUnlisted => 'Olistade';

  @override
  String get videoIsFamilyFriendly => 'Barnvänlig';

  @override
  String get tapToManage => 'Tryck för att hantera';

  @override
  String get authentication => 'Identitetsbekräftelse';

  @override
  String get tokenLogin => 'Logga in med symbol';

  @override
  String get tokenLoginDescription => 'Rekommenderade sättet att logga in';

  @override
  String get cookieLogin => 'Logga in med kakor';

  @override
  String get cookieLoginDescription =>
      'Använd denna metod ifall problem uppstår vid autentisering med hjälp av symbol';

  @override
  String get logout => 'Logga ut';

  @override
  String get username => 'Användarnamn';

  @override
  String get password => 'Lösenord';

  @override
  String get wrongUsernamePassword => 'Fel användarnamn eller lösenord';

  @override
  String get error => 'Fel';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats är inte som förväntat';

  @override
  String get malformedStatsEndpointDescription =>
      'Serverstatistikens slutpunkt motsvarade inte det förväntade avslutet, nyckeln \"software.name\" borde motsvara \"invidious\".\nSvaret från servern var:';

  @override
  String get serverIsNotReachable => 'Servern går ej att nå';

  @override
  String get videoQueue => 'Videokö';

  @override
  String get addToQueueList => 'Lägg till i kön';

  @override
  String get addToPlaylist => 'Till till i spellista';

  @override
  String get playNext => 'Spela nästa';

  @override
  String get playNextAddedToQueue =>
      'Videon är satt näst på tur att spelas upp';

  @override
  String get addRecommendedToQueue =>
      'Spela automatiskt upp rekommendationer vid slut';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Välj vilka typer av sektioner som skall hoppas över';

  @override
  String get sponsorBlockCategorySponsor => 'Annonseringar';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Betald marknadsföring, betalda referenser och direkta annonseringar. Inte för egna marknadsföringar eller när ändamål/kreatörer/hemsidor/produkter lyfts utan egen vinning utan för att de uppskattas.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo =>
      'Obetald/Egen marknadsföring';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Liknande som \"Annonseringar\", men för obetald eller egen marknadsföring. Detta inkluderar sektioner om handelsvaror, donationer eller information om vilka de samarbetat med. ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Interaktionspåminnelser (Prenumerera)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'När det är korta påminnelser om att gilla, prenumerera och/eller följa dem mitt i ett innehåll. Om det pågår under längre tid eller handlar om något specifik bör det istället definieras som egen reklam.';

  @override
  String get sponsorBlockCategoryIntro => 'Avbrotts-/Introanimation';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Ett intervall utan betydande innehåll. Kan vara en paus, en statisk bild eller upprepande animation. Bör inte användas för övergångar som innehåller information.';

  @override
  String get sponsorBlockCategoryOutro => 'Slutbild/Eftertexter';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Eftertexter eller när YouTube\'s slutbild visas. Ej för sammanfattning med information.';

  @override
  String get sponsorBlockCategoryPreview => 'Förhandsvisning/Tillbakablick';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Samling av klipp som visar vad som kommer att visas i denna eller andra filmer som ingår i en serie där all information upprepas senare vi filmen.';

  @override
  String get sponsorBlockCategoryFiller => 'Utfyllnadsmaterial/Skämt';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Material som lagts till enbart för att fylla ut tiden eller humoristiskt material och som inte krävs för att förstå det huvudsakliga innehållet i en film. Detta bör ej omfatta sekvenser som tillhandahåller information eller bakgrundsdetaljer. Detta är en väldigt aggressiv kategori tänkt att användas när du ej är på humör för \"komiskt innehåll\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'Musik: Tyst Sekvens';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Används enbart för musikfilmer. Bör enbart användas för sekvenser av musikfilmer som inte redan omfattas av andra kategorier.';

  @override
  String get useProxy => 'Filmer via ombud';

  @override
  String get useProxyDescription =>
      'Genom att se filmer från servern via ombud kan du gå förbi regionala blockeringar eller internetleverantörer som blockerar YouTube';

  @override
  String get pressDownToShowSettings =>
      'Visa inställningar genom att trycka neråt';

  @override
  String get quality => 'Kvalitet';

  @override
  String get audio => 'Ljud';

  @override
  String get subtitles => 'Undertexter';

  @override
  String get playbackSpeed => 'Uppspelningshastighet';

  @override
  String get blackBackground => 'Svart bakgrund';

  @override
  String get blackBackgroundDescription => 'För mörkt tema på OLED-skärmar';

  @override
  String get search => 'Sök';

  @override
  String get subtitleFontSize => 'Teckenstorlek på undertexter';

  @override
  String get subtitleFontSizeDescription =>
      'Ändra teckenstorleken på undertexterna ifall dem är för stor eller små på din enhet';

  @override
  String get skipSslVerification => 'Hoppa över att verifiera SSL-certifikat';

  @override
  String get skipSslVerificationDescription =>
      'När en självsignerad SSL-cerifikat skall användas, eller när man upplever SSL-relaterade problem på servern.';

  @override
  String get themeBrightness => 'Tema';

  @override
  String get themeLight => 'Ljus';

  @override
  String get themeDark => 'Mörk';

  @override
  String get followSystem => 'Följ systemet';

  @override
  String get requiresRestart => 'Kräver omstart av app';

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
      other: '$countString filmer',
      one: '1 film',
      zero: 'Inga filmer',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Url-länkar måste börja med http:// eller https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Visa uppskattad antal ogillande av filmer genom att använda gränssnittet som tillhandahålls av returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'Länkadress till anpassad RYD-instans';

  @override
  String get rydCustomInstanceDescription =>
      'Använd en annan RYD-instans, lämna blankt för att använda standardvärde';

  @override
  String get autoplayVideoOnLoad => 'Spela automatiskt upp filmer vid laddning';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Spela automatiskt upp filmer efter att de har laddats';

  @override
  String get searchHistory => 'Sökhistorik';

  @override
  String get searchHistoryDescription => 'Inställningar för sökhistorik';

  @override
  String get enableSearchHistory => 'Aktivera sökhistorik';

  @override
  String get searchHistoryLimit => 'Gräns för sökhistorik';

  @override
  String get searchHistoryLimitDescription =>
      'Anger hur många tidigare sökningar som kommer visas som förslag';

  @override
  String get shorts => 'Förkortningar';

  @override
  String get searchUploadDate => 'Datum för uppladdning';

  @override
  String get searchUploadDateAny => 'Alla datum';

  @override
  String get searchUploadDateHour => 'Senaste timmen';

  @override
  String get searchUploadDateToday => 'Idag';

  @override
  String get searchUploadDateWeek => 'Denna vecka';

  @override
  String get searchUploadDateMonth => 'Denna månad';

  @override
  String get searchUploadDateYear => 'Detta året';

  @override
  String get searchDuration => 'Längd';

  @override
  String get searchDurationAny => 'Alla längder';

  @override
  String get searchDurationShort => 'Korta (<4 minuter)';

  @override
  String get searchDurationLong => 'Långa (>20 minuter)';

  @override
  String get searchDurationMedium => 'Medel (4-20 minuter)';

  @override
  String get searchSortBy => 'Sortera efter';

  @override
  String get searchSortRelevance => 'Relevans';

  @override
  String get searchSortRating => 'Omdömen';

  @override
  String get searchSortUploadDate => 'Datum för Uppladdning';

  @override
  String get searchSortViewCount => 'Antal visningar';

  @override
  String get clearSearchHistory => 'Rensa sökhistorik';

  @override
  String get appLogs => 'Applikationsjournal';

  @override
  String get appLogsDescription =>
      'Erhåll journal över vad som händer i applikationen, kan vara användbart när problem skall rapporteras';

  @override
  String get copyToClipBoard => 'Kopiera till urklippshanteraren';

  @override
  String get logsCopied => 'Journal kopierad till urklippshanteraren';

  @override
  String get rememberSubtitleLanguage => 'Kom ihåg språk för undertexter';

  @override
  String get videoFilters => 'Filmfilter';

  @override
  String nFilters(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString filter',
      one: '1 filter',
      zero: 'Inga filmer',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'Dölj eller fördunkla filmer från alla filmströmmar i applikationen baserat på de filter som anges nedan. Detta tillåter dig att exempelvis dölja all sportreklam eller sport från en specifik kanal.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Ange regler för att filtrera bort filmer';

  @override
  String get videoFilterAllChannels => 'Alla kanaler';

  @override
  String get addVideoFilter => 'Skapa filter';

  @override
  String get editVideoFilter => 'Redigera filter';

  @override
  String get videoFilterType => 'Typ';

  @override
  String get videoFilterOperation => 'Åtgärd';

  @override
  String get videoFilterValue => 'Värde';

  @override
  String get save => 'Spara';

  @override
  String get videoFilterEditDescription =>
      'Välj valfritt en kanal, typ av filter, åtgärd och ett värde för att filtrera BORT filmer från listan. Exempel \"typ: filmnamn, åtgärd: innehåller, värde: test\" kommer filtrera BORT alla filmer som har ordet \"test\" i sitt namn.';

  @override
  String get optional => 'Valfritt';

  @override
  String get videoFilterHideLabel => 'Dölj';

  @override
  String get videoFilterFilterLabel => 'Fördunkla';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter filmer vars $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered =>
      'Filmer filtrerad på grund av följande anledning(-ar):';

  @override
  String get videoFilterTapToReveal => 'Tryck för att visa';

  @override
  String get videoFilterHide => 'Dölj filtrerade filmer';

  @override
  String get videoFilterHideDescription =>
      'Som standard så döljs ej filtrerade filmer utan visas fördunklade med orsaken till varför de filtrerats. Denna inställning tar bort filtrerade filmer från listan.';

  @override
  String get videoFilterNoFilters =>
      'Inga filmfilter, tryck på knappen med ett + nedan för att börja lägga till filter.';

  @override
  String get videoFilterTypeVideoTitle => 'Filmnamn';

  @override
  String get videoFilterTypeChannelName => 'Kanalnamn';

  @override
  String get videoFilterTypeVideoLength => 'Filmlängd (sekunder)';

  @override
  String get videoFilterOperationContains => 'Innehåller';

  @override
  String get videoFilterOperationNotContain => 'Innehåller inte';

  @override
  String get videoFilterOperationLowerThan => 'Kortare än';

  @override
  String get videoFilterOperationHigherThan => 'Längre än';

  @override
  String get channel => 'Kanal';

  @override
  String get videoFilterHideAllFromChannel =>
      'Filtrera alla filmer från en kanal';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter alla filmer från en kanal';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Sätt automatiskt undertexter till senast angivna språk, om tillgängligt';

  @override
  String get lockFullScreenToLandscape =>
      'Lås orientering av helskärmsuppvisning till filmens bildförhållande';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Låser orienteringen av helskärmsuppvisningen baserat på videoformatet, liggande för breda filmer samt stående för höga filmer';

  @override
  String get fillFullscreen => 'Maximera filmen för att matcha skärmen';

  @override
  String get fillFullscreenDescription =>
      'Justera filmen för att fylla hela skärmen i liggande läge';

  @override
  String get rememberPlaybackSpeed => 'Kom ihåg uppspelningshastighet';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Ange automatiskt uppspelningshastigheten till den senast angivna hastigheten';

  @override
  String get downloads => 'Nedladdningar';

  @override
  String get download => 'Ladda ner';

  @override
  String get videoAlreadyDownloaded => 'Filmen har redan laddats ner';

  @override
  String get noDownloadedVideos =>
      'Inga nedladdade filmer, sök upp och tryck länge på en film i en lista alternativt klicka på knappen för nedladdning i filmvisaren för att ladda ner';

  @override
  String get downloadsPlayAll => 'Spela upp alla';

  @override
  String get videoDownloadStarted => 'Nedladdning av filmen påbörjad';

  @override
  String get videoFailedDownloadRetry =>
      'Nedladdningen misslyckades, klicka här för att försöka igen';

  @override
  String get videoDownloadAudioOnly => 'Ljud enbart';

  @override
  String get manageSubscriptions => 'Hantera Prenumerationer';

  @override
  String get noSubscriptions =>
      'Inga prenumerationer, sök upp filmer och prenumerera på valfri kanal som faller dig i smaken.';

  @override
  String get youCanSubscribeAgainLater =>
      'Du kan åter välja att prenumerera på denna kanal igen vid ett senare tillfälle';

  @override
  String get unSubscribeQuestion => 'Avprenumerera?';

  @override
  String get clearHistoryQuestion => 'Rensa historiken?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Detta kommer att rensa historiken över filmer som visats på det konto och server som du använder. Detta går ej att ångra.';

  @override
  String get noHistory =>
      'Ingen historik över visade filmer, om du tittar på någon film så kommer de att listas här';

  @override
  String get homeLayoutEditor => 'Redigera hemskärmens utseende';

  @override
  String get layoutEditorAddVideoSource => 'Lägg till filmkälla';

  @override
  String get layoutEditorExplanation =>
      'Du kan välja vad som skall visas på din hemskärm, du kan ha upp till 2 små visare med horisontell bläddring och en stor källa.';

  @override
  String get home => 'Hem';

  @override
  String get library => 'Bibliotek';

  @override
  String get customizeAppLayout => 'Anpassa appsektioner';

  @override
  String get customizeAppLayoutExplanation =>
      'Ange vilka sektioner du vill skall visas i applikationens navigeringsmeny. Klicka på husikonen för att välja vilken skärm som skall visas när applikationen startar. Du kan arrangera om ordningen av sektioner genom att dra dem till önskade positioner.';

  @override
  String get navigationBarStyle => 'Stil på navigeringsmenyn';

  @override
  String get navigationBarLabelAlwaysShowing => 'Etikett syns alltid';

  @override
  String get navigationBarLabelShowOnSelect => 'Etikett syns på vald objekt';

  @override
  String get navigationBarLabelNeverShow => 'Etikett syns aldrig';

  @override
  String get distractionFreeMode => 'Distraktionsfritt läge';

  @override
  String get distractionFreeModeDescription =>
      'Inaktivera filmkommentarer och rekommendationer';

  @override
  String get secondsShortForm => 'sek.';

  @override
  String get videoFilterApplyDateToFilter =>
      'Filtrera filmer under specifika tider';

  @override
  String get videoFilterDayOfWeek =>
      'Ange dagar som filtren skall appliceras på';

  @override
  String get videoFilterDayOfWeekDescription =>
      'Du kan selektivt välja vilka dagar och tider på veckan som du vill att filtren skall gälla för, för att som exempel motverka att avslöja resultat av sportevent i förtid.';

  @override
  String get videoFilterStartTime => 'Starttid';

  @override
  String get videoFilterEndTime => 'Sluttid';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Appliceras på $selectedDays';
  }

  @override
  String get from => 'Från';

  @override
  String get to => 'Till';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'Från $from till $to';
  }

  @override
  String get notifications => 'Notifikationer';

  @override
  String get notificationsDescription =>
      'Visa och bevilja vad du vill bli informerad om';

  @override
  String get enableNotificationDescriptions =>
      'Kör tjänst för att kontrollera och visa dig vilka ändringar som du önskar bli meddelad om';

  @override
  String get subscriptionNotification => 'Prenumerationsmeddelanden';

  @override
  String get subscriptionNotificationDescription =>
      'Erhåll meddelande om nya filmer från de flöden som du prenumererar ifall du är inloggad på din nuvarande server';

  @override
  String get subscriptionNotificationTitle =>
      'Nya filmer från dina prenumerationer';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString nya filmer',
      one: '1 ny film',
      zero: 'inga nya filmer',
    );
    return 'Det finns $_temp0 i flödet av prenumererat material';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Inaktivering av batterioptimering krävs';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'För att kunna skicka meddelande så behöver Clipious kunna köra tjänster i bakgrunden. För att dessa skall kunna köras smidigt så krävs det att Clipious ges obegränsad batterianvändning, klicka på ok för att öppna upp inställningar för batterioptimering.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Meddelanden är inaktiverade';

  @override
  String get askToEnableBackgroundServiceContent =>
      'För att erhålla meddelanden behöver Clipious bli beviljad att skicka meddelanden, tryck på OK för att aktivera det.';

  @override
  String get otherNotifications =>
      'Andra källor för meddelanden (ikon med bjällror)';

  @override
  String get deleteChannelNotificationTitle =>
      'Ta bort meddelandefunktion för kanalen?';

  @override
  String get deleteChannelNotificationContent =>
      'Du kommer ej motta några meddelanden om förändringar i denna kanalen framöver.';

  @override
  String get deletePlaylistNotificationTitle =>
      'Ta bort meddelandefunktion för spellista?';

  @override
  String get deletePlaylistNotificationContent =>
      'Du kommer ej motta några meddelande om förändringar i denna spellista framöver.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Nya filmer från $channel';
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
      other: '$countString nya filmer',
      one: '1 ny film',
      zero: 'inga nya filmer',
    );
    return 'Det finns $_temp0 från $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'Nya filmer i spellistan $playlist';
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
      other: '$countString nya filmer',
      one: '1 ny film',
      zero: 'inga nya filmer',
    );
    return 'Det finns $_temp0 i spellistan $playlist';
  }

  @override
  String get foregroundServiceNotificationTitle => 'Övervakning av filmer';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'varje timme',
        '24': 'varje dag',
        '2': 'varannan timme',
        'other': 'var $hours:e timme',
      },
    );
    return 'Leta efter nya filmer $_temp0';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'Kontrollerar prenumerationer...';

  @override
  String get foregroundServiceUpdatingPlaylist => 'Kontrollerar spellistor...';

  @override
  String get foregroundServiceUpdatingChannels => 'Kontrollerar kanaler...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Kontrollfrekvens för nya filmer';

  @override
  String get notificationFrequencySettingsDescription =>
      'Hur ofta som applikationen skall leta efter nya filmer';

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
  String get subtitlesBackground => 'Bakgrund för undertexter';

  @override
  String get subtitlesBackgroundDescription =>
      'Lägger till en svart backgrund till undertexterna för att göra dem mer lättlästa';

  @override
  String get history => 'Historik';

  @override
  String get deArrowSettingDescription =>
      'Byt ut namn och miniatyrbilder som angivits enbart för att vara lockande att klicka på';

  @override
  String get deArrowReplaceThumbnails => 'Byt ut miniatyrbilder';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Byt ut miniatyrbilden utöver namnet';

  @override
  String get deArrowWarning =>
      'Att aktivera DeArrow kan markant minska bläddringshastigheten i applikationen då extra internetförfrågningar krävs för varje enskild film';

  @override
  String get copySettingsAsJson =>
      'Kopiera inställningar i formatet JSON till urklippshanteraren';

  @override
  String get copySettingsAsJsonDescription =>
      'Kopiera inställningarna i formatet JSON för att underlätta felsökning ifall du stöter på ett problem i applikationen och önskar rapportera problemet';

  @override
  String get seeking => 'Bläddra';

  @override
  String get skipStep => 'Steg att hoppa framåt/bakåt';

  @override
  String get skipStepDescription =>
      'Hur många sekunder att hoppa framåt/bakåt vid åtgärd';

  @override
  String get exponentialSkip => 'Öka stegen exponentiellt framåt/bakåt';

  @override
  String get exponentialSkipDescription =>
      'Ju mer du hoppar framåt/bakåt, desto större hopp genomförs.';

  @override
  String get fullscreenOnLandscape => 'Helskärm i liggande läge';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Växla till helskärm när enheten roteras till liggande läge';

  @override
  String get enabled => 'Aktiverad';

  @override
  String get submitFeedback => 'Skicka återkoppling';

  @override
  String get submitFeedbackDescription =>
      'Har du hittat ett fel eller har ett förslag? Använd detta verktyg för att ta en skärmbild på applikationen, kommentera och skicka återkoppling';

  @override
  String get feedbackDisclaimer =>
      'För att kunna skicka återkoppling så krävs ett konto på GitHub samt att din skärmbild kommer att publiceras anonymt på Imgur.';

  @override
  String get feedbackScreenshotError =>
      'Fel uppstod vid uppladdning av skärmbild till Imgur';

  @override
  String get channelSortByNewest => 'Nyast';

  @override
  String get channelSortByOldest => 'Äldst';

  @override
  String get channelSortByPopular => 'Populärast';

  @override
  String get invidiousAccount => 'Konto på Invidious-server';

  @override
  String get onDeviceSubscriptions => 'På enheten';

  @override
  String get both => 'Båda';

  @override
  String get refresh => 'Ladda om';

  @override
  String get addBasicAuth => 'Lägg till Grundläggande Autentisering';

  @override
  String get addBasicAuthExplanation =>
      'Om din server kräver grundläggande HTTP autentisering så lägger du till detaljerna nedan. Dessa är inte detaljerna för ditt incidious-konto';

  @override
  String get addHeader => 'Lägg till rubrik';

  @override
  String get advancedConfiguration => 'Avancerade Inställningar';

  @override
  String get customHeaders => 'Anpassade rubriker';

  @override
  String get customHeadersExplanation =>
      'Ange att anpassade rubriker skall skickas till invidious-servern';

  @override
  String get value => 'Värde';

  @override
  String get testAndAddServer => 'Testa och lägg till server';

  @override
  String get alsoTestServerConfig =>
      'Testa också konfigurationen hos servern, så att miniatyrbilder visas korrekt';

  @override
  String get serverAlreadyExists => 'Servern finns redan i inställningarna';

  @override
  String get wrongThumbnailConfiguration =>
      'Servern går att nå men är ej konfigurerad på ett korrekt sätt, miniatyrbilder för filmer och kanaler kommer ej kunna visas korrekt. Inaktivera test av serverns konfiguration om detta ändå känns ok för dig, åtgärda annars servern';

  @override
  String get openWikiLink => 'Öppna wikipedia för att söka efter hjälp';

  @override
  String get serverUnreachable =>
      'Servern går ej att nå, alternativt ej en korrekt invidious-server';

  @override
  String get copyToDownloadFolder => 'Kopiera till katalogen nedladdningar';

  @override
  String get fileCopiedToDownloadFolder =>
      'Fil kopierad till katalogen nedladdningar';

  @override
  String get videoDeleted => 'Film borttagen';

  @override
  String get sleepTimer => 'Sömntimer';

  @override
  String get stopTheVideo => 'Stanna videon';

  @override
  String get stopTheVideoExplanation =>
      'Om aktiverad, stängs videon, annars pausar bara videon.';

  @override
  String get setTimer => 'Sätt timer';

  @override
  String get cancelSleepTimer => 'Avbryt sömntimer';

  @override
  String premieresIn(Object formattedDuration) {
    return 'Premiär om $formattedDuration';
  }

  @override
  String get screenControls => 'Skärmkontroller';

  @override
  String get screenControlsExplanation =>
      'När du tittar på en video i helskärm, dra vertikalt från vänster eller höger för att justera ljusstyrkan respektive volymen';

  @override
  String get retry => 'Försök igen';

  @override
  String get forceTvUi => 'Tvinga TV-gränssnitt';

  @override
  String get forceTvUiExplanation =>
      'Tvinga gränssnittet att vara TV-upplevelsen, kan vara användbart för vissa enheter som inte har leanback-systemkonfiguration. Omstart av appen krävs';

  @override
  String get noPublicServers => 'Inga publika servrar är tillgängliga';

  @override
  String get tapToSeeHow =>
      'Tryck för att se hur du kan vara värd för din egen';

  @override
  String get referToInvidiousWebsiteForHostingInstructions =>
      'Se Invidious webbsida för instruktioner om hur man är värd för invidious';
}
