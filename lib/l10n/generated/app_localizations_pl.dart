// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get subscriptions => 'Subskrypcje';

  @override
  String get playlists => 'Playlisty';

  @override
  String get popular => 'Popularne';

  @override
  String get trending => 'Na czasie';

  @override
  String get noVideoInPlayList => 'Brak filmów w playliście';

  @override
  String get removeFromPlayList => 'Usuń z playlisty';

  @override
  String get deletePlayListQ => 'Usunąć playlistę?';

  @override
  String get irreversibleAction => 'Ta akcja jest nieodwracalna';

  @override
  String get addPlayList => 'Dodaj playlistę';

  @override
  String get playListName => 'Nazwa playlisty';

  @override
  String get playlistVisibility => 'Widoczność';

  @override
  String get publicPlaylist => 'Publiczna';

  @override
  String get privatePlaylist => 'Prywatna';

  @override
  String get cancel => 'Anuluj';

  @override
  String get add => 'Dodaj';

  @override
  String get unlistedPlaylist => 'Niewidoczna';

  @override
  String get info => 'Info';

  @override
  String get videos => 'Filmy';

  @override
  String get streams => 'Transmisje na żywo';

  @override
  String get latestVideos => 'Najnowsze filmy';

  @override
  String get subscribed => 'Subskrybujesz';

  @override
  String get subscribe => 'Subskrybuj';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Brak subskrybentów',
        'other': '$count subskrybentów',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Udostępnij';

  @override
  String get shareYoutubeLink => 'Udostępnij link YouTube';

  @override
  String get shareInvidiousLink => 'Udostępnij link Invidious';

  @override
  String get redirectInvidiousLink =>
      'Udostępnij przekierowujący link Invidious';

  @override
  String get shareLinkWithTimestamp => 'Uwzględnij timestamp';

  @override
  String get ok => 'OK';

  @override
  String get noChannels => 'Brak kanałów';

  @override
  String get noPlaylists => 'Brak playlist';

  @override
  String get channels => 'Kanały';

  @override
  String get couldntLoadVideo => 'Nie można załadować filmu';

  @override
  String get comments => 'Komentarze';

  @override
  String get recommended => 'Polecane';

  @override
  String get couldntFetchVideos =>
      'Nie można wczytać filmów. Stuknij, aby spróbować ponownie.';

  @override
  String get wizardIntro =>
      'Wybierz serwer publiczny lub dodaj własny. (Możesz to zmienić później w ustawieniach)';

  @override
  String get startUsingClipious => 'Zacznij używać Clipious';

  @override
  String get videoAddedToPlaylist => 'Film dodany do playlisty';

  @override
  String get videoAddedToQueue => 'Film dodany do kolejki odtwarzania';

  @override
  String get errorAddingVideoToPlaylist =>
      'Błąd podczas dodawania filmu do playlisty';

  @override
  String get itemlistErrorGeneric => 'Nie można wczytać danych';

  @override
  String get itemListErrorInvalidScope =>
      'Nie masz uprawnień, aby to zobaczyć. Jeśli zalogowałeś się przy użyciu metody tokenu, spróbuj się wylogować i zalogować ponownie';

  @override
  String get selectPlaylist => 'Wybierz playlistę';

  @override
  String get createNewPlaylist => 'Stwórz nową playlistę';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString odpowiedzi',
      one: '1 odpowiedź',
      zero: 'Brak odpowiedzi',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Załaduj więcej';

  @override
  String get topSorting => 'Top';

  @override
  String get newSorting => 'Nowe';

  @override
  String get streamIsLive => 'Na żywo';

  @override
  String get sponsorSkipped => 'Sponsor pominięty';

  @override
  String get selectBrowsingCountry => 'Wybierz kraj przeglądania';

  @override
  String get showOnStart =>
      'Wybierz, co ma być wyświetlane po uruchomieniu aplikacji';

  @override
  String get settings => 'Ustawienia';

  @override
  String get browsing => 'Przeglądanie';

  @override
  String get country => 'Kraj';

  @override
  String get whenAppStartsShow => 'Po uruchomieniu aplikacji pokaż…';

  @override
  String get servers => 'Serwery';

  @override
  String get manageServers => 'Zarządzaj serwerami';

  @override
  String currentServer(String current) {
    return 'Obecnie używasz $current';
  }

  @override
  String get useSponsorBlock => 'Używaj SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'Pomiń segmenty sponsorowane, zgłoszone przez społeczność';

  @override
  String get about => 'Informacje';

  @override
  String get name => 'Nazwa';

  @override
  String get package => 'Package';

  @override
  String get version => 'Wersja';

  @override
  String get build => 'Build';

  @override
  String get addServer => 'Dodaj serwer';

  @override
  String get useThisServer => 'Użyj tego serwera';

  @override
  String get logIn => 'Zaloguj się';

  @override
  String get delete => 'Usuń';

  @override
  String get invalidInvidiousServer => 'Niepoprawny serwer Invidious';

  @override
  String get yourServers => 'Twoje serwery';

  @override
  String get loggedIn => 'Zalogowano';

  @override
  String get notLoggedIn => 'Wylogowano';

  @override
  String get addServerHelpText =>
      'Użyj przycisku +, aby dodać własne serwery lub stuknij na serwer publiczny i dodaj go.';

  @override
  String get publicServers => 'Serwery publiczne';

  @override
  String get loadingPublicServer => 'Wczytywanie publicznych serwerów';

  @override
  String get tapToAddServer => 'Stuknij, aby dodać serwer do twojej listy';

  @override
  String get publicServersError =>
      'Nie można załadować listy publicznych serwerów. Stuknij, aby ponowić próbę.';

  @override
  String get appearance => 'Wygląd';

  @override
  String get useDynamicTheme => 'Dynamiczne kolory';

  @override
  String get useDynamicThemeDescription =>
      'Użyj kolorów Material You (Tylko na Android 12+)';

  @override
  String get useDash => 'Użyj DASH';

  @override
  String get useDashDescription =>
      'Strumieniowanie adaptacyjne DASH może być czasami problematyczne, Youtube może je dławić.';

  @override
  String get videoPlayer => 'Odtwarzacz wideo';

  @override
  String get videoListed => 'Publiczny';

  @override
  String get videoUnlisted => 'Niewidoczny';

  @override
  String get videoIsFamilyFriendly => 'Przyjazny dla rodziny';

  @override
  String get tapToManage => 'Stuknij, aby zarządzać';

  @override
  String get authentication => 'Uwierzytelnianie';

  @override
  String get tokenLogin => 'Zaloguj się za pomocą tokenu';

  @override
  String get tokenLoginDescription => 'Zalecany sposób logowania';

  @override
  String get cookieLogin => 'Zaloguj się za pomocą pliku cookie';

  @override
  String get cookieLoginDescription =>
      'Użyj tej metody, jeśli napotkasz problemy z uwierzytelnianiem za pomocą tokenu';

  @override
  String get logout => 'Wyloguj się';

  @override
  String get username => 'Nazwa użytkownika';

  @override
  String get password => 'Hasło';

  @override
  String get wrongUsernamePassword =>
      'Nieprawidłowa nazwa użytkownika lub hasło';

  @override
  String get error => 'Błąd';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats jest niespodziewane';

  @override
  String get malformedStatsEndpointDescription =>
      'The server stats endpoint did not respond an expected payload, the key \"software.name\" should be equal to \"invidious\".\nResponse from the server:';

  @override
  String get serverIsNotReachable => 'Serwer jest niedostępny';

  @override
  String get videoQueue => 'Kolejka odtwarzania fimów';

  @override
  String get addToQueueList => 'Dodaj do kolejki odtwarzania';

  @override
  String get addToPlaylist => 'Dodaj do playlisty';

  @override
  String get playNext => 'Odtwórz następne';

  @override
  String get playNextAddedToQueue => 'Film zostanie odtworzony jako następny';

  @override
  String get addRecommendedToQueue =>
      'Automatycznie odtwarzaj listę polecanych';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Wybierz który typ segmentów pomijać';

  @override
  String get sponsorBlockCategorySponsor => 'Sponsorowane';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Płatna promocja, płatne polecenia i bezpośrednie reklamy. Nie dla autopromocji lub darmowego promowania spraw/twórców/stron internetowych/produktów, które lubią.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => 'Niepłatne/autopromocja';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Podobne do \"sponsora\", z wyjątkiem bezpłatnej lub własnej promocji. Obejmuje to sekcje dotyczące produktów (merch), dotacji lub informacji o tym, z kim współpracowali ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Przypomnienie o interakcji (subskrypcja)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Gdy w środku treści znajduje się krótkie przypomnienie o polubieniu, zasubskrybowaniu lub obserwowaniu. Jeśli jest długa lub dotyczy czegoś konkretnego, powinna zamiast tego znajdować się pod autopromocją.';

  @override
  String get sponsorBlockCategoryIntro => 'Przerwa/animacja wejściowa';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Przerwa bez rzeczywistej zawartości. Może to być pauza, statyczna klatka, powtarzająca się animacja. Nie powinno być to używane do przejść zawierających informacje.';

  @override
  String get sponsorBlockCategoryOutro => 'Napisy/karty końcowe';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Uznania lub gdy pojawią się karty końcowe YouTube. Nie dla wniosków z informacjami.';

  @override
  String get sponsorBlockCategoryPreview => 'Podgląd/Podsumowanie';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Zbiór klipów, które pokazują co pojawi się w tym filmie lub innych filmach z serii, w których wszystkie informacje są powtarzane w dalszej części filmu.';

  @override
  String get sponsorBlockCategoryFiller => 'Wypełniacz/żart';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Sceny styczne dodane wyłącznie w celu wypełnienia lub dodania humoru, które nie są wymagane do zrozumienia głównej treści filmu. Nie powinno to obejmować segmentów zapewniających kontekst lub szczegóły. Jest to bardzo agresywna kategoria przeznaczona dla osób, które nie są w nastroju do \"zabawy\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic =>
      'Muzyka: Sekcja nie zawierająca muzyki';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Tylko do użytku w teledyskach. Ta kategoria powinna być używana tylko w sekcjach teledysków, które nie są jeszcze objęte inną kategorią.';

  @override
  String get useProxy => 'Filmy przez proxy';

  @override
  String get useProxyDescription =>
      'Poprzez użycie proxy do streamowania filmu z serwera można ominąć blokady regionalne lub blokady YouTube przez dostawców usług internetowych';

  @override
  String get pressDownToShowSettings =>
      'Naciśnij przycisk w dół, aby wyświetlić ustawienia';

  @override
  String get quality => 'Jakość';

  @override
  String get audio => 'Dźwięk';

  @override
  String get subtitles => 'Napisy';

  @override
  String get playbackSpeed => 'Prędkość odtwarzania';

  @override
  String get blackBackground => 'Czarne tło';

  @override
  String get blackBackgroundDescription => 'Dla trybu ciemnego na ekranie OLED';

  @override
  String get search => 'Wyszukaj';

  @override
  String get subtitleFontSize => 'Rozmiar czcionki napisów';

  @override
  String get subtitleFontSizeDescription =>
      'Zmień rozmiar napisów, jeśli są zbyt małe lub zbyt duże na Twoim urządzeniu';

  @override
  String get skipSslVerification => 'Pomiń weryfikację certyfikatu SSL';

  @override
  String get skipSslVerificationDescription =>
      'W przypadku korzystania z własnego certyfikatu SSL lub w przypadku problemów związanych z SSL na serwerze.';

  @override
  String get themeBrightness => 'Motyw';

  @override
  String get themeLight => 'Jasny';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get followSystem => 'Użyj ustawień systemu';

  @override
  String get requiresRestart => 'Wymaga uruchomienia ponownie aplikacji';

  @override
  String get appLanguage => 'Język aplikacji';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString filmów',
      one: '1 film',
      zero: 'Brak filmów',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Adres URL musi się zaczynać z http:// lub https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Wyświetl szacunkową liczbę polubień filmu przy użyciu API dostarczonego przez returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'Custom RYD instance url';

  @override
  String get rydCustomInstanceDescription =>
      'Użyj innej instancji RYD, pozostaw puste aby użyć domyślnej';

  @override
  String get autoplayVideoOnLoad =>
      'Automatycznie odtwarzaj film po załadowaniu';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Automatycznie odtwarzaj film po jego załadowaniu';

  @override
  String get searchHistory => 'Historia wyszukiwania';

  @override
  String get searchHistoryDescription => 'Ustawienia historii wyszukiwania';

  @override
  String get enableSearchHistory => 'Włącz historię wyszukiwania';

  @override
  String get searchHistoryLimit => 'Limit historii wyszukiwania';

  @override
  String get searchHistoryLimitDescription =>
      'Ustaw liczbę poprzednich wyszukiwań, które będą wyświetlane w sugestiach';

  @override
  String get shorts => 'Shorts';

  @override
  String get searchUploadDate => 'Data publikacji';

  @override
  String get searchUploadDateAny => 'Dowolna data';

  @override
  String get searchUploadDateHour => 'Ostatnia godzina';

  @override
  String get searchUploadDateToday => 'Dzisiaj';

  @override
  String get searchUploadDateWeek => 'Ten tydzień';

  @override
  String get searchUploadDateMonth => 'Ten miesiąc';

  @override
  String get searchUploadDateYear => 'Ten rok';

  @override
  String get searchDuration => 'Długość';

  @override
  String get searchDurationAny => 'Dowolna długość';

  @override
  String get searchDurationShort => 'Krótkie (<4 minuty)';

  @override
  String get searchDurationLong => 'Długie (>20 minut)';

  @override
  String get searchDurationMedium => 'Średnie (4-20 minut)';

  @override
  String get searchSortBy => 'Sortuj';

  @override
  String get searchSortRelevance => 'Trafność';

  @override
  String get searchSortRating => 'Oceny';

  @override
  String get searchSortUploadDate => 'Data przesłania';

  @override
  String get searchSortViewCount => 'Liczba wyświetleń';

  @override
  String get clearSearchHistory => 'Wyczyść historię wyszukiwania';

  @override
  String get appLogs => 'Logi aplikacji';

  @override
  String get appLogsDescription =>
      'Uzyskanie logów tego, co dzieje się w aplikacji. Może być przydatne do zgłaszania problemów';

  @override
  String get copyToClipBoard => 'Kopiuj do schowka';

  @override
  String get logsCopied => 'Logi skopiowane do schowka';

  @override
  String get rememberSubtitleLanguage => 'Zapamiętaj język napisów';

  @override
  String get videoFilters => 'Filtry filmów';

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
      'Ukryj lub zasłoń filmy ze wszystkich kanałów wideo w aplikacji w oparciu o filtry zdefiniowane poniżej. Pozwala to na przykład ukryć spoilery sportowe lub ukryć krótkie filmy z określonego kanału.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Zdefiniuj reguły filtrowania filmów';

  @override
  String get videoFilterAllChannels => 'Wszystkie kanały';

  @override
  String get addVideoFilter => 'Utwórz filtr';

  @override
  String get editVideoFilter => 'Edytuj filtr';

  @override
  String get videoFilterType => 'Rodzaj';

  @override
  String get videoFilterOperation => 'Działanie';

  @override
  String get videoFilterValue => 'Wartość';

  @override
  String get save => 'Zapisz';

  @override
  String get videoFilterEditDescription =>
      'Wybierz opcjonalny kanał, typ filtra, operację i wartość, aby ODFILTROWAĆ filmy z list. Przykład: typ: nazwa wideo, operacja: zawiera, wartość: test spowoduje WYKLUCZENIE wszystkich filmów ze słowem \"test\" w nazwie.';

  @override
  String get optional => 'opcjonalne';

  @override
  String get videoFilterHideLabel => 'Ukryj';

  @override
  String get videoFilterFilterLabel => 'Zasłoń';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter filmy gdzie $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered => 'Film odfiltrowany z następujących powodów:';

  @override
  String get videoFilterTapToReveal => 'Stuknij, aby odkryć';

  @override
  String get videoFilterHide => 'Ukryj filtrowane filmy';

  @override
  String get videoFilterHideDescription =>
      'Domyślnie odfiltrowane filmy nie są ukrywane, ale wyświetlane jako zasłonięte z powodami, dla których zostały odfiltrowane. To ustawienie usuwa odfiltrowane filmy z list.';

  @override
  String get videoFilterNoFilters =>
      'Brak filtrów wideo, stuknij przycisk \"+\" poniżej, aby rozpocząć dodawanie filtrów.';

  @override
  String get videoFilterTypeVideoTitle => 'Tytuł filmu';

  @override
  String get videoFilterTypeChannelName => 'Nazwa kanału';

  @override
  String get videoFilterTypeVideoLength => 'Długość wideo (w sekundach)';

  @override
  String get videoFilterOperationContains => 'Zawiera';

  @override
  String get videoFilterOperationNotContain => 'Nie zawiera';

  @override
  String get videoFilterOperationLowerThan => 'Mniejsze od';

  @override
  String get videoFilterOperationHigherThan => 'Większe od';

  @override
  String get channel => 'Kanał';

  @override
  String get videoFilterHideAllFromChannel =>
      'Filtrowanie wszystkich filmów z kanału';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter wszystkie filmy z kanału';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Automatycznie ustaw napisy na ostatnio wybrany język, jeśli jest dostępny';

  @override
  String get lockFullScreenToLandscape =>
      'Zablokowanie orientacji pełnoekranowej do proporcji wideo';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Blokuje orientację pełnoekranową w oparciu o format wideo, poziomy dla szerokich filmów i pionowy dla filmów pionowych';

  @override
  String get fillFullscreen => 'Powiększ film aby zapełnił ekran';

  @override
  String get fillFullscreenDescription =>
      'Dostosowuje wideo tak, aby wypełniało cały ekran w trybie poziomym';

  @override
  String get rememberPlaybackSpeed => 'Zapamiętaj prędkość odtwarzania';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Automatycznie ustawia prędkość odtwarzania na ostatnio wybraną prędkość';

  @override
  String get downloads => 'Pobrane';

  @override
  String get download => 'Pobierz';

  @override
  String get videoAlreadyDownloaded => 'Film został już pobrany';

  @override
  String get noDownloadedVideos =>
      'Brak pobranych filmów, znajdź film, przytrzymaj film na liście lub stuknij przycisk pobierania na ekranie filmu w celu pobrania';

  @override
  String get downloadsPlayAll => 'Odtwórz wszystkie';

  @override
  String get videoDownloadStarted => 'Pobieranie wideo rozpoczęte';

  @override
  String get videoFailedDownloadRetry =>
      'Pobieranie nie powiodło się. Stuknij, aby ponowić próbę';

  @override
  String get videoDownloadAudioOnly => 'Tylko audio';

  @override
  String get manageSubscriptions => 'Zarządzaj subskrypcjami';

  @override
  String get noSubscriptions =>
      'Bez subskrypcji. Przeglądaj filmy i zasubskrybuj kanał, który polubisz.';

  @override
  String get youCanSubscribeAgainLater =>
      'Możesz zasubskrybować ten kanał ponownie później';

  @override
  String get unSubscribeQuestion => 'Zrezygnować z subskrypcji?';

  @override
  String get clearHistoryQuestion => 'Wyczyścić historię?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Spowoduje to wyczyszczenie historii przeglądania na koncie, w używanej instancji Invidious. Nie można tego cofnąć.';

  @override
  String get noHistory =>
      'Brak historii oglądania. Obejrzyj kilka filmów, a te pojawią się tutaj';

  @override
  String get homeLayoutEditor => 'Edytuj układ';

  @override
  String get layoutEditorAddVideoSource => 'Dodaj źródło filmu';

  @override
  String get layoutEditorExplanation =>
      'You can decide what to display on your home screen, you can have up to 2 small view with horizontal scrolling and one big source.';

  @override
  String get home => 'Dom';

  @override
  String get library => 'Biblioteka';

  @override
  String get customizeAppLayout => 'Dostosuj sekcję aplikacji';

  @override
  String get customizeAppLayoutExplanation =>
      'Select which sections you want to appear in the main app navigation bar. Click on the home icon to select which screen shows when the application starts. You can reorder the sections by dragging them around.';

  @override
  String get navigationBarStyle => 'Styl paska nawigacyjnego';

  @override
  String get navigationBarLabelAlwaysShowing => 'Tytuł zawsze się wyswietla';

  @override
  String get navigationBarLabelShowOnSelect => 'Label shown on selected item';

  @override
  String get navigationBarLabelNeverShow => 'Nigdy nie pokazuj tytułu';

  @override
  String get distractionFreeMode => 'Distraction free mode';

  @override
  String get distractionFreeModeDescription =>
      'Wyłącz komentarze i rekomendacje filmów';

  @override
  String get secondsShortForm => 'sek';

  @override
  String get videoFilterApplyDateToFilter => 'Filter videos on given times';

  @override
  String get videoFilterDayOfWeek => 'Wybierz dni aby zastosować filtry';

  @override
  String get videoFilterDayOfWeekDescription =>
      'You can selectively choose days of the week and time to which the filters apply to, for example, avoid sport events spoilers.';

  @override
  String get videoFilterStartTime => 'Czas rozpoczęcia';

  @override
  String get videoFilterEndTime => 'Czas zakończenia';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Zastosowano $selectedDays';
  }

  @override
  String get from => 'Od';

  @override
  String get to => 'Do';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'Od $from do $to';
  }

  @override
  String get notifications => 'Powiadomienia';

  @override
  String get notificationsDescription =>
      'Enable and review what you are notified about';

  @override
  String get enableNotificationDescriptions =>
      'Runs foreground service to check and notify you on the changes you are monitoring';

  @override
  String get subscriptionNotification => 'Powiadomienia subskrybcji';

  @override
  String get subscriptionNotificationDescription =>
      'Get notified of new videos from your subscription feed if you are logged in to your current instance';

  @override
  String get subscriptionNotificationTitle => 'Nowe filmy z twoich subskrybcji';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Jest $countString nowych filmów',
      one: 'Jest 1 nowy film',
      zero: 'Nie ma nowych filmów',
    );
    return '$_temp0 w twoich subskrybcjach';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Disabling battery optimization required';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'In order to send notification Clipious needs to run a background service. For it to run smoothly it is required that Clipious is given unrestricted battery usage, tapping ok will open the battery optimization settings.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Powiadomienia są wyłączone';

  @override
  String get askToEnableBackgroundServiceContent =>
      'To get notifications, Clipious notifications need to be enabled, press OK to enable it.';

  @override
  String get otherNotifications => 'Other notifications sources (bell icons)';

  @override
  String get deleteChannelNotificationTitle => 'Delete channel notification ?';

  @override
  String get deleteChannelNotificationContent =>
      'Przestaniesz otrzymywać powiadomienia z tego kanału';

  @override
  String get deletePlaylistNotificationTitle =>
      'Usunąć powiadomienia z playlisty?';

  @override
  String get deletePlaylistNotificationContent =>
      'Nie będziesz otrzymywał więcej powiadomień z tej playlisty';

  @override
  String channelNotificationTitle(String channel) {
    return 'Nowe filmy z $channel';
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
  String get history => 'Historia';

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
