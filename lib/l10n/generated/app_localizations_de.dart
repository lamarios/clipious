// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get subscriptions => 'Abos';

  @override
  String get playlists => 'Wiedergabelisten';

  @override
  String get popular => 'Beliebt';

  @override
  String get trending => 'Trends';

  @override
  String get noVideoInPlayList => 'Kein Video in der Wiedergabeliste';

  @override
  String get removeFromPlayList => 'Aus der Wiedergabeliste entfernen';

  @override
  String get deletePlayListQ => 'Wiedergabeliste löschen?';

  @override
  String get irreversibleAction =>
      'Diese Aktion ist nicht rückgängig zu machen';

  @override
  String get addPlayList => 'Wiedergabeliste hinzufügen';

  @override
  String get playListName => 'Name der Wiedergabeliste';

  @override
  String get playlistVisibility => 'Sichtbarkeit';

  @override
  String get publicPlaylist => 'Öffentlich';

  @override
  String get privatePlaylist => 'Privat';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get add => 'Hinzufügen';

  @override
  String get unlistedPlaylist => 'Ungelistet';

  @override
  String get info => 'Infos';

  @override
  String get videos => 'Videos';

  @override
  String get streams => 'Streams';

  @override
  String get latestVideos => 'Neueste Videos';

  @override
  String get subscribed => 'Abonniert';

  @override
  String get subscribe => 'Abonnieren';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Keine Abonnenten',
        'other': '$count Abonnenten',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Teilen';

  @override
  String get shareYoutubeLink => 'YouTube-Link teilen';

  @override
  String get shareInvidiousLink => 'Invidious-Link teilen';

  @override
  String get redirectInvidiousLink => 'Invidious Redirect-Link teilen';

  @override
  String get shareLinkWithTimestamp => 'Zeitstempel hinzufügen';

  @override
  String get ok => 'Okay';

  @override
  String get noChannels => 'Keine Kanäle';

  @override
  String get noPlaylists => 'Keine Wiedergabelisten';

  @override
  String get channels => 'Kanäle';

  @override
  String get couldntLoadVideo => 'Das Video konnte nicht geladen werden';

  @override
  String get comments => 'Kommentare';

  @override
  String get recommended => 'Empfohlen';

  @override
  String get couldntFetchVideos =>
      'Videos konnten nicht abgerufen werden. Zum erneuten Versuch antippen.';

  @override
  String get wizardIntro =>
      'Einen öffentlichen Server auswählen oder einen eigenen hinzufügen. (Kann später in den Einstellungen geändert werden)';

  @override
  String get startUsingClipious => 'Clipious jetzt nutzen';

  @override
  String get videoAddedToPlaylist => 'Video zur Wiedergabeliste hinzugefügt';

  @override
  String get videoAddedToQueue => 'Video zur Warteschlange hinzugefügt';

  @override
  String get errorAddingVideoToPlaylist =>
      'Fehler beim Hinzufügen des Videos zur Wiedergabeliste';

  @override
  String get itemlistErrorGeneric => 'Daten konnten nicht abgerufen werden';

  @override
  String get itemListErrorInvalidScope =>
      'Sie haben keine Berechtigung, dies zu sehen. Wenn Sie mit der Token-Methode angemeldet sind, versuchen Sie, sich ab- und wieder anzumelden.';

  @override
  String get selectPlaylist => 'Wiedergabeliste auswählen';

  @override
  String get createNewPlaylist => 'Neue Wiedergabeliste erstellen';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Antworten',
      one: '1 Antwort',
      zero: 'Keine Antworten',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Mehr laden';

  @override
  String get topSorting => 'Top';

  @override
  String get newSorting => 'Neu';

  @override
  String get streamIsLive => 'Live';

  @override
  String get sponsorSkipped => 'Sponsor übersprungen';

  @override
  String get selectBrowsingCountry => 'Land zum Browsen auswählen';

  @override
  String get showOnStart =>
      'Auswählen, was beim Starten der App angezeigt werden soll';

  @override
  String get settings => 'Einstellungen';

  @override
  String get browsing => 'Durchsuchen';

  @override
  String get country => 'Land';

  @override
  String get whenAppStartsShow => 'Wenn die App startet, zeigen …';

  @override
  String get servers => 'Servers';

  @override
  String get manageServers => 'Server verwalten';

  @override
  String currentServer(String current) {
    return 'Derzeit wird $current verwendet';
  }

  @override
  String get useSponsorBlock => 'SponsorBlock verwenden';

  @override
  String get sponsorBlockDescription =>
      'Von der Community eingereichte Sponsorensegmente überspringen';

  @override
  String get about => 'Über';

  @override
  String get name => 'Name';

  @override
  String get package => 'Paket';

  @override
  String get version => 'Version';

  @override
  String get build => 'Build';

  @override
  String get addServer => 'Server hinzufügen';

  @override
  String get useThisServer => 'Diesen Server verwenden';

  @override
  String get logIn => 'Anmelden';

  @override
  String get delete => 'Löschen';

  @override
  String get invalidInvidiousServer => 'Ungültiger Invidious-Server';

  @override
  String get yourServers => 'Ihre Server';

  @override
  String get loggedIn => 'Angemeldet';

  @override
  String get notLoggedIn => 'Nicht angemeldet';

  @override
  String get addServerHelpText =>
      'Verwenden Sie die Taste +, um Ihre eigenen Server hinzuzufügen, oder tippen Sie auf einen öffentlichen Server und fügen Sie ihn hinzu.';

  @override
  String get publicServers => 'Öffentliche Server';

  @override
  String get loadingPublicServer => 'Öffentliche Server werden geladen';

  @override
  String get tapToAddServer =>
      'Tippen Sie auf, um einen Server zu Ihrer Liste hinzuzufügen';

  @override
  String get publicServersError =>
      'Die Liste der öffentlichen Server konnte nicht abgerufen werden. Zum erneuten Versuch antippen.';

  @override
  String get appearance => 'Aussehen';

  @override
  String get useDynamicTheme => 'Dynamische Farben';

  @override
  String get useDynamicThemeDescription =>
      'Material-You-Farben verwenden (nur auf Android 12+ verfügbar)';

  @override
  String get useDash => 'DASH verwenden';

  @override
  String get useDashDescription =>
      'Das adaptive DASH-Streaming kann manchmal problematisch sein, YouTube kann seine Geschwindigkeit begrenzen.';

  @override
  String get videoPlayer => 'Videospieler';

  @override
  String get videoListed => 'Öffentlich';

  @override
  String get videoUnlisted => 'Ungelistet';

  @override
  String get videoIsFamilyFriendly => 'Familienfreundlich';

  @override
  String get tapToManage => 'Zum Verwalten tippen';

  @override
  String get authentication => 'Authentifizierung';

  @override
  String get tokenLogin => 'Mit Token anmelden';

  @override
  String get tokenLoginDescription => 'Empfohlene Anmeldemethode';

  @override
  String get cookieLogin => 'Mit Cookie anmelden';

  @override
  String get cookieLoginDescription =>
      'Diese Methode verwenden, wenn Probleme mit der Token-Authentifizierung auftreten';

  @override
  String get logout => 'Abmelden';

  @override
  String get username => 'Benutzername';

  @override
  String get password => 'Passwort';

  @override
  String get wrongUsernamePassword =>
      'Falscher Benutzername oder falsches Passwort';

  @override
  String get error => 'Fehler';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats ist nicht wie erwartet';

  @override
  String get malformedStatsEndpointDescription =>
      'Der Stats-Endpunkt des Servers hat nicht die erwartete Nutzlast übermittelt, der Schlüssel \"software.name\" sollte gleich \"invidious\" sein.\nAntwort vom Server:';

  @override
  String get serverIsNotReachable => 'Server ist nicht erreichbar';

  @override
  String get videoQueue => 'Videowarteschlange';

  @override
  String get addToQueueList => 'Zur Warteschlange hinzufügen';

  @override
  String get addToPlaylist => 'Zur Wiedergabeliste hinzufügen';

  @override
  String get playNext => 'Als nächstes spielen';

  @override
  String get playNextAddedToQueue => 'Video wird als nächstes abgespielt';

  @override
  String get addRecommendedToQueue =>
      'Von der automatischen Wiedergabe als nächstes empfohlen';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Auswählen, welche Art von Segmenten übersprungen werden soll';

  @override
  String get sponsorBlockCategorySponsor => 'Sponsoren';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Bezahlte Werbung, bezahlte Verweise und direkte Anzeigen. Nicht für Eigenwerbung oder kostenlose Hinweise auf Ursachen / Schöpfer / Websites / Produkte, die sie mögen.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => 'Unbezahlt / Eigenwerbung';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Ähnlich wie bei „Sponsor“, außer bei unbezahlter oder Eigenwerbung. Dazu gehören auch Abschnitte über Merchandise, Spenden oder Informationen darüber, mit wem sie zusammengearbeitet haben. ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Interaktionserinnerung (Abonnieren)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Wenn in der Mitte des Inhalts eine kurze Aufforderung steht, ihn zu mögen, zu abonnieren oder ihm zu folgen. Wenn er lang ist oder sich auf etwas Bestimmtes bezieht, sollte er stattdessen unter Eigenwerbung stehen.';

  @override
  String get sponsorBlockCategoryIntro => 'Unterbrechung / Intro-Animation';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Ein Intervall ohne tatsächlichen Inhalt. Es könnte eine Pause, ein statisches Bild oder eine sich wiederholende Animation sein. Dies sollte nicht für Übergänge mit Informationen verwendet werden.';

  @override
  String get sponsorBlockCategoryOutro => 'Abspann / Credits';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Credits oder wenn die YouTube-Endkarten erscheinen. Nicht für Schlussfolgerungen mit Informationen.';

  @override
  String get sponsorBlockCategoryPreview => 'Vorschau / Zusammenfassung';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Sammlung von Clips, die zeigen, was in diesem Video oder in anderen Videos einer Serie, in der alle Informationen später im Video wiederholt werden, behandelt wird.';

  @override
  String get sponsorBlockCategoryFiller => 'Ablenkende Nebenthemen / Witze';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Tangentiale Szenen, die nur zur Auflockerung oder für den Humor hinzugefügt werden und für das Verständnis des Hauptinhalts des Videos nicht erforderlich sind. Dies sollte keine Segmente beinhalten, die Kontext oder Hintergrunddetails liefern. Dies ist eine sehr aggressive Kategorie für den Fall, dass Sie nicht in der Stimmung für „Spaß“ sind.';

  @override
  String get sponsorBlockCategoryMusicOffTopic =>
      'Musik: Nicht-musikalischer Bereich';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Nur zur Verwendung in Musikvideos. Dies sollte nur für Abschnitte von Musikvideos verwendet werden, die nicht bereits durch eine andere Kategorie abgedeckt sind.';

  @override
  String get useProxy => 'Proxy-Videos';

  @override
  String get useProxyDescription =>
      'Durch den Proxy von Videostreams vom Server können regionale Sperren oder die Blockierung von YouTube durch Internetdienstanbieter umgangen werden';

  @override
  String get pressDownToShowSettings =>
      'Nach unten drücken, um Einstellungen anzuzeigen';

  @override
  String get quality => 'Qualität';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Untertitel';

  @override
  String get playbackSpeed => 'Abspielgeschwindigkeit';

  @override
  String get blackBackground => 'Schwarzer Hintergrund';

  @override
  String get blackBackgroundDescription =>
      'Für den Dunkelmodus auf einem OLED-Bildschirm';

  @override
  String get search => 'Suchen';

  @override
  String get subtitleFontSize => 'Untertitel Schriftgröße';

  @override
  String get subtitleFontSizeDescription =>
      'Die Größe der Untertitel ändern, wenn sie auf dem Gerät zu klein oder zu groß sind';

  @override
  String get skipSslVerification => 'SSL-Zertifikatsprüfung überspringen';

  @override
  String get skipSslVerificationDescription =>
      'Für die Verwendung eines selbst signierten SSL-Zertifikats oder bei SSL-bezogenen Problemen mit Ihrem Server.';

  @override
  String get themeBrightness => 'Design';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get followSystem => 'System folgen';

  @override
  String get requiresRestart => 'Erfordert Neustart der App';

  @override
  String get appLanguage => 'Anwendungssprache';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Videos',
      one: '1 Video',
      zero: 'Keine Videos',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Die Url muss mit http:// oder https:// beginnen';

  @override
  String get returnYoutubeDislikeDescription =>
      'Anzeige der geschätzten Videoabneigungen über die API von returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'Benutzerdefinierte RYD-Instanz url';

  @override
  String get rydCustomInstanceDescription =>
      'Eine andere RYD-Instanz verwenden, leer lassen, um die Standardinstanz zu verwenden';

  @override
  String get autoplayVideoOnLoad => 'Video automatisch bei Laden abspielen';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Das Video automatisch abspielen, nachdem es geladen wurde';

  @override
  String get searchHistory => 'Suchverlauf';

  @override
  String get searchHistoryDescription => 'Suchverlaufseinstellungen';

  @override
  String get enableSearchHistory => 'Suchverlauf aktivieren';

  @override
  String get searchHistoryLimit => 'Suchverlaufslimit';

  @override
  String get searchHistoryLimitDescription =>
      'Einstellen, wie viele vorherige Suchanfragen in den Vorschlägen angezeigt werden';

  @override
  String get shorts => 'Shorts';

  @override
  String get searchUploadDate => 'Hochgeladen am';

  @override
  String get searchUploadDateAny => 'Beliebiges Datum';

  @override
  String get searchUploadDateHour => 'Letzte Stunde';

  @override
  String get searchUploadDateToday => 'Heute';

  @override
  String get searchUploadDateWeek => 'Diese Woche';

  @override
  String get searchUploadDateMonth => 'Diesen Monat';

  @override
  String get searchUploadDateYear => 'Dieses Jahr';

  @override
  String get searchDuration => 'Dauer';

  @override
  String get searchDurationAny => 'Beliebige Dauer';

  @override
  String get searchDurationShort => 'Kurz (<4 Minuten)';

  @override
  String get searchDurationLong => 'Lang (>20 Minuten)';

  @override
  String get searchDurationMedium => 'Mittel (4-20 Minuten)';

  @override
  String get searchSortBy => 'Sortieren nach';

  @override
  String get searchSortRelevance => 'Relevanz';

  @override
  String get searchSortRating => 'Bewertung';

  @override
  String get searchSortUploadDate => 'Upload-Datum';

  @override
  String get searchSortViewCount => 'Aufrufe';

  @override
  String get clearSearchHistory => 'Suchverlauf leeren';

  @override
  String get appLogs => 'Anwendungslogs';

  @override
  String get appLogsDescription =>
      'Erhalte Protokolle über das, was in der Anwendung geschieht. Das kann hilfreich sein, um Probleme zu melden';

  @override
  String get copyToClipBoard => 'In Zwischenablage kopieren';

  @override
  String get logsCopied => 'Protokolle wurden in die Zwischenablage kopiert';

  @override
  String get rememberSubtitleLanguage => 'Sprache der Untertitel merken';

  @override
  String get videoFilters => 'Videofilter';

  @override
  String nFilters(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Filter',
      one: '1 Filter',
      zero: 'Keine Videos',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'Verstecke oder Obfuskiere Videos aus allen Feeds in dieser Anwendung basierend auf die unten definierten Filter. Dies erlaubt zum Beispiel das Verstecken von Sportergebnissen oder blendet Shorts bestimmter Kanäle aus.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Regeln zum Herausfiltern von Videos definieren';

  @override
  String get videoFilterAllChannels => 'Alle Kanäle';

  @override
  String get addVideoFilter => 'Filter erstellen';

  @override
  String get editVideoFilter => 'Filter bearbeiten';

  @override
  String get videoFilterType => 'Typ';

  @override
  String get videoFilterOperation => 'Operation';

  @override
  String get videoFilterValue => 'Wert';

  @override
  String get save => 'Speichern';

  @override
  String get videoFilterEditDescription =>
      'Wähle einen Kanal, Filtertyp, Operation und einen Wert, um Videos aus Listen herauszufiltern. Zum Beispiel: \"Typ: Videoname, Operation: Enthält, Wert: test\" würde alle Videos mit dem Wort \"test\" in ihrem Namen herausfiltern.';

  @override
  String get optional => 'optional';

  @override
  String get videoFilterHideLabel => 'Ausblenden';

  @override
  String get videoFilterFilterLabel => 'Verschleiern';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter Videos wo $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered =>
      'Video wurde aus dem/den folgenden Grund/Gründen gefiltert:';

  @override
  String get videoFilterTapToReveal => 'Tippen zum Anzeigen';

  @override
  String get videoFilterHide => 'Gefilterte Videos ausblenden';

  @override
  String get videoFilterHideDescription =>
      'Standardmäßig werden gefilterte Videos nicht ausgeblended, sondern unter Angabe des relenvanten Filters unkenntlich gemacht. Diese Einstellung entfernt die gefilterten Videos stattdessen komplett.';

  @override
  String get videoFilterNoFilters =>
      'Keine Videofilter. Tippe auf +, um Filter hinzuzufügen.';

  @override
  String get videoFilterTypeVideoTitle => 'Videotitel';

  @override
  String get videoFilterTypeChannelName => 'Kanalname';

  @override
  String get videoFilterTypeVideoLength => 'Videolänge (Sekunden)';

  @override
  String get videoFilterOperationContains => 'Enthält';

  @override
  String get videoFilterOperationNotContain => 'Enthält nicht';

  @override
  String get videoFilterOperationLowerThan => 'Weniger als';

  @override
  String get videoFilterOperationHigherThan => 'Höher als';

  @override
  String get channel => 'Kanal';

  @override
  String get videoFilterHideAllFromChannel => 'Alle Videos des Kanals filtern';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return 'Alle Videos des Kanals $hideOrFilter';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Setze die Untertitelsprache automatisch auf die letzte ausgewählte Sprache, falls vorhanden';

  @override
  String get lockFullScreenToLandscape =>
      'Orientierung im Vollbild an Bildseitenverhältnis anpassen';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Zeige Videos im Vollbild immer im nativen Seitenverhältnis an - Quer bei Horizontalen/\"klassischen\" Videos, Hochkant bei Vertikalen Videos';

  @override
  String get fillFullscreen => 'Video auf Bildschirmgröße maximieren';

  @override
  String get fillFullscreenDescription =>
      'Video anpassen, dass es den gesamten Bildschirm im Querformat ausfüllt';

  @override
  String get rememberPlaybackSpeed => 'Wiedergabegeschwindigkeit merken';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Wiedergabegeschwindigkeit automatisch auf die zuletzt gewählte Geschwindigkeit einstellen';

  @override
  String get downloads => 'Downloads';

  @override
  String get download => 'Herunterladen';

  @override
  String get videoAlreadyDownloaded => 'Video bereits heruntergeladen';

  @override
  String get noDownloadedVideos =>
      'Keine heruntergeladenen Videos, durchsuchen, langes Drücken auf ein Video in einer Liste oder Tippen auf die Download-Schaltfläche auf einem Video-Bildschirm zum Herunterladen';

  @override
  String get downloadsPlayAll => 'Alle wiedergeben';

  @override
  String get videoDownloadStarted => 'Videodownload gestartet';

  @override
  String get videoFailedDownloadRetry =>
      'Herunterladen fehlgeschlagen, zum erneuten Versuch tippen';

  @override
  String get videoDownloadAudioOnly => 'Nur Audio';

  @override
  String get manageSubscriptions => 'Abonnements verwalten';

  @override
  String get noSubscriptions =>
      'Keine Abonnements, Sie können Videos durchsuchen und jeden Kanal abonnieren, der Ihnen gefällt.';

  @override
  String get youCanSubscribeAgainLater =>
      'Sie können diesen Kanal später erneut abonnieren';

  @override
  String get unSubscribeQuestion => 'Deabonnieren?';

  @override
  String get clearHistoryQuestion => 'Verlauf löschen?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Dadurch wird der Verlauf Ihres Kontos auf der von Ihnen verwendeten Invidious-Instanz gelöscht. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get noHistory =>
      'Kein Verlauf, schauen Sie sich einige Videos an und es wird hier erscheinen';

  @override
  String get homeLayoutEditor => 'Layout der Startseite bearbeiten';

  @override
  String get layoutEditorAddVideoSource => 'Videoquelle hinzufügen';

  @override
  String get layoutEditorExplanation =>
      'Sie können entscheiden, was auf Ihrem Startbildschirm angezeigt werden soll. Sie können bis zu 2 kleine Ansichten mit horizontalem Scrollen und eine große Quelle haben.';

  @override
  String get home => 'Startseite';

  @override
  String get library => 'Bibliothek';

  @override
  String get customizeAppLayout => 'App-Bereiche anpassen';

  @override
  String get customizeAppLayoutExplanation =>
      'Wählen Sie aus, welche Bereiche in der Hauptnavigationsleiste der App angezeigt werden sollen. Klicken Sie auf das Startsymbol, um auszuwählen, welcher Bildschirm beim Starten der App angezeigt wird. Sie können die Bereiche neu anordnen, indem Sie sie verschieben.';

  @override
  String get navigationBarStyle => 'Stil der Navigationsleiste';

  @override
  String get navigationBarLabelAlwaysShowing =>
      'Bezeichnung wird immer angezeigt';

  @override
  String get navigationBarLabelShowOnSelect =>
      'Bezeichnung wird auf dem ausgewählten Element angezeigt';

  @override
  String get navigationBarLabelNeverShow => 'Bezeichnung nie anzeigen';

  @override
  String get distractionFreeMode => 'Ablenkungsfreier Modus';

  @override
  String get distractionFreeModeDescription =>
      'Videokommentare und -empfehlungen deaktivieren';

  @override
  String get secondsShortForm => 'Sek.';

  @override
  String get videoFilterApplyDateToFilter =>
      'Videos nach bestimmten Zeiten filtern';

  @override
  String get videoFilterDayOfWeek => 'Tage auswählen, um Filter anzuwenden';

  @override
  String get videoFilterDayOfWeekDescription =>
      'Sie können selektiv Wochentage und Uhrzeiten auswählen, für die die Filter gelten, um z.B. Spoiler von Sportereignissen zu vermeiden.';

  @override
  String get videoFilterStartTime => 'Startzeit';

  @override
  String get videoFilterEndTime => 'Endzeit';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Angewandt an $selectedDays';
  }

  @override
  String get from => 'Von';

  @override
  String get to => 'An';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'Von $from an $to';
  }

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get notificationsDescription =>
      'Aktivieren und überprüfen Sie, worüber Sie benachrichtigt werden';

  @override
  String get enableNotificationDescriptions =>
      'Führt einen Dienst im Vordergrund aus, um die Änderungen, die Sie überwachen, zu überprüfen und Sie zu benachrichtigen';

  @override
  String get subscriptionNotification => 'Abonnement-Benachrichtigungen';

  @override
  String get subscriptionNotificationDescription =>
      'Lassen Sie sich über neue Videos in Ihrem Abonnement-Feed benachrichtigen, wenn Sie in Ihrer aktuellen Instanz angemeldet sind';

  @override
  String get subscriptionNotificationTitle =>
      'Neue Videos von Ihren Abonnements';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString neue Videos',
      one: '1 neues Video',
      zero: 'keine neuen Videos',
    );
    return 'Es gibt $_temp0 in Ihrem Abonnement-Feed';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Deaktivierung der Batterieoptimierung erforderlich';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'Um Benachrichtigungen senden zu können, muss Clipious einen Hintergrunddienst ausführen. Für einen reibungslosen Betrieb ist es erforderlich, dass Clipious eine uneingeschränkte Akkunutzung erhält. Tippen Sie auf OK, um die Einstellungen für die Akkuoptimierung zu öffnen.';

  @override
  String get askToEnableBackgroundServiceTitle =>
      'Benachrichtigungen ausgeschaltet';

  @override
  String get askToEnableBackgroundServiceContent =>
      'Um Benachrichtigungen zu erhalten, müssen die Clipious-Benachrichtigungen aktiviert werden. OK drücken, um sie zu aktivieren.';

  @override
  String get otherNotifications =>
      'Andere Benachrichtigungsquellen (Glockensymbole)';

  @override
  String get deleteChannelNotificationTitle =>
      'Kanal-Benachrichtigung löschen?';

  @override
  String get deleteChannelNotificationContent =>
      'Sie werden keine weiteren Benachrichtigungen von diesem Kanal erhalten.';

  @override
  String get deletePlaylistNotificationTitle =>
      'Wiedergabelisten-Benachrichtigung löschen?';

  @override
  String get deletePlaylistNotificationContent =>
      'Sie werden keine weiteren Benachrichtigungen von dieser Wiedergabeliste erhalten.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Neue Videos von $channel';
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
      other: '$countString neue Videos',
      one: '1 neues Video',
      zero: 'keine neuen Videos',
    );
    return 'Es gibt $_temp0 von $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'Neue Videos in der Wiedergabeliste $playlist';
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
      other: '$countString neue Videos',
      one: '1 neues Video',
      zero: 'keine neuen Videos',
    );
    return 'Es gibt $_temp0 in der Wiedergabeliste $playlist';
  }

  @override
  String get foregroundServiceNotificationTitle => 'Videoüberwachung';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'pro Stunde',
        '24': 'täglich',
        'other': 'alle $hours Stunden',
      },
    );
    return 'Nach neuen Videos wird einmal $_temp0 geprüft';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'Abonnements werden überprüft...';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'Wiedergabelisten werden überprüft...';

  @override
  String get foregroundServiceUpdatingChannels => 'Kanäle werden überprüft...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Häufigkeit der Prüfung auf neue Videos';

  @override
  String get notificationFrequencySettingsDescription =>
      'Wie oft die App nach neuen Videos sucht';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '1 Tag',
        'other': '$hours Std.',
      },
    );
    return '$_temp0';
  }

  @override
  String get subtitlesBackground => 'Hintergrund der Untertitel';

  @override
  String get subtitlesBackgroundDescription =>
      'Fügt einen schwarzen Hintergrund für Untertitel hinzu, um sie lesbarer zu machen';

  @override
  String get history => 'Verlauf';

  @override
  String get deArrowSettingDescription =>
      'Clickbait-Titel und Miniaturbilder ersetzen';

  @override
  String get deArrowReplaceThumbnails => 'Miniaturansichten ersetzen';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Videominiaturen zusätzlich zu den Titeln ersetzen';

  @override
  String get deArrowWarning =>
      'Die Aktivierung von DeArrow kann die Browsing-Geschwindigkeit der App erheblich verringern, da für jedes einzelne Video zusätzliche HTTP-Anfragen erforderlich sind';

  @override
  String get copySettingsAsJson =>
      'Einstellungen als JSON in die Zwischenablage kopieren';

  @override
  String get copySettingsAsJsonDescription =>
      'Die Einstellungen als JSON kopieren, um die Fehlersuche zu erleichtern, wenn ein Problem mit der App auftritt und ein Fehler gemeldet werden soll';

  @override
  String get seeking => 'Suche nach';

  @override
  String get skipStep => 'Vorwärts-/Rückwärtsschritt springen';

  @override
  String get skipStepDescription =>
      'Zu überspringende Sekunden bei Vorwärts-/Rückwärtsaktionen';

  @override
  String get exponentialSkip => 'Exponentielles Vorwärts-/Rückwärtsspringen';

  @override
  String get exponentialSkipDescription =>
      'Je mehr Du vorwärts springen, desto größer ist der Schritt.';

  @override
  String get fullscreenOnLandscape => 'Vollbild im Querformat';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Wechselt zum Vollbildmodus, wenn das Gerät in den Querformatmodus gedreht wird';

  @override
  String get enabled => 'Aktiviert';

  @override
  String get submitFeedback => 'Feedback einreichen';

  @override
  String get submitFeedbackDescription =>
      'Sie haben einen Fehler gefunden oder haben einen Vorschlag? Verwenden Sie dieses Tool, um einen Screenshot der App zu machen, zu kommentieren und Feedback zu geben';

  @override
  String get feedbackDisclaimer =>
      'Um Feedback einzureichen, benötigen Sie ein GitHub-Konto und Ihr Screenshot wird anonym an Imgur übermittelt.';

  @override
  String get feedbackScreenshotError =>
      'Fehler beim Hochladen eines Screenshots auf Imgur';

  @override
  String get channelSortByNewest => 'Neueste';

  @override
  String get channelSortByOldest => 'Älteste';

  @override
  String get channelSortByPopular => 'Beliebt';

  @override
  String get invidiousAccount => 'Invidious-Konto';

  @override
  String get onDeviceSubscriptions => 'Auf dem Gerät';

  @override
  String get both => 'Beide';

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get addBasicAuth => 'Basisauthentifizierung hinzufügen';

  @override
  String get addBasicAuthExplanation =>
      'Wenn ihr Server einfache HTTP Authentifizierung benötigt, fügen Sie die Details unten hinzu. Dies sind nicht ihre invidious Kontodaten';

  @override
  String get addHeader => 'Kopfzeile hinzufügen';

  @override
  String get advancedConfiguration => 'Erweiterte Konfiguration';

  @override
  String get customHeaders => 'Benutzerdefinierte Kopfzeilen';

  @override
  String get customHeadersExplanation =>
      'Setzen Sie benutzerdefinierte Kopfzeilen, die zum invidious Server gesendet werden';

  @override
  String get value => 'Wert';

  @override
  String get testAndAddServer => 'Server testen und hinzufügen';

  @override
  String get alsoTestServerConfig =>
      'Außerdem die Serverkonfiguration testen, z.B. ob die Miniaturansichten richtig angezeigt werden';

  @override
  String get serverAlreadyExists =>
      'Server ist bereits in den Einstellungen vorhanden';

  @override
  String get wrongThumbnailConfiguration =>
      'Der Server ist erreichbar, aber nicht richtig konfiguriert. Miniaturansichten von Videos und Kanälen werden nicht richtig angezeigt. Deaktivieren Sie die Servertestkonfiguration, wenn Sie damit OK sind, reparieren Sie andernfalls den Server';

  @override
  String get openWikiLink => 'Wiki für Hilfe öffnen';

  @override
  String get serverUnreachable =>
      'Server ist unerreichbar oder ist kein valider invidious Server';

  @override
  String get copyToDownloadFolder => 'Kopiere zum Download-Ordner';

  @override
  String get fileCopiedToDownloadFolder =>
      'Datei in den Download-Ordner kopiert';

  @override
  String get videoDeleted => 'Video gelöscht';

  @override
  String get sleepTimer => 'Einschlaf-Timer';

  @override
  String get stopTheVideo => 'Video stoppen';

  @override
  String get stopTheVideoExplanation =>
      'Wenn aktiviert wird das Video geschlossen, wenn deaktiviert wird das Video einfach pausiert';

  @override
  String get setTimer => 'Timer festlegen';

  @override
  String get cancelSleepTimer => 'Einschlaf-Timer abbrechen';

  @override
  String premieresIn(Object formattedDuration) {
    return 'Premiere in $formattedDuration';
  }

  @override
  String get screenControls => 'Bildschirmsteuerelemente';

  @override
  String get screenControlsExplanation =>
      'Beim Anschauen eines Videos im Vollbildmodus passt das vertikale Ziehen von links oder rechts wird die Helligkeit bzw. Lautstärke an';

  @override
  String get retry => 'Versuchen Sie es erneut';

  @override
  String get forceTvUi => 'TV-Oberfläche erzwingen';

  @override
  String get forceTvUiExplanation =>
      'Force the interface to be the TV experience, can be useful for some devices that do not have the leanback system config. App restart required';

  @override
  String get noPublicServers => 'Es sind keine öffentlichen Server verfügbar';

  @override
  String get tapToSeeHow => 'Tap to see how to host your own';

  @override
  String get referToInvidiousWebsiteForHostingInstructions =>
      'Refer to Invidious website for instructions on how to host invidious';
}
