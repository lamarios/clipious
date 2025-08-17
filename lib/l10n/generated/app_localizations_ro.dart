// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get subscriptions => 'Abonamente';

  @override
  String get playlists => 'Playlisturi';

  @override
  String get popular => 'Populare';

  @override
  String get trending => 'Tendințe';

  @override
  String get noVideoInPlayList => 'Niciun videoclip în playlist';

  @override
  String get removeFromPlayList => 'Elimină din Playlist';

  @override
  String get deletePlayListQ => 'Șterge un playlist?';

  @override
  String get irreversibleAction => 'Această acțiune este ireversibilă';

  @override
  String get addPlayList => 'Adaugă playlist';

  @override
  String get playListName => 'Numele playlistului';

  @override
  String get playlistVisibility => 'Vizibilitate';

  @override
  String get publicPlaylist => 'Public';

  @override
  String get privatePlaylist => 'Privat';

  @override
  String get cancel => 'Anulează';

  @override
  String get add => 'Adaugă';

  @override
  String get unlistedPlaylist => 'Nelistate';

  @override
  String get info => 'Informații';

  @override
  String get videos => 'Videoclipuri';

  @override
  String get streams => 'Fluxuri';

  @override
  String get latestVideos => 'Ultimele videoclipuri';

  @override
  String get subscribed => 'Abonat';

  @override
  String get subscribe => 'Abonează-te';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'fără abonați',
        'other': '$count de abonați',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Trimite';

  @override
  String get shareYoutubeLink => 'Distribuie linkul YouTube';

  @override
  String get shareInvidiousLink => 'Distribuie link-ul Invidious';

  @override
  String get redirectInvidiousLink =>
      'Partajați linkul de redirecționare Invidious';

  @override
  String get shareLinkWithTimestamp => 'Adaugă timp de cod';

  @override
  String get ok => 'OK';

  @override
  String get noChannels => 'Nu există canale';

  @override
  String get noPlaylists => 'Nu există Playlisturi';

  @override
  String get channels => 'Canale';

  @override
  String get couldntLoadVideo => 'Nu s-a putut încărca videoclipul';

  @override
  String get comments => 'Comentarii';

  @override
  String get recommended => 'Recomandat';

  @override
  String get couldntFetchVideos =>
      'Nu s-au putut prelua videoclipuri. Atingeți pentru a încerca din nou.';

  @override
  String get wizardIntro =>
      'Selectați un server public sau adăugați unul propriu. (Poate fi modificat ulterior în setări)';

  @override
  String get startUsingClipious => 'Începeți să folosești Clipious';

  @override
  String get videoAddedToPlaylist => 'Videoclip adăugat în playlist';

  @override
  String get videoAddedToQueue => 'Videoclip adăugat la coadă';

  @override
  String get errorAddingVideoToPlaylist =>
      'Eroare la adăugarea videoclipului la playlist';

  @override
  String get itemlistErrorGeneric => 'Nu s-a putut prelua datele';

  @override
  String get itemListErrorInvalidScope =>
      'Nu ai permisiunea de a vedea, dacă te-ai logat folosind metoda token încearcă să te deconectezi și să intri din nou';

  @override
  String get selectPlaylist => 'Selectează playlist';

  @override
  String get createNewPlaylist => 'Creează un playlist nou';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString răspunsuri',
      one: '1 răspuns',
      zero: 'Niciun răspuns',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Încărcați mai mult';

  @override
  String get topSorting => 'Top';

  @override
  String get newSorting => 'Nou';

  @override
  String get streamIsLive => 'Live';

  @override
  String get sponsorSkipped => 'Sponsorul a sărit peste';

  @override
  String get selectBrowsingCountry => 'Selectați țara de navigare';

  @override
  String get showOnStart => 'Selectați ce să afișați când pornește aplicația';

  @override
  String get settings => 'Setări';

  @override
  String get browsing => 'Navigare';

  @override
  String get country => 'Țară';

  @override
  String get whenAppStartsShow => 'Când aplicația pornește, arată…';

  @override
  String get servers => 'Servere';

  @override
  String get manageServers => 'Gestionați serverele';

  @override
  String currentServer(String current) {
    return 'În prezent se utilizează $current';
  }

  @override
  String get useSponsorBlock => 'Utilizați SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'Săriți peste segmentele de sponsori trimise de comunitate';

  @override
  String get about => 'Despre';

  @override
  String get name => 'Nume';

  @override
  String get package => 'Pachet';

  @override
  String get version => 'Versiune';

  @override
  String get build => 'Construit';

  @override
  String get addServer => 'Adăugare server';

  @override
  String get useThisServer => 'Utilizați acest server';

  @override
  String get logIn => 'Conectează-te';

  @override
  String get delete => 'Șterge';

  @override
  String get invalidInvidiousServer => 'Server Invidious nevalid';

  @override
  String get yourServers => 'Serverele tale';

  @override
  String get loggedIn => 'Conectat';

  @override
  String get notLoggedIn => 'Nu ești conectat';

  @override
  String get addServerHelpText =>
      'Folosiți butonul + pentru a vă adăuga propriile servere sau apăsați pe un server public și adăugați-l.';

  @override
  String get publicServers => 'Servere publice';

  @override
  String get loadingPublicServer => 'Se încarcă servere publice';

  @override
  String get tapToAddServer => 'Atinge pentru a adăuga server la lista';

  @override
  String get publicServersError =>
      'Nu s-a putut prelua lista de servere publice. Apasă pentru a reîncerca.';

  @override
  String get appearance => 'Aspect';

  @override
  String get useDynamicTheme => 'Culori dinamice';

  @override
  String get useDynamicThemeDescription =>
      'Folosiți culorile Material You (disponibil numai pe Android 12+)';

  @override
  String get useDash => 'Folosești DASH';

  @override
  String get useDashDescription =>
      'Streamingul adaptiv DASH poate fi uneori problematic, iar YouTube îl poate limita.';

  @override
  String get videoPlayer => 'Video player';

  @override
  String get videoListed => 'Public';

  @override
  String get videoUnlisted => 'Nelistate';

  @override
  String get videoIsFamilyFriendly => 'Familie prietenoasă';

  @override
  String get tapToManage => 'Atingeți pentru a gestiona';

  @override
  String get authentication => 'Autentificare';

  @override
  String get tokenLogin => 'Autentificare cu token';

  @override
  String get tokenLoginDescription => 'Mod recomandat de autentificare';

  @override
  String get cookieLogin => 'Autentificare cu cookie';

  @override
  String get cookieLoginDescription =>
      'Utilizați această metodă dacă întâmpinați probleme cu autentificarea cu simbol';

  @override
  String get logout => 'Deconectează-te';

  @override
  String get username => 'Nume de utilizator';

  @override
  String get password => 'Parolă';

  @override
  String get wrongUsernamePassword => 'Nume de utilizator sau parolă greșită';

  @override
  String get error => 'Eroare';

  @override
  String get malformedStatsEndpoint =>
      '/api/v1/stats nu este așa cum se aștepta';

  @override
  String get malformedStatsEndpointDescription =>
      'Serverul stats endpoint nu a răspuns un payload așteptat, cheia \"software.name” ar trebui să fie egală cu \"invidious”.\nRăspuns de la server:';

  @override
  String get serverIsNotReachable => 'Serverul nu este accesibil';

  @override
  String get videoQueue => 'Coadă video';

  @override
  String get addToQueueList => 'Adaugă la coadă';

  @override
  String get addToPlaylist => 'Adaugă la playlist';

  @override
  String get playNext => 'Redă următorul';

  @override
  String get playNextAddedToQueue => 'Video va rula în continuare';

  @override
  String get addRecommendedToQueue =>
      'Redare automată recomandată în continuare';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Selectați ce tip de segmente să omiteți';

  @override
  String get sponsorBlockCategorySponsor => 'Sponsor';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Promoție plătită, recomandări plătite și reclame directe. Nu pentru auto-promovare sau strigături gratuite către cauze/creatori/site-uri web/produse care le plac.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => 'Neplătită/Autopromovare';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Similar cu „sponsor”, cu excepția promovării neplătite sau autopromovate. Aceasta include secțiuni despre mărfuri, donații sau informații despre cine a colaborat ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Memento de interacțiune (Abonare)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Când există un scurt memento pentru a vă place, abonați-vă sau urmați-le în mijlocul conținutului. Dacă este lung sau despre ceva specific, ar trebui să fie sub promovare de sine în loc.';

  @override
  String get sponsorBlockCategoryIntro => 'Animație de pauză/Intro';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Un interval fără conținut real. Ar putea fi o pauză, un cadru static, o animație care se repetă. Aceasta nu ar trebui folosită pentru tranzițiile care conțin informații.';

  @override
  String get sponsorBlockCategoryOutro => 'Carduri finale/Credite';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Credite sau când apar cardurile de final YouTube. Nu pentru concluzii cu informații.';

  @override
  String get sponsorBlockCategoryPreview => 'Previzualizare/Recapitulare';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Colecție de clipuri care arată ce se întâmplă în acest videoclip sau în alte videoclipuri dintr-o serie în care toate informațiile sunt repetate mai târziu în videoclip.';

  @override
  String get sponsorBlockCategoryFiller => 'Tangenta de umplere/Glume';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Scene tangențiale adăugate numai pentru umplutură sau umor care nu sunt necesare pentru a înțelege conținutul principal al videoclipului. Aceasta nu ar trebui să includă segmente care furnizează detalii contextuale sau de fond. Aceasta este o categorie foarte agresivă destinată atunci când nu sunteți în starea de spirit pentru \"distracție\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic =>
      'Muzică: Secțiunea non-muzică';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Numai pentru utilizare în videoclipuri muzicale. Acest lucru ar trebui folosit numai pentru secțiuni de videoclipuri muzicale care nu sunt deja acoperite de altă categorie.';

  @override
  String get useProxy => 'Videoclipuri Proxy';

  @override
  String get useProxyDescription =>
      'Prin proxy fluxurile video de pe server, puteți ocoli blocările regionale sau blocarea ISP-ului YouTube';

  @override
  String get pressDownToShowSettings => 'Apasă în jos pentru a afișa setările';

  @override
  String get quality => 'Calitate';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Subtitrări';

  @override
  String get playbackSpeed => 'Viteza de redare';

  @override
  String get blackBackground => 'Fundal negru';

  @override
  String get blackBackgroundDescription =>
      'Pentru tema întunecată pe ecranul OLED';

  @override
  String get search => 'Căutare';

  @override
  String get subtitleFontSize => 'Dimensiunea fontului subtitrărilor';

  @override
  String get subtitleFontSizeDescription =>
      'Schimbați dimensiunea subtitrarilor dacă este prea mică sau prea mare pe dispozitiv';

  @override
  String get skipSslVerification => 'Omiteți verificarea certificatului SSL';

  @override
  String get skipSslVerificationDescription =>
      'Pentru utilizarea unui certificat SSL autosemnat sau când aveți probleme legate de SSL cu serverul dvs.';

  @override
  String get themeBrightness => 'Temă';

  @override
  String get themeLight => 'Luminos';

  @override
  String get themeDark => 'Întunecat';

  @override
  String get followSystem => 'Urmărește sistemul';

  @override
  String get requiresRestart => 'Necesită repornirea aplicației';

  @override
  String get appLanguage => 'Limba aplicației';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString videoclipuri',
      one: '1 videoclip',
      zero: 'Niciun videoclip',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Adresa URL trebuie să înceapă cu http:// sau https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Afișează displacerile estimate ale videoclipurilor utilizând API furnizat de returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'URL personalizat pentru instanța RYD';

  @override
  String get rydCustomInstanceDescription =>
      'Utilizați o altă instanță RYD, lăsați necompletat pentru a utiliza valoarea implicită';

  @override
  String get autoplayVideoOnLoad =>
      'Redarea automată a videoclipului la încărcare';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Începe redarea automată a videoclipului după ce s-a încărcat';

  @override
  String get searchHistory => 'Istoric de căutare';

  @override
  String get searchHistoryDescription => 'Setări pentru istoricul căutărilor';

  @override
  String get enableSearchHistory => 'Activați istoricul căutărilor';

  @override
  String get searchHistoryLimit => 'Limita istoricului căutărilor';

  @override
  String get searchHistoryLimitDescription =>
      'Setați câte căutări anterioare vor apărea în sugestii';

  @override
  String get shorts => 'Shorts';

  @override
  String get searchUploadDate => 'Data de încărcare';

  @override
  String get searchUploadDateAny => 'Orice dată';

  @override
  String get searchUploadDateHour => 'Ultima oră';

  @override
  String get searchUploadDateToday => 'Astăzi';

  @override
  String get searchUploadDateWeek => 'Săptămâna aceasta';

  @override
  String get searchUploadDateMonth => 'Luna aceasta';

  @override
  String get searchUploadDateYear => 'Anul acesta';

  @override
  String get searchDuration => 'Durată';

  @override
  String get searchDurationAny => 'Orice durată';

  @override
  String get searchDurationShort => 'Scurt (<4 minute)';

  @override
  String get searchDurationLong => 'Lung (>20 minute)';

  @override
  String get searchDurationMedium => 'Mediu (4-20 minute)';

  @override
  String get searchSortBy => 'Sortează după';

  @override
  String get searchSortRelevance => 'Relevanţă';

  @override
  String get searchSortRating => 'Evaluare';

  @override
  String get searchSortUploadDate => 'Data încărcării';

  @override
  String get searchSortViewCount => 'Număr de vizualizări';

  @override
  String get clearSearchHistory => 'Șterge istoricul căutărilor';

  @override
  String get appLogs => 'Jurnalele aplicației';

  @override
  String get appLogsDescription =>
      'Obține jurnale cu ceea ce se întâmplă în aplicație, pot fi utile pentru raportarea problemelor';

  @override
  String get copyToClipBoard => 'Copiază în clipboard';

  @override
  String get logsCopied => 'Jurnalele copiate în clipboard';

  @override
  String get rememberSubtitleLanguage => 'Reține limba subtitrărilor';

  @override
  String get videoFilters => 'Filtre video';

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
      'Ascundeți sau obscurizează videoclipurile din toate fluxurile video din aplicație pe baza filtrelor definite mai jos. Acest lucru îți permite, de exemplu, să ascunzi spoilerele sportive sau să ascunzi clipurile scurte de la un anumit canal.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Definește reguli pentru filtrarea videoclipurilor';

  @override
  String get videoFilterAllChannels => 'Toate canalele';

  @override
  String get addVideoFilter => 'Creează filtru';

  @override
  String get editVideoFilter => 'Editează filtrul';

  @override
  String get videoFilterType => 'Tip';

  @override
  String get videoFilterOperation => 'Operațiune';

  @override
  String get videoFilterValue => 'Valoare';

  @override
  String get save => 'Salvează';

  @override
  String get videoFilterEditDescription =>
      'Selectați un canal opțional, un tip de filtru, o operațiune și o valoare pentru a filtra videoclipurile OUT din liste. Exemplu, tastați: numele videoclipului, operațiunea: conține, valoare: testul va EXCLUDE toate videoclipurile cu cuvântul „test” în numele lor.';

  @override
  String get optional => 'opțional';

  @override
  String get videoFilterHideLabel => 'Ascunde';

  @override
  String get videoFilterFilterLabel => 'Obfuscate';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter videoclipuri în care $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered =>
      'Videoclipul a fost filtrat din următoarele motive:';

  @override
  String get videoFilterTapToReveal => 'Atingeți pentru a dezvălui';

  @override
  String get videoFilterHide => 'Ascundeți videoclipurile filtrate';

  @override
  String get videoFilterHideDescription =>
      'În mod prestabilit, videoclipurile filtrate nu sunt ascunse, ci afișate ca fiind obscucate cu motivul (motivele) pentru care au fost filtrate. Această setare elimină videoclipurile filtrate din liste.';

  @override
  String get videoFilterNoFilters =>
      'Fără filtre video, atingeți butonul + de mai jos pentru a începe să adăugați filtre.';

  @override
  String get videoFilterTypeVideoTitle => 'Titlul videoclipului';

  @override
  String get videoFilterTypeChannelName => 'Numele canalului';

  @override
  String get videoFilterTypeVideoLength => 'Durata videoclipului (secunde)';

  @override
  String get videoFilterOperationContains => 'Conține';

  @override
  String get videoFilterOperationNotContain => 'Nu conține';

  @override
  String get videoFilterOperationLowerThan => 'Mai mică decât';

  @override
  String get videoFilterOperationHigherThan => 'Mai mare decât';

  @override
  String get channel => 'Canal';

  @override
  String get videoFilterHideAllFromChannel =>
      'Filtrați toate videoclipurile din canal';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter toate videoclipurile de pe canal';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Setați automat subtitrările în ultima limbă selectată, dacă este disponibilă';

  @override
  String get lockFullScreenToLandscape =>
      'Blocați orientarea pe întregul ecran în raport cu aspectul video';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Blochează orientarea ecranului complet pe baza formatului video, peisaj pentru video lat și portret pentru videoclipuri portret';

  @override
  String get fillFullscreen =>
      'Maximizați videoclipul pentru a se potrivi cu ecranul';

  @override
  String get fillFullscreenDescription =>
      'Reglează videoclipul pentru a umple întregul ecran în modul peisaj';

  @override
  String get rememberPlaybackSpeed => 'Reținere viteza de redare';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Setați automat viteza de redare la ultima viteză selectată';

  @override
  String get downloads => 'Descărcări';

  @override
  String get download => 'Descarcă';

  @override
  String get videoAlreadyDownloaded => 'Video deja descărcat';

  @override
  String get noDownloadedVideos =>
      'Fără videoclipuri descărcate, caută, ține apăsat pe un videoclip dintr-o listă sau apasă butonul de descărcare de pe ecranul videoclipului pentru a descărca';

  @override
  String get downloadsPlayAll => 'Redă toate';

  @override
  String get videoDownloadStarted => 'Descărcarea video a început';

  @override
  String get videoFailedDownloadRetry =>
      'Descărcarea eșuată, atingeți pentru a reîncerca';

  @override
  String get videoDownloadAudioOnly => 'Doar audio';

  @override
  String get manageSubscriptions => 'Gestionează abonamentele';

  @override
  String get noSubscriptions =>
      'Fără abonamente, caută videoclipuri și abonează-te la orice canal îți place.';

  @override
  String get youCanSubscribeAgainLater =>
      'Te poți abona la acest canal mai târziu';

  @override
  String get unSubscribeQuestion => 'Dezabonezi?';

  @override
  String get clearHistoryQuestion => 'Ștergeți istoricul?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Aceasta va șterge istoricul vizionărilor din contul tău pe instanța Invidious pe care o folosești. Acest lucru nu poate fi anulat.';

  @override
  String get noHistory =>
      'Fără istoric de vizionare, vizionează câteva videoclipuri și acesta va apărea aici';

  @override
  String get homeLayoutEditor => 'Editează aspectul paginii de start';

  @override
  String get layoutEditorAddVideoSource => 'Adaugă sursa video';

  @override
  String get layoutEditorExplanation =>
      'Poți decide ce să afișezi pe ecranul de start, poți avea până la 2 vizualizări mici cu derulare orizontală și o sursă mare.';

  @override
  String get home => 'Acasă';

  @override
  String get library => 'Bibliotecă';

  @override
  String get customizeAppLayout => 'Personalizează secțiunile aplicației';

  @override
  String get customizeAppLayoutExplanation =>
      'Selectează secțiunile pe care dorești să le afișezi în bara principală de navigare a aplicației. Fă clic pe pictograma de pornire pentru a selecta ecranul care se afișează la pornirea aplicației. Poți reordona secțiunile trăgându-le.';

  @override
  String get navigationBarStyle => 'Stilul barei de navigare';

  @override
  String get navigationBarLabelAlwaysShowing => 'Etichetă afișată întotdeauna';

  @override
  String get navigationBarLabelShowOnSelect =>
      'Etichetă afișată pe articolul selectat';

  @override
  String get navigationBarLabelNeverShow => 'Nu afișa niciodată eticheta';

  @override
  String get distractionFreeMode => 'Mod fără distrageri';

  @override
  String get distractionFreeModeDescription =>
      'Dezactivează comentariile și recomandările video';

  @override
  String get secondsShortForm => 'sec';

  @override
  String get videoFilterApplyDateToFilter =>
      'Filtrează videoclipurile după anumite intervale de timp';

  @override
  String get videoFilterDayOfWeek =>
      'Selectează zilele pentru a aplica filtrele';

  @override
  String get videoFilterDayOfWeekDescription =>
      'Poți alege în selectiv zilele săptămânii și ora la care se aplică filtrele, de exemplu, pentru a evita spoilerele evenimentelor sportive.';

  @override
  String get videoFilterStartTime => 'Începutul timpului';

  @override
  String get videoFilterEndTime => 'Sfârșitul timpului';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Aplicat în $selectedDays';
  }

  @override
  String get from => 'De la';

  @override
  String get to => 'La';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'De la $from la $to';
  }

  @override
  String get notifications => 'Notificării';

  @override
  String get notificationsDescription =>
      'Activează și verifică despre ce ești notificat';

  @override
  String get enableNotificationDescriptions =>
      'Rulează serviciul în fundal pentru a verifica și a te notifica cu privire la modificările pe care le monitorizezi';

  @override
  String get subscriptionNotification => 'Notificările prin abonamente';

  @override
  String get subscriptionNotificationDescription =>
      'Primește notificări despre videoclipurile noi din fluxul abonamentului tău dacă ești conectat la instanța ta actuală';

  @override
  String get subscriptionNotificationTitle =>
      'Videoclipuri noi din abonamentele tale';

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
    return 'Există  $_temp0 în fluxul abonamentului tău';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Dezactivarea optimizării bateriei necesară';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'Pentru a trimite notificări, Clipious trebuie să ruleze un serviciu în fundal. Pentru ca acesta să funcționeze fără probleme, este necesar ca Clipious să aibă acces nerestricționat la baterie. Apăsând pe OK se vor deschide setările de optimizare a bateriei.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Notificări dezactivate';

  @override
  String get askToEnableBackgroundServiceContent =>
      'Pentru a primi notificări, trebuie să activezi notificările Clipious, apasă OK pentru a le activa.';

  @override
  String get otherNotifications =>
      'Alte surse de notificări (icoane în formă de clopoțel)';

  @override
  String get deleteChannelNotificationTitle => 'Ștergi notificarea canalului?';

  @override
  String get deleteChannelNotificationContent =>
      'Nu vei mai primi notificări de la acest canal.';

  @override
  String get deletePlaylistNotificationTitle =>
      'Ștergi notificarea listei de redare?';

  @override
  String get deletePlaylistNotificationContent =>
      'Nu vei mai primi notificări de la această listă de redare.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Videoclipuri noi de la $channel';
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
    return 'Există $_temp0 de la $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'Videoclipuri noi în lista de redare $playlist';
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
    return 'Există $_temp0 în lista de redare $playlist';
  }

  @override
  String get foregroundServiceNotificationTitle => 'Monitorizare video';

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
    return 'Va verifica pentru videoclipuri noi o dată la $_temp0';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'Se verifică abonamentele...';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'Se verifică listele de redare...';

  @override
  String get foregroundServiceUpdatingChannels => 'Se verifică canalele...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Noua frecvență de verificare video';

  @override
  String get notificationFrequencySettingsDescription =>
      'Cât de des va verifica aplicația dacă există videoclipuri noi';

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
  String get subtitlesBackground => 'Fundalul subtitrărilor';

  @override
  String get subtitlesBackgroundDescription =>
      'Adaugă un fundal negru subtitrărilor pentru a le face mai ușor de citit';

  @override
  String get history => 'Istoric';

  @override
  String get deArrowSettingDescription =>
      'Înlocuiește titlurile și miniaturile clickbait';

  @override
  String get deArrowReplaceThumbnails => 'Înlocuiește miniaturile';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Înlocuiește miniaturile videoclipurilor în plus față de titluri';

  @override
  String get deArrowWarning =>
      'Activarea DeArrow poate reduce semnificativ viteza de navigare a aplicației, întrucât sunt necesare cereri http suplimentare pentru fiecare videoclip în parte';

  @override
  String get copySettingsAsJson => 'Copiază setările ca JSON în clipboard';

  @override
  String get copySettingsAsJsonDescription =>
      'Copiază setările ca JSON pentru a ajuta la depanare dacă întâmpini o problemă cu aplicația și decizi să raportezi o problemă';

  @override
  String get seeking => 'În căutare';

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
