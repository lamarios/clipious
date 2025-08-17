// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get subscriptions => 'Tilaukset';

  @override
  String get playlists => 'Soittolistat';

  @override
  String get popular => 'Suosittu';

  @override
  String get trending => 'Nousussa';

  @override
  String get noVideoInPlayList => 'Soittolistalla ei ole videota';

  @override
  String get removeFromPlayList => 'Poista soittolistasta';

  @override
  String get deletePlayListQ => 'Poistetaanko soittolista?';

  @override
  String get irreversibleAction => 'Tämä toiminta on peruuttamatonta';

  @override
  String get addPlayList => 'Lisää soittolista';

  @override
  String get playListName => 'Soittolistan nimi';

  @override
  String get playlistVisibility => 'Näkyvyys';

  @override
  String get publicPlaylist => 'Julkinen';

  @override
  String get privatePlaylist => 'Yksityinen';

  @override
  String get cancel => 'Peruuta';

  @override
  String get add => 'Lisää';

  @override
  String get unlistedPlaylist => 'Luetteloimaton';

  @override
  String get info => 'Tiedot';

  @override
  String get videos => 'Videot';

  @override
  String get streams => 'Striimaukset';

  @override
  String get latestVideos => 'Uusimmat videot';

  @override
  String get subscribed => 'Tilattu';

  @override
  String get subscribe => 'Tilaa';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Ei tilaajia',
        'other': '$count tilajaa',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Jaa';

  @override
  String get shareYoutubeLink => 'Jaa YouTube-linkki';

  @override
  String get shareInvidiousLink => 'Jaa Invidious-linkki';

  @override
  String get redirectInvidiousLink => 'Jaa Invidious-uudelleenohjauksen linkki';

  @override
  String get shareLinkWithTimestamp => 'Lisää aikaleima';

  @override
  String get ok => 'OK';

  @override
  String get noChannels => 'Ei kanavia';

  @override
  String get noPlaylists => 'Ei soittolistoja';

  @override
  String get channels => 'Kanavat';

  @override
  String get couldntLoadVideo => 'Videota ei voitu ladata';

  @override
  String get comments => 'Kommentit';

  @override
  String get recommended => 'Suositeltu';

  @override
  String get couldntFetchVideos =>
      'Videoita ei voitu hakea. Yritä uudelleen napauttamalla.';

  @override
  String get wizardIntro =>
      'Valitse julkinen palvelin tai lisää oma. (Voidaan muuttaa myöhemmin asetuksissa)';

  @override
  String get startUsingClipious => 'Aloita Clipiousin käyttö';

  @override
  String get videoAddedToPlaylist => 'Video lisätty soittolistaan';

  @override
  String get videoAddedToQueue => 'Video lisätty jonoon';

  @override
  String get errorAddingVideoToPlaylist =>
      'Virhe videon lisäämisessä soittolistaan';

  @override
  String get itemlistErrorGeneric => 'Tietojen haku epäonnistui';

  @override
  String get itemListErrorInvalidScope =>
      'Sinulla ei ole käyttöoikeutta tähän. Jos kirjauduit käyttäen tokenia, yritä kirjautua ulos ja uudelleen sisään.';

  @override
  String get selectPlaylist => 'Valitse soittolista';

  @override
  String get createNewPlaylist => 'Luo uusi soittolista';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString vastausta',
      one: '1 vastaus',
      zero: 'Ei vastauksia',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Lataa lisää';

  @override
  String get topSorting => 'Top';

  @override
  String get newSorting => 'Uusi';

  @override
  String get streamIsLive => 'Livenä';

  @override
  String get sponsorSkipped => 'Sponsori jätti väliin';

  @override
  String get selectBrowsingCountry => 'Valitse selainmaa';

  @override
  String get showOnStart => 'Valitse, mitä näytetään sovelluksen käynnistyessä';

  @override
  String get settings => 'Asetukset';

  @override
  String get browsing => 'Selaus';

  @override
  String get country => 'Maa';

  @override
  String get whenAppStartsShow => 'Kun sovellus käynnistyy, näytä…';

  @override
  String get servers => 'Palvelimet';

  @override
  String get manageServers => 'Hallitse palvelimia';

  @override
  String currentServer(String current) {
    return 'Tällä hetkellä käytössä $current';
  }

  @override
  String get useSponsorBlock => 'Käytä SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'Ohita yhteisön lähettämät sponsoripätkät';

  @override
  String get about => 'Tietoja';

  @override
  String get name => 'Nimi';

  @override
  String get package => 'Paketti';

  @override
  String get version => 'Versio';

  @override
  String get build => 'Build';

  @override
  String get addServer => 'Lisää palvelin';

  @override
  String get useThisServer => 'Käytä tätä palvelinta';

  @override
  String get logIn => 'Kirjaudu sisään';

  @override
  String get delete => 'Poista';

  @override
  String get invalidInvidiousServer => 'Virheellinen Invidious-palvelin';

  @override
  String get yourServers => 'Omat palvelimet';

  @override
  String get loggedIn => 'Kirjautunut sisään';

  @override
  String get notLoggedIn => 'Ei kirjautuneena sisään';

  @override
  String get addServerHelpText =>
      'Lisää omia palvelimia +-painikkeella tai napauta julkista palvelinta ja lisää se.';

  @override
  String get publicServers => 'Julkiset palvelimet';

  @override
  String get loadingPublicServer => 'Ladataan julkisia palvelimia';

  @override
  String get tapToAddServer => 'Lisää palvelin luetteloon napauttamalla';

  @override
  String get publicServersError =>
      'Julkisten palvelimien luetteloa ei voitu hakea. Yritä uudelleen napauttamalla.';

  @override
  String get appearance => 'Ulkonäkö';

  @override
  String get useDynamicTheme => 'Dynaamiset värit';

  @override
  String get useDynamicThemeDescription =>
      'Käytä Material You-värejä (käytettävissä vain Android 12+)';

  @override
  String get useDash => 'Käytä DASH';

  @override
  String get useDashDescription =>
      'DASH-adaptiivinen suoratoisto voi joskus olla ongelmallista, YouTube voi rajoittaa sitä.';

  @override
  String get videoPlayer => 'Videosoitin';

  @override
  String get videoListed => 'Julkinen';

  @override
  String get videoUnlisted => 'Listaamaton';

  @override
  String get videoIsFamilyFriendly => 'Lapsiystävällinen';

  @override
  String get tapToManage => 'Muokkaa napauttamalla';

  @override
  String get authentication => 'Tunnistautuminen';

  @override
  String get tokenLogin => 'Kirjaudu tokenilla';

  @override
  String get tokenLoginDescription => 'Suositeltu kirjautumistapa';

  @override
  String get cookieLogin => 'Kirjaudu evästeellä';

  @override
  String get cookieLoginDescription =>
      'Käytä tätä tapaa, jos tunnistautuminen tokenilla ei onnistu';

  @override
  String get logout => 'Kirjaudu ulos';

  @override
  String get username => 'Käyttäjänimi';

  @override
  String get password => 'Salasana';

  @override
  String get wrongUsernamePassword => 'Virheellinen käyttäjänimi tai salasana';

  @override
  String get error => 'Vihre';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats is not as expected';

  @override
  String get malformedStatsEndpointDescription =>
      'The server stats endpoint did not respond an expected payload, the key \"software.name\" should be equal to \"invidious\".\nResponse from the server:';

  @override
  String get serverIsNotReachable => 'Palvelin ei ole tavoitettavissa';

  @override
  String get videoQueue => 'Jono';

  @override
  String get addToQueueList => 'Lisää jonoon';

  @override
  String get addToPlaylist => 'Lisää soittolistaan';

  @override
  String get playNext => 'Toista seuraavaksi';

  @override
  String get playNextAddedToQueue => 'Video toistetaan seuraavaksi';

  @override
  String get addRecommendedToQueue =>
      'Jatka automaattisesti suositeltuun videoon';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Valitse, minkä tyyppiset segmentit ohitetaan';

  @override
  String get sponsorBlockCategorySponsor => 'Sponsori';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Paid promotion, paid referrals and direct advertisements. Not for self-promotion or free shoutouts to causes/creators/websites/products they like.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo =>
      'Oma promootio / ei maksettu';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Similar to \"sponsor\" except for unpaid or self promotion. This includes sections about merchandise, donations, or information about who they collaborated ';

  @override
  String get sponsorBlockCategoryInteraction => 'Interaktiomuistutus (Tilaus)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'When there is a short reminder to like, subscribe or follow them in the middle of content. If it is long or about something specific, it should be under self promotion instead.';

  @override
  String get sponsorBlockCategoryIntro => 'Intro/välianimaatio';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Ajanjakso vailla varsinaista sisältöä. Voi olla tauko, staattinen kuva tai toistuva animaatio. Tätä ei tulisi käyttää siirtymiin, jotka sisältävät tietoa.';

  @override
  String get sponsorBlockCategoryOutro => 'Lopputekstit/Kiitettävää';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Credits or when the YouTube endcards appear. Not for conclusions with information.';

  @override
  String get sponsorBlockCategoryPreview => 'Preview/Recap';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Collection of clips that show what is coming up in in this video or other videos in a series where all information is repeated later in the video.';

  @override
  String get sponsorBlockCategoryFiller => 'Filler Tangent/Jokes';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Tangential scenes added only for filler or humor that are not required to understand the main content of the video. This should not include segments providing context or background details. This is a very aggressive category meant for when you aren\'t in the mood for \"fun\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'Music: Non-Music Section';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Only for use in music videos. This only should be used for sections of music videos that aren\'t already covered by another category.';

  @override
  String get useProxy => 'Käytä välityspalvelinta';

  @override
  String get useProxyDescription =>
      'Välityspalvelinta käyttämällä voit ohittaa ISP:n asettamat sekä aluekohtaiset YouTube-rajoitukset';

  @override
  String get pressDownToShowSettings => 'Paina alas näyttääksesi asetukset';

  @override
  String get quality => 'Laatu';

  @override
  String get audio => 'Ääni';

  @override
  String get subtitles => 'Tekstitykset';

  @override
  String get playbackSpeed => 'Toistonopeus';

  @override
  String get blackBackground => 'Musta tausta';

  @override
  String get blackBackgroundDescription => 'OLED-näytön tumma teema';

  @override
  String get search => 'Etsi';

  @override
  String get subtitleFontSize => 'Tekstityksen koko';

  @override
  String get subtitleFontSizeDescription =>
      'Aseta sopiva tekstityksen koko näytöllesi';

  @override
  String get skipSslVerification => 'Ohita SSL-varmenteen varmistus';

  @override
  String get skipSslVerificationDescription =>
      'Kun käytössä on itse allekirjoitettu SSL-varmenne tai palvelimella on SSL-varmenteeseen liittyviä ongelmia.';

  @override
  String get themeBrightness => 'Teema';

  @override
  String get themeLight => 'Vaalea';

  @override
  String get themeDark => 'Tumma';

  @override
  String get followSystem => 'Järjestelmä';

  @override
  String get requiresRestart => 'Vaatii sovelluksen uudelleen käynnistämisen';

  @override
  String get appLanguage => 'Sovelluksen kieli';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString videota',
      one: '1 video',
      zero: 'Ei videoita',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Url must start with http:// or https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Show estimated video dislikes using API provided by returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'Custom RYD instance url';

  @override
  String get rydCustomInstanceDescription =>
      'Use a different RYD instance, leave empty to use the default';

  @override
  String get autoplayVideoOnLoad => 'Automaattitoisto';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Aloita videon toistaminen automaattisesti sen latauduttua';

  @override
  String get searchHistory => 'Hakuhistoria';

  @override
  String get searchHistoryDescription => 'Hakuhistorian asetukset';

  @override
  String get enableSearchHistory => 'Ota hakuhistoria käyttöön';

  @override
  String get searchHistoryLimit => 'Hakuhistorian pituus';

  @override
  String get searchHistoryLimitDescription =>
      'Kuinka monta aikaisempaa hakua näytetään hakuehdotuksissa';

  @override
  String get shorts => 'Shorts';

  @override
  String get searchUploadDate => 'Upload date';

  @override
  String get searchUploadDateAny => 'Any date';

  @override
  String get searchUploadDateHour => 'Last Hour';

  @override
  String get searchUploadDateToday => 'Today';

  @override
  String get searchUploadDateWeek => 'This week';

  @override
  String get searchUploadDateMonth => 'This month';

  @override
  String get searchUploadDateYear => 'This year';

  @override
  String get searchDuration => 'Duration';

  @override
  String get searchDurationAny => 'Any duration';

  @override
  String get searchDurationShort => 'Short (<4 minutes)';

  @override
  String get searchDurationLong => 'Long (>20 minutes)';

  @override
  String get searchDurationMedium => 'Medium (4-20 minutes)';

  @override
  String get searchSortBy => 'Sort by';

  @override
  String get searchSortRelevance => 'Relevanssi';

  @override
  String get searchSortRating => 'Arviointi';

  @override
  String get searchSortUploadDate => 'Latauspäivämäärä';

  @override
  String get searchSortViewCount => 'Katselumäärä';

  @override
  String get clearSearchHistory => 'Tyhjennä hakuhistoria';

  @override
  String get appLogs => 'Sovelluksen lokit';

  @override
  String get appLogsDescription =>
      'Näyttää sovelluksen käyttölokit. Hyödyllinen ongelmien raportoinnissa.';

  @override
  String get copyToClipBoard => 'Kopioi leikepöydälle';

  @override
  String get logsCopied => 'Lokit kopioitu leikepöydälle';

  @override
  String get rememberSubtitleLanguage => 'Muista tekstitysten kieli';

  @override
  String get videoFilters => 'Videosuodattimet';

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
      'Määrittele suodatusasetukset';

  @override
  String get videoFilterAllChannels => 'Kaikki kanavat';

  @override
  String get addVideoFilter => 'Luo suodatin';

  @override
  String get editVideoFilter => 'Muokkaa suodatinta';

  @override
  String get videoFilterType => 'Tyyppi';

  @override
  String get videoFilterOperation => 'Toiminta';

  @override
  String get videoFilterValue => 'Arvo';

  @override
  String get save => 'Tallenna';

  @override
  String get videoFilterEditDescription =>
      'Select an optional channel, a filter type, operation and a value to filter OUT videos from lists. Example, type: video name, operation: contains, value: test will EXCLUDE all the videos with the word test in their name.';

  @override
  String get optional => 'valinnainen';

  @override
  String get videoFilterHideLabel => 'Piilota';

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
  String get videoFilterTapToReveal => 'Napauta näyttääksesi';

  @override
  String get videoFilterHide => 'Hide filtered videos';

  @override
  String get videoFilterHideDescription =>
      'By default filtered videos are not hidden but shown as obfuscated with the reason(s) why it has been filtered. This setting remove the filtered videos from lists.';

  @override
  String get videoFilterNoFilters =>
      'No video filters, tap the + button below to start adding filters.';

  @override
  String get videoFilterTypeVideoTitle => 'Videon otsikko';

  @override
  String get videoFilterTypeChannelName => 'Kanavan nimi';

  @override
  String get videoFilterTypeVideoLength => 'Videon pituus (sekunteina)';

  @override
  String get videoFilterOperationContains => 'Sisältää';

  @override
  String get videoFilterOperationNotContain => 'Ei sisällä';

  @override
  String get videoFilterOperationLowerThan => 'Matalampi kuin';

  @override
  String get videoFilterOperationHigherThan => 'Korkeampi kuin';

  @override
  String get channel => 'Kanava';

  @override
  String get videoFilterHideAllFromChannel => 'Suodata kaikki videot kanavalta';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter kaikki videot kanavalta';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Aseta teksitykset viimeksi asetetulle kielelle, jos tekstit ovat saatavilla';

  @override
  String get lockFullScreenToLandscape =>
      'Lukitse koko näytön suunta videon kuvasuhteen mukaisesti';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Lukitse koko näytön suunta videoformaattiin perustuen, vaakataaso leveälle videolle ja pystykuva pystyvideoille';

  @override
  String get fillFullscreen => 'Suurenna video ruudulle';

  @override
  String get fillFullscreenDescription =>
      'Aseta video täyttämään koko ruutu vaakatilassa';

  @override
  String get rememberPlaybackSpeed => 'Muista toistonopeus';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Aseta toistonopeus automaattisesti viimeksi valittuun nopeuteen';

  @override
  String get downloads => 'Lataukset';

  @override
  String get download => 'Lataa';

  @override
  String get videoAlreadyDownloaded => 'Video on jo ladattu';

  @override
  String get noDownloadedVideos =>
      'Ei ladattuja videoita. Lataa video painamalla pitkään videota hakutuloksissa tai paina latauspainiketta videonäkymässä';

  @override
  String get downloadsPlayAll => 'Toista kaikki';

  @override
  String get videoDownloadStarted => 'Videon lataus aloitettu';

  @override
  String get videoFailedDownloadRetry =>
      'Lataus epäonnistui, napauta yrittääksesi uudelleen';

  @override
  String get videoDownloadAudioOnly => 'Vain ääni';

  @override
  String get manageSubscriptions => 'Hallinnoi tilauksia';

  @override
  String get noSubscriptions =>
      'Ei tilauksia, selaa videoita ja tilaa kanavia, joista pidät.';

  @override
  String get youCanSubscribeAgainLater =>
      'Voit tilata kanavan uudelleen myöhemmin';

  @override
  String get unSubscribeQuestion => 'Perutaanko tilaus?';

  @override
  String get clearHistoryQuestion => 'Tyhjennetäänkö historia?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Tämä tyhjää tilisi katseluhistorian Invidious-palvelimella, jota käytät. Toimintoa ei voi perua.';

  @override
  String get noHistory =>
      'Ei katseluhistoriaa, katsomasi videot tulevat tänne näkyviin';

  @override
  String get homeLayoutEditor => 'Muokkaa kotinäkymän asettelua';

  @override
  String get layoutEditorAddVideoSource => 'Lisää videolähde';

  @override
  String get layoutEditorExplanation =>
      'You can decide what to display on your home screen, you can have up to 2 small view with horizontal scrolling and one big source.';

  @override
  String get home => 'Koti';

  @override
  String get library => 'Kirjasto';

  @override
  String get customizeAppLayout => 'Mukauta sovelluksen näkymiä';

  @override
  String get customizeAppLayoutExplanation =>
      'Valitse, mitkä näkymät haluat nähdä päänavigointipalkissa. Klikkaa kotikuvaketta valitaksesi, mikä näkymä näytetään sovelluksen käynnistyessä. Voit muokata järjestystä raahaamalla.';

  @override
  String get navigationBarStyle => 'Navigointipalkin tyyli';

  @override
  String get navigationBarLabelAlwaysShowing => 'Näytä teksti aina';

  @override
  String get navigationBarLabelShowOnSelect =>
      'Näytä teksti valitussa kohteessa';

  @override
  String get navigationBarLabelNeverShow => 'Älä näytä tekstiä koskaan';

  @override
  String get distractionFreeMode => 'Keskittymismoodi';

  @override
  String get distractionFreeModeDescription =>
      'Poistaa käytöstä videoiden kommentit ja suositukset';

  @override
  String get secondsShortForm => 'sek.';

  @override
  String get videoFilterApplyDateToFilter => 'Filter videos on given times';

  @override
  String get videoFilterDayOfWeek => 'Select days to apply filters';

  @override
  String get videoFilterDayOfWeekDescription =>
      'You can selectively choose days of the week and time to which the filters apply to, for example, avoid sport events spoilers.';

  @override
  String get videoFilterStartTime => 'Aloitusaika';

  @override
  String get videoFilterEndTime => 'Päättymisaika';

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
  String get notifications => 'Ilmoitukset';

  @override
  String get notificationsDescription => 'Ota käyttöön ilmoituksia';

  @override
  String get enableNotificationDescriptions =>
      'Palvelu joka tarkistaa ja ilmoittaa valitsemistasi kohteista, pidetään käynnissä.';

  @override
  String get subscriptionNotification => 'Tilausten ilmoitukset';

  @override
  String get subscriptionNotificationDescription =>
      'Saa ilmoituksia, kun tilauksillasi on uusia videoita saatavilla. Vaatii, että olet kirjautunut palvelimelle.';

  @override
  String get subscriptionNotificationTitle => 'Uusia videoita tilauksiltasi';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString saatavilla',
      one: '1 saatavilla',
      zero: 'ei ole saatavilla',
    );
    return 'Uusia videoita $_temp0 tilauksiltasi';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Akun optimoinnin käytöstä poisto';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'Clipious pitää taustapalvelua käynnissä, jotta se voi lähettää ilmoituksia. Taustapalvelun käyttö vaatii rajoittamattoman akun käytön. Painamalla OK avataan akun optimointiasetukset.';

  @override
  String get askToEnableBackgroundServiceTitle =>
      'Ilmoitukset on poissa käytöstä';

  @override
  String get askToEnableBackgroundServiceContent =>
      'Saadaksesi ilmoituksia, Clipiouksen ilmoitukset tulee olla käytössä. Paina OK ottaaksesi ne käyttöön.';

  @override
  String get otherNotifications => 'Muut ilmoituslähteet (kellon kuvakkeet)';

  @override
  String get deleteChannelNotificationTitle =>
      'Poistetaanko kanavan ilmoitukset?';

  @override
  String get deleteChannelNotificationContent =>
      'Et saa ilmoituksia enää tältä kanavalta.';

  @override
  String get deletePlaylistNotificationTitle =>
      'Poistetaanko soittolistan ilmoitukset?';

  @override
  String get deletePlaylistNotificationContent =>
      'Et saa ilmoituksia enää tältä soittolistalta.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Uusia videoita kanavalta $channel';
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
      other: '$countString saatavilla',
      one: 'saatavilla 1',
      zero: 'ei ole saatavilla',
    );
    return 'Uusia videoita $_temp0 kanavalla $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'Uusia videoita soittolistalla $playlist';
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
      other: '$countString saatavilla',
      one: 'saatavilla 1',
      zero: 'ei ole saatavilla',
    );
    return 'Uusia videoita $_temp0 soittolistalla $playlist';
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
      'Tarkistetaan tilauksia...';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'Tarkistetaan soittolistoja...';

  @override
  String get foregroundServiceUpdatingChannels => 'Tarkistetaan kanavia...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Uusien videoiden tarkistamistiheys';

  @override
  String get notificationFrequencySettingsDescription =>
      'Kuinka usein sovellus tarkistaa uusien videoiden saatavuuden';

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
  String get subtitlesBackground => 'Tekstitysten taustaväri';

  @override
  String get subtitlesBackgroundDescription =>
      'Lisää tekstitysten luettavuutta näyttämällä ne mustalla taustalla';

  @override
  String get history => 'Historia';

  @override
  String get deArrowSettingDescription =>
      'Korvaa klikkiotsikot ja pienoiskuvat';

  @override
  String get deArrowReplaceThumbnails => 'Korvaa pienoiskuvat';

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
  String get enabled => 'Käytössä';

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
