// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get subscriptions => 'Iscrizioni';

  @override
  String get playlists => 'Playlist';

  @override
  String get popular => 'Popolari';

  @override
  String get trending => 'Di tendenza';

  @override
  String get noVideoInPlayList => 'Nessun video nella playlist';

  @override
  String get removeFromPlayList => 'Rimuovi dalla playlist';

  @override
  String get deletePlayListQ => 'Eliminare la playlist?';

  @override
  String get irreversibleAction => 'Questa azione è irreversibile';

  @override
  String get addPlayList => 'Aggiungi una playlist';

  @override
  String get playListName => 'Nome della playlist';

  @override
  String get playlistVisibility => 'Visibilità';

  @override
  String get publicPlaylist => 'Pubblica';

  @override
  String get privatePlaylist => 'Privata';

  @override
  String get cancel => 'Annulla';

  @override
  String get add => 'Aggiungi';

  @override
  String get unlistedPlaylist => 'Non elencata';

  @override
  String get info => 'Informazioni';

  @override
  String get videos => 'Video';

  @override
  String get streams => 'Flussi';

  @override
  String get latestVideos => 'Ultimi video';

  @override
  String get subscribed => 'Iscritto/a';

  @override
  String get subscribe => 'Iscriviti';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Nessun iscritto',
        'other': '$count iscritti',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Condividi';

  @override
  String get shareYoutubeLink => 'Condividi il collegamento YouTube';

  @override
  String get shareInvidiousLink => 'Condividi il collegamento Invidious';

  @override
  String get redirectInvidiousLink =>
      'Condividi il link di reindirizzamento di Invidious';

  @override
  String get shareLinkWithTimestamp => 'Aggiungi marca temporale';

  @override
  String get ok => 'OK';

  @override
  String get noChannels => 'Nessun canale';

  @override
  String get noPlaylists => 'Nessuna playlist';

  @override
  String get channels => 'Canali';

  @override
  String get couldntLoadVideo => 'Impossibile caricare il video';

  @override
  String get comments => 'Commenti';

  @override
  String get recommended => 'Consigliato';

  @override
  String get couldntFetchVideos =>
      'Impossibile recuperare i video. Tocca per riprovare.';

  @override
  String get wizardIntro =>
      'Seleziona un server pubblico o aggiungi il proprio. (Può essere modificato in seguito nelle impostazioni)';

  @override
  String get startUsingClipious => 'Inizia a usare Clipious';

  @override
  String get videoAddedToPlaylist => 'Video aggiunto alla playlist';

  @override
  String get videoAddedToQueue => 'Video aggiunto alla coda';

  @override
  String get errorAddingVideoToPlaylist =>
      'Errore durante l’aggiunta di un video alla playlist';

  @override
  String get itemlistErrorGeneric => 'Errore nell\'acquisizione dei dati';

  @override
  String get itemListErrorInvalidScope =>
      'Non hai il permesso per vedere questo, se hai fatto l\'accesso usando il metodo del token prova ad uscire e riaccedere nuovamente';

  @override
  String get selectPlaylist => 'Seleziona la playlist';

  @override
  String get createNewPlaylist => 'Crea una nuova playlist';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString risposte',
      one: '1 risposta',
      zero: 'Nessuna risposta',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Carica di più';

  @override
  String get topSorting => 'Migliori';

  @override
  String get newSorting => 'Nuovo';

  @override
  String get streamIsLive => 'Dal vivo';

  @override
  String get sponsorSkipped => 'Sponsor saltato';

  @override
  String get selectBrowsingCountry => 'Seleziona il paese di navigazione';

  @override
  String get showOnStart =>
      'Seleziona cosa mostrare all’avvio dell’applicazione';

  @override
  String get settings => 'Impostazioni';

  @override
  String get browsing => 'Navigazione';

  @override
  String get country => 'Paese';

  @override
  String get whenAppStartsShow => 'Quando l’applicazione si avvia, mostra…';

  @override
  String get servers => 'Server';

  @override
  String get manageServers => 'Gestisci i server';

  @override
  String currentServer(String current) {
    return 'Attualmente si utilizza $current';
  }

  @override
  String get useSponsorBlock => 'Usa SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'Salta i segmenti degli sponsor presentati dalla comunità';

  @override
  String get about => 'Informazioni';

  @override
  String get name => 'Nome';

  @override
  String get package => 'Pacchetto';

  @override
  String get version => 'Versione';

  @override
  String get build => 'Build';

  @override
  String get addServer => 'Aggiungi un server';

  @override
  String get useThisServer => 'Usa questo server';

  @override
  String get logIn => 'Accedi';

  @override
  String get delete => 'Elimina';

  @override
  String get invalidInvidiousServer => 'Server Invidious non valido';

  @override
  String get yourServers => 'I tuoi server';

  @override
  String get loggedIn => 'Accesso effettuato';

  @override
  String get notLoggedIn => 'Accesso non effettuato';

  @override
  String get addServerHelpText =>
      'Utilizzare il pulsante + per aggiungere i propri server o toccare un server pubblico e aggiungerlo.';

  @override
  String get publicServers => 'Server pubblici';

  @override
  String get loadingPublicServer => 'Caricamento di server pubblici';

  @override
  String get tapToAddServer => 'Tocca per aggiungere il server all’elenco';

  @override
  String get publicServersError =>
      'Impossibile recuperare l’elenco dei server pubblici. Tocca per riprovare.';

  @override
  String get appearance => 'Aspetto';

  @override
  String get useDynamicTheme => 'Colori dinamici';

  @override
  String get useDynamicThemeDescription =>
      'Usa i colori di Material You (disponibile solo su Android 12+)';

  @override
  String get useDash => 'Usa DASH';

  @override
  String get useDashDescription =>
      'Lo streaming adattivo DASH a volte può essere problematico, YouTube ne può limitare la velocità.';

  @override
  String get videoPlayer => 'Lettore video';

  @override
  String get videoListed => 'Pubblico';

  @override
  String get videoUnlisted => 'Non elencato';

  @override
  String get videoIsFamilyFriendly => 'Adatto alle famiglie';

  @override
  String get tapToManage => 'Tocca per gestire';

  @override
  String get authentication => 'Autenticazione';

  @override
  String get tokenLogin => 'Accedi con un token';

  @override
  String get tokenLoginDescription => 'Modo consigliato per accedere';

  @override
  String get cookieLogin => 'Accedi con un cookie';

  @override
  String get cookieLoginDescription =>
      'Usa questo metodo se si riscontrano problemi con l\'autenticazione tramite token';

  @override
  String get logout => 'Esci';

  @override
  String get username => 'Nome utente';

  @override
  String get password => 'Password';

  @override
  String get wrongUsernamePassword => 'Nome utente o password errato';

  @override
  String get error => 'Errore';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats non conforme';

  @override
  String get malformedStatsEndpointDescription =>
      'L\'endpoint non ha restituito i dati aspettati, la chiave \"software.name\" dovrebbe essere \"invidious\".\nRisposta dal server:';

  @override
  String get serverIsNotReachable => 'Il server non é raggiungibile';

  @override
  String get videoQueue => 'Coda video';

  @override
  String get addToQueueList => 'Aggiungi alla coda';

  @override
  String get addToPlaylist => 'Aggiungi a una playlist';

  @override
  String get playNext => 'Riproduci il prossimo video';

  @override
  String get playNextAddedToQueue =>
      'Il video verrà riprodotto successivamente';

  @override
  String get addRecommendedToQueue =>
      'Riproduzione automatica del prossimo consigliato';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Seleziona quale tipo di segmento da saltare';

  @override
  String get sponsorBlockCategorySponsor => 'Sponsor';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Promozione pagata, referral pagati e pubblicità dirette. Non per autopromozioni o ringraziamenti gratuiti a cause/creatori/siti web/prodotti che piacciono.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => 'Non pagato/Autopromozione';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Similmente agli \"sponsor\", eccetto che per le auto promozioni o quelle non pagate. Questo include le sezioni sul merchandising, le donazioni, o le informazioni sui collaboratori ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Promemoria di interazione (Iscriviti)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Quando c\'è un piccolo promemoria di mettere like, abbonarsi o iscriversi in mezzo al contenuto. Se è troppo lungo o troppo specifico, dovrebbe essere \"self promotion\".';

  @override
  String get sponsorBlockCategoryIntro => 'Interruzione/Intro animata';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Un intervallo senza nessun contenuto. Può essere una pausa, unimmagine statica o unanimazione che si ripete. Questo non deve essere usato per le transizioni contenenti informazioni.';

  @override
  String get sponsorBlockCategoryOutro => 'Titoli di coda/Crediti';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Crediti o quando viene mostrata la scheda finale. Non include parti rilevanti.';

  @override
  String get sponsorBlockCategoryPreview => 'Anteprima/Riassunto';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Insieme di clip che mostrano anteprime su cosa succederà in questo o altri video della serie. Gli argomenti saranno ripresi durante i video.';

  @override
  String get sponsorBlockCategoryFiller => 'Di riempimento/Battute';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Scene superflue aggiunte solo per riempire o per fare dell\'umorismo che non sono necessarie per capire il contenuto principale del video. Non devono essere inclusi i segmenti che forniscono il contesto o altri dettagli. Questa è una categoria molto precisa pensata per quando non si è in \"vena di divertimento\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic =>
      'Musica: Sezione senza musica';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Da usare solo in video musicali. Questo deve essere utilizzato per sezioni di video musicali che non sono già coperti da un\'altra categoria.';

  @override
  String get useProxy => 'Proxy per i video';

  @override
  String get useProxyDescription =>
      'Usando il proxy dei video tramite server puoi bypassare i blocchi sia regionali che dall\'ISP';

  @override
  String get pressDownToShowSettings => 'Premi per mostrare le impostazioni';

  @override
  String get quality => 'Qualità';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Sottotitoli';

  @override
  String get playbackSpeed => 'Velocità di riproduzione';

  @override
  String get blackBackground => 'Sfondo nero';

  @override
  String get blackBackgroundDescription => 'Per il tema scuro su schermo OLED';

  @override
  String get search => 'Cerca';

  @override
  String get subtitleFontSize => 'Dimensione dei sottotitoli';

  @override
  String get subtitleFontSizeDescription =>
      'Cambia la dimensione dei sottotitoli se sono troppo piccoli o troppo grossi sul tuo dispositivo';

  @override
  String get skipSslVerification => 'Salta la verifica del certificato SSL';

  @override
  String get skipSslVerificationDescription =>
      'For using a self-signed SSL certificate, or when having SSL related issues with your server.';

  @override
  String get themeBrightness => 'Tema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get followSystem => 'Segui le impostazioni di sistema';

  @override
  String get requiresRestart => 'Richiede il riavvio dell\'applicazione';

  @override
  String get appLanguage => 'Lingua dell\'applicazione';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString video',
      one: '1 video',
      zero: 'Nessun video',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Url deve iniziare con http:// o https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Mostra il numero di non mi piace del video utilizzando API di returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'Custom RYD instance url';

  @override
  String get rydCustomInstanceDescription =>
      'Use a different RYD instance, leave empty to use the default';

  @override
  String get autoplayVideoOnLoad =>
      'Riproduci automaticamente i video dopo il caricamento';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Riproduce automaticamente il video dopo che si è caricato';

  @override
  String get searchHistory => 'Cronologia di ricerca';

  @override
  String get searchHistoryDescription =>
      'Impostazioni della cronologia di ricerca';

  @override
  String get enableSearchHistory => 'Attiva la cronologia di ricerca';

  @override
  String get searchHistoryLimit => 'Limite della cronologia di ricerca';

  @override
  String get searchHistoryLimitDescription =>
      'Imposta quante ricerche precedenti verranno mostrate nei suggerimenti';

  @override
  String get shorts => 'Shorts';

  @override
  String get searchUploadDate => 'Data caricamento';

  @override
  String get searchUploadDateAny => 'Qualsiasi data';

  @override
  String get searchUploadDateHour => 'Ultima ora';

  @override
  String get searchUploadDateToday => 'Oggi';

  @override
  String get searchUploadDateWeek => 'Questa settimana';

  @override
  String get searchUploadDateMonth => 'Questo mese';

  @override
  String get searchUploadDateYear => 'Quest\'anno';

  @override
  String get searchDuration => 'Durata';

  @override
  String get searchDurationAny => 'Qualsiasi durata';

  @override
  String get searchDurationShort => 'Brevi (<4 minuti)';

  @override
  String get searchDurationLong => 'Lunghi (>20 minuti)';

  @override
  String get searchDurationMedium => 'Medi (4-20 minuti)';

  @override
  String get searchSortBy => 'Ordina per';

  @override
  String get searchSortRelevance => 'Rilevanza';

  @override
  String get searchSortRating => 'Voto';

  @override
  String get searchSortUploadDate => 'Data di caricamento';

  @override
  String get searchSortViewCount => 'Numero di visualizzazioni';

  @override
  String get clearSearchHistory => 'Elimina la cronologia';

  @override
  String get appLogs => 'Log dell\'applicazione';

  @override
  String get appLogsDescription =>
      'Recupera i log di quello che sta accadendo nell\'applicazione, può essere utile per segnalare un problema';

  @override
  String get copyToClipBoard => 'Copia negli appunti';

  @override
  String get logsCopied => 'Log copiati negli appunti';

  @override
  String get rememberSubtitleLanguage => 'Ricorda lingua sottotitoli';

  @override
  String get videoFilters => 'Filtri video';

  @override
  String nFilters(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString filtri',
      one: '1 filtro',
      zero: 'Nessun video',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'Nascondi o oscura video in tutta l\'applicazione a seconda delle regole di filtraggio definite sotto. Questo ti permette per esempio di nascondere spoiler di risultati sportivi o video brevi di un certo canale.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Definisci le regole per filtrare i video';

  @override
  String get videoFilterAllChannels => 'Tutti i canali';

  @override
  String get addVideoFilter => 'Crea filtro';

  @override
  String get editVideoFilter => 'Modifica filtro';

  @override
  String get videoFilterType => 'Tipo';

  @override
  String get videoFilterOperation => 'Operazione';

  @override
  String get videoFilterValue => 'Valore';

  @override
  String get save => 'Salva';

  @override
  String get videoFilterEditDescription =>
      'Select an optional channel, a filter type, operation and a value to filter OUT videos from lists. Example, type: video name, operation: contains, value: test will EXCLUDE all the videos with the word test in their name.';

  @override
  String get optional => 'opzionale';

  @override
  String get videoFilterHideLabel => 'Nascondi';

  @override
  String get videoFilterFilterLabel => 'Oscura';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter video dove $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered => 'Video filtered for the following reason(s):';

  @override
  String get videoFilterTapToReveal => 'Tocca per mostrare';

  @override
  String get videoFilterHide => 'Nascondi video filtrati';

  @override
  String get videoFilterHideDescription =>
      'Per impostazione predefinita i video filtrati non vengono nascosti ma mostrati come oscurati contestualmente alla motivazione per cui sono stati filtrati. Questa impostazione rimuove i video filtrati dalla liste.';

  @override
  String get videoFilterNoFilters =>
      'Nessun filtro video, tocca il pulsante + per iniziare ad aggiungere filtri.';

  @override
  String get videoFilterTypeVideoTitle => 'Titolo video';

  @override
  String get videoFilterTypeChannelName => 'Nome canale';

  @override
  String get videoFilterTypeVideoLength => 'Lunghezza video (secondi)';

  @override
  String get videoFilterOperationContains => 'Contiene';

  @override
  String get videoFilterOperationNotContain => 'Non contiene';

  @override
  String get videoFilterOperationLowerThan => 'Minore di';

  @override
  String get videoFilterOperationHigherThan => 'Maggiore di';

  @override
  String get channel => 'Canale';

  @override
  String get videoFilterHideAllFromChannel => 'Filtra tutti i video dal canale';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter tutti i video dal canale';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Imposta automaticamente i sottotitoli nell\'ultima lingua selezionata, se disponibile';

  @override
  String get lockFullScreenToLandscape =>
      'Blocca orientamento a schermo intero al rapporto d\'aspetto del video';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Locks the full screen orientation based on video format, landscape for wide video and portrait for portrait videos';

  @override
  String get fillFullscreen => 'Massimizza video per adattarsi allo schermo';

  @override
  String get fillFullscreenDescription =>
      'Adatta il video per riempire lo schermo intero in modalità panorama';

  @override
  String get rememberPlaybackSpeed => 'Ricorda velocità riproduzione';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Imposta automaticamente la velocità di riproduzione all\'ultima velocità selezionata';

  @override
  String get downloads => 'Download';

  @override
  String get download => 'Download';

  @override
  String get videoAlreadyDownloaded => 'Video già scaricato';

  @override
  String get noDownloadedVideos =>
      'Nessun video scaricato, sfogliare, premere a lungo su un video in un elenco o toccare il pulsante di download sulla schermata di un video per scaricarlo';

  @override
  String get downloadsPlayAll => 'Esegui tutto';

  @override
  String get videoDownloadStarted => 'Download video iniziato';

  @override
  String get videoFailedDownloadRetry =>
      'Download fallito, tocca per riprovare';

  @override
  String get videoDownloadAudioOnly => 'Solo audio';

  @override
  String get manageSubscriptions => 'Gestisci Iscrizioni';

  @override
  String get noSubscriptions =>
      'Nessuna iscrizione, guarda video e iscriviti a qualunque canale ti interessi.';

  @override
  String get youCanSubscribeAgainLater =>
      'Puoi iscriverti nuovamente a questo canale successivamente';

  @override
  String get unSubscribeQuestion => 'Disiscrivi ?';

  @override
  String get clearHistoryQuestion => 'Pulire cronologia ?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Questa operazione cancellerà la tua cronologia delle visualizzazioni del tuo account sull\'istanza di Invidious che usi. Questa operazione non può essere annullata.';

  @override
  String get noHistory =>
      'Nessuna cronologia video, guarda qualche video e compariranno qui';

  @override
  String get homeLayoutEditor =>
      'Modifica disposizione della Pagina principale';

  @override
  String get layoutEditorAddVideoSource => 'Aggiungi fonte video';

  @override
  String get layoutEditorExplanation =>
      'Puoi scegliere cosa mostrare nella schermata Pagina principale, puoi avere fino a 2 viste piccole con scorrimento orizzontale e una fonte principale.';

  @override
  String get home => 'Pagina principale';

  @override
  String get library => 'Raccolta';

  @override
  String get customizeAppLayout => 'Personalizza le sezioni dell\'app';

  @override
  String get customizeAppLayoutExplanation =>
      'Seleziona quali sezioni si desidera visualizzare nella barra di navigazione dell\'app principale. Fare clic sullicona di casa per selezionare quale schermata mostra quando lapplicazione inizia. È possibile riordinare le sezioni trascinandole intorno.';

  @override
  String get navigationBarStyle => 'Stile barra navigazione';

  @override
  String get navigationBarLabelAlwaysShowing => 'Mostra sempre etichetta';

  @override
  String get navigationBarLabelShowOnSelect =>
      'Etichetta mostrata sull\'elemento selezionato';

  @override
  String get navigationBarLabelNeverShow => 'Non mostrare mai etichetta';

  @override
  String get distractionFreeMode => 'Modalità senza distrazioni';

  @override
  String get distractionFreeModeDescription =>
      'Disabilita commenti del video e consigli';

  @override
  String get secondsShortForm => 'sec';

  @override
  String get videoFilterApplyDateToFilter => 'Filter videos on given times';

  @override
  String get videoFilterDayOfWeek => 'Select days to apply filters';

  @override
  String get videoFilterDayOfWeekDescription =>
      'You can selectively choose days of the week and time to which the filters apply to, for example, avoid sport events spoilers.';

  @override
  String get videoFilterStartTime => 'Tempo inizio';

  @override
  String get videoFilterEndTime => 'Tempo fine';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Applied on $selectedDays';
  }

  @override
  String get from => 'Da';

  @override
  String get to => 'A';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'From $from to $to';
  }

  @override
  String get notifications => 'Notifiche';

  @override
  String get notificationsDescription =>
      'Enable and review what you are notified about';

  @override
  String get enableNotificationDescriptions =>
      'Runs foreground service to check and notify you on the changes you are monitoring';

  @override
  String get subscriptionNotification => 'Notifiche iscrizione';

  @override
  String get subscriptionNotificationDescription =>
      'Get notified of new videos from your subscription feed if you are logged in to your current instance';

  @override
  String get subscriptionNotificationTitle =>
      'Nuovi video dalle tue iscrizioni';

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
  String get askToEnableBackgroundServiceTitle => 'Notifiche disattivate';

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
  String get deletePlaylistNotificationTitle => 'Eliminare notifica playlist ?';

  @override
  String get deletePlaylistNotificationContent =>
      'Non riceverai più notifiche da questa playlist.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Nuovi video da $channel';
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
    return 'Nuovi video nella playlist $playlist';
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
      'Controllando iscrizioni...';

  @override
  String get foregroundServiceUpdatingPlaylist => 'Controllando playlist...';

  @override
  String get foregroundServiceUpdatingChannels => 'Controllando canali...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Frequenza controllo nuovo video';

  @override
  String get notificationFrequencySettingsDescription =>
      'Quanto spesso l\'applicazione controllerà per nuovi video';

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
  String get subtitlesBackground => 'Sfondo sottotitoli';

  @override
  String get subtitlesBackgroundDescription =>
      'Aggiunge uno sfondo nero ai sottotitoli per renderli più leggibili';

  @override
  String get history => 'Cronologia';

  @override
  String get deArrowSettingDescription =>
      'Sostituisci titoli click bait e miniature';

  @override
  String get deArrowReplaceThumbnails => 'Sostituisci miniature';

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
  String get seeking => 'Cercando';

  @override
  String get skipStep => 'Salto avanti/indietro';

  @override
  String get skipStepDescription => 'Secondi da saltare avanti/indietro';

  @override
  String get exponentialSkip => 'Exponential skip forward/backward';

  @override
  String get exponentialSkipDescription =>
      'The more you skip forward, the bigger the step is.';

  @override
  String get fullscreenOnLandscape => 'Schermo pieno in orizzontale';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Switch to full screen when the device is rotated to landscape mode';

  @override
  String get enabled => 'Abilitato';

  @override
  String get submitFeedback => 'Invia feedback';

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
  String get channelSortByNewest => 'Più recente';

  @override
  String get channelSortByOldest => 'Meno recente';

  @override
  String get channelSortByPopular => 'Popolare';

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
