// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get subscriptions => 'Підписки';

  @override
  String get playlists => 'Добірки';

  @override
  String get popular => 'Популярне';

  @override
  String get trending => 'Тренди';

  @override
  String get noVideoInPlayList => 'Немає відео';

  @override
  String get removeFromPlayList => 'Видалити з добірки';

  @override
  String get deletePlayListQ => 'Видалити добірку?';

  @override
  String get irreversibleAction => 'Цю дію не можна відмінити';

  @override
  String get addPlayList => 'Додати добірку';

  @override
  String get playListName => 'Назва добірки';

  @override
  String get playlistVisibility => 'Видимість';

  @override
  String get publicPlaylist => 'Публічна';

  @override
  String get privatePlaylist => 'Приватна';

  @override
  String get cancel => 'Скасувати';

  @override
  String get add => 'Додати';

  @override
  String get unlistedPlaylist => 'За посиланням';

  @override
  String get info => 'Відомості';

  @override
  String get videos => 'Відео';

  @override
  String get streams => 'Трансляції';

  @override
  String get latestVideos => 'Останні відео';

  @override
  String get subscribed => 'Підписано';

  @override
  String get subscribe => 'Підписатися';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Немає підписників',
        'other': '$count підписники',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Поділитися';

  @override
  String get shareYoutubeLink => 'Поділитися посиланням YouTube';

  @override
  String get shareInvidiousLink => 'Поділитися посиланням Invidious';

  @override
  String get redirectInvidiousLink =>
      'Поділитися посиланням Invidious Redirect';

  @override
  String get shareLinkWithTimestamp => 'Додати мітку часу';

  @override
  String get ok => 'Добре';

  @override
  String get noChannels => 'Немає каналів';

  @override
  String get noPlaylists => 'Немає добірок';

  @override
  String get channels => 'Канали';

  @override
  String get couldntLoadVideo => 'Не вдалося завантажити відео';

  @override
  String get comments => 'Коментарі';

  @override
  String get recommended => 'Рекомендовано';

  @override
  String get couldntFetchVideos =>
      'Не вдалося завантажити відео. Натисніть, щоб спробувати ще раз.';

  @override
  String get wizardIntro =>
      'Виберіть публічний сервер або додайте власний. (Можна змінити пізніше в налаштуваннях)';

  @override
  String get startUsingClipious => 'Почати користуватися Clipious';

  @override
  String get videoAddedToPlaylist => 'Відео додано до добірки';

  @override
  String get videoAddedToQueue => 'Відео додано до черги';

  @override
  String get errorAddingVideoToPlaylist =>
      'Помилка під час додавання відео до добірки';

  @override
  String get itemlistErrorGeneric => 'Не вдалося отримати дані';

  @override
  String get itemListErrorInvalidScope =>
      'Ви не маєте дозволу на перегляд цього, якщо ви увійшли за допомогою методу токена, спробуйте вийти та увійти наново';

  @override
  String get selectPlaylist => 'Виберіть добірку';

  @override
  String get createNewPlaylist => 'Створити нову добірку';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString відповіді',
      one: '1 відповідь',
      zero: 'Немає відповідей',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Завантажити більше';

  @override
  String get topSorting => 'Найкращі';

  @override
  String get newSorting => 'Найновіші';

  @override
  String get streamIsLive => 'Наживо';

  @override
  String get sponsorSkipped => 'Спонсор пропущений';

  @override
  String get selectBrowsingCountry => 'Оберіть країну перегляду';

  @override
  String get showOnStart => 'Оберіть, що показувати під час запуску застосунку';

  @override
  String get settings => 'Налаштування';

  @override
  String get browsing => 'Перегляд';

  @override
  String get country => 'Країна';

  @override
  String get whenAppStartsShow => 'Коли застосунок запуститься, показати…';

  @override
  String get servers => 'Сервери';

  @override
  String get manageServers => 'Керування серверами';

  @override
  String currentServer(String current) {
    return 'Наразі використовується $current';
  }

  @override
  String get useSponsorBlock => 'Використовувати SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'Пропускати сегменти спонсорів, які подала спільнота';

  @override
  String get about => 'Про застосунок';

  @override
  String get name => 'Назва';

  @override
  String get package => 'Пакунок';

  @override
  String get version => 'Версія';

  @override
  String get build => 'Збірка';

  @override
  String get addServer => 'Додати сервер';

  @override
  String get useThisServer => 'Використовувати цей сервер';

  @override
  String get logIn => 'Увійти';

  @override
  String get delete => 'Видалити';

  @override
  String get invalidInvidiousServer => 'Недійсний сервер Invidious';

  @override
  String get yourServers => 'Ваші сервери';

  @override
  String get loggedIn => 'Ви увійшли';

  @override
  String get notLoggedIn => 'Ви не увійшли';

  @override
  String get addServerHelpText =>
      'Використовуйте кнопку +, щоб додати власні сервери або натисніть на публічний сервер та додайте його.';

  @override
  String get publicServers => 'Публічні сервери';

  @override
  String get loadingPublicServer => 'Завантаження публічних серверів';

  @override
  String get tapToAddServer => 'Натисніть, щоб додати сервер до вашого списку';

  @override
  String get publicServersError =>
      'Не вдалося отримати список публічних серверів. Натисніть, щоб повторити спробу.';

  @override
  String get appearance => 'Зовнішній вигляд';

  @override
  String get useDynamicTheme => 'Динамічні кольори';

  @override
  String get useDynamicThemeDescription =>
      'Використовувати кольори Material You (доступно лише на Android 12+)';

  @override
  String get useDash => 'Використовувати DASH';

  @override
  String get useDashDescription =>
      'Адаптивний стримінг DASH, іноді може бути проблематичним, YouTube може обмежувати його швидкість.';

  @override
  String get videoPlayer => 'Відеоплеєр';

  @override
  String get videoListed => 'Публічне';

  @override
  String get videoUnlisted => 'За посиланням';

  @override
  String get videoIsFamilyFriendly => 'Сімейне';

  @override
  String get tapToManage => 'Натисніть, щоб керувати';

  @override
  String get authentication => 'Автентифікація';

  @override
  String get tokenLogin => 'Увійти за допомогою токену';

  @override
  String get tokenLoginDescription => 'Рекомендований спосіб входу';

  @override
  String get cookieLogin => 'Увійти за допомогою cookie';

  @override
  String get cookieLoginDescription =>
      'Використовуйте цей метод, якщо у вас виникли проблеми з токеном автентифікації';

  @override
  String get logout => 'Вийти';

  @override
  String get username => 'Ім’я користувача';

  @override
  String get password => 'Пароль';

  @override
  String get wrongUsernamePassword => 'Неправильне ім’я користувача або пароль';

  @override
  String get error => 'Помилка';

  @override
  String get malformedStatsEndpoint =>
      '/api/v1/stats не відповідає очікуванням';

  @override
  String get malformedStatsEndpointDescription =>
      'Кінцева точка статистики сервера не відповіла очікуваним корисним навантаженням, ключ «software.name» має дорівнювати «invidious».\nВідповідь від сервера:';

  @override
  String get serverIsNotReachable => 'Сервер недоступний';

  @override
  String get videoQueue => 'Черга відео';

  @override
  String get addToQueueList => 'Додати до черги';

  @override
  String get addToPlaylist => 'Додати до добірки';

  @override
  String get playNext => 'Автовідтворення';

  @override
  String get playNextAddedToQueue => 'Відео буде відтворене наступним';

  @override
  String get addRecommendedToQueue => 'Автовідтворення рекомендованого';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Оберіть, який тип сегментів пропускати';

  @override
  String get sponsorBlockCategorySponsor => 'Спонсор';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Платне просування, платні реферали та пряма реклама. Не для самореклами чи безплатних повідомлень про причини/творців/сайти/продукти, які їм подобаються.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => 'Безоплатно/самореклама';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Схоже на категорію \"спонсор\", за винятком безоплатного або самореклами. Сюди входять розділи про товари, пожертви або інформацію про те, з ким вони співпрацювали ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Нагадування про взаємодію (Підписатися)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Якщо посеред контенту є коротке нагадування про те, що потрібно вподобати, підписатися або стежити за ними. Якщо воно довге або про щось конкретне, його слід розмістити в розділі самореклами.';

  @override
  String get sponsorBlockCategoryIntro => 'Анімація переходу/вступу';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Інтервал без фактичного контенту. Це може бути пауза, статичний кадр, повторювана анімація. Не слід використовувати для переходів, що містять інформацію.';

  @override
  String get sponsorBlockCategoryOutro => 'Кінцеві картки/Титри';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Титри або коли з’являються кінцеві картки YouTube. Не для висновків з інформацією.';

  @override
  String get sponsorBlockCategoryPreview => 'Попередній перегляд/Підсумок';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Колекція кліпів, які показують, що відбувається в цьому відео або інших відео в серії, де вся інформація повторюється пізніше у відео.';

  @override
  String get sponsorBlockCategoryFiller => 'Не по темі/Анекдоти';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Сцени не по темі, додані лише для наповнення або гумору, які не є необхідними для розуміння основного змісту відео. Сюди не слід включати сегменти, що надають контекст або фонові деталі. Це дуже агресивна категорія, призначена для тих випадків, коли ви не в настрої для \"веселощів\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'Музика: немузичний розділ';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Тільки для використання в музичних відео. Використовується лише для частин музичних відео, які не підпадають під іншу категорію.';

  @override
  String get useProxy => 'Використовувати проксі';

  @override
  String get useProxyDescription =>
      'Проксі дозволяє обходити регіональні обмеження або блокування YouTube провайдером';

  @override
  String get pressDownToShowSettings =>
      'Натисніть вниз, щоб показати налаштування';

  @override
  String get quality => 'Якість';

  @override
  String get audio => 'Аудіо';

  @override
  String get subtitles => 'Субтитри';

  @override
  String get playbackSpeed => 'Швидкість відтворення';

  @override
  String get blackBackground => 'Чорний фон';

  @override
  String get blackBackgroundDescription => 'Для темної теми на OLED екрані';

  @override
  String get search => 'Пошук';

  @override
  String get subtitleFontSize => 'Розмір шрифту субтитрів';

  @override
  String get subtitleFontSizeDescription =>
      'Змініть розмір субтитрів, якщо вони замалі або завеликі на вашому пристрої';

  @override
  String get skipSslVerification => 'Пропускати перевірку SSL-сертифіката';

  @override
  String get skipSslVerificationDescription =>
      'Для використання самопідписаного SSL-сертифіката або у разі виникнення проблем з SSL на вашому сервері.';

  @override
  String get themeBrightness => 'Тема';

  @override
  String get themeLight => 'Світла';

  @override
  String get themeDark => 'Темна';

  @override
  String get followSystem => 'Як у системі';

  @override
  String get requiresRestart => 'Потребує перезапуску застосунку';

  @override
  String get appLanguage => 'Мова застосунку';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString відео',
      one: '1 відео',
      zero: 'Немає відео',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'URL-адреса повинна починатися з http:// або https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Показувати приблизну кількість дизлайків під відео за допомогою API, наданого returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'Власна адреса екземпляра RYD';

  @override
  String get rydCustomInstanceDescription =>
      'Використовуйте інший екземпляр RYD, залиште порожнім для використання за замовчуванням';

  @override
  String get autoplayVideoOnLoad =>
      'Автоматично відтворювати відео під час завантаження';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Автоматично починати відтворення відео після його завантаження';

  @override
  String get searchHistory => 'Історія пошуку';

  @override
  String get searchHistoryDescription => 'Налаштування історії пошуку';

  @override
  String get enableSearchHistory => 'Ввімкнути історію пошуку';

  @override
  String get searchHistoryLimit => 'Обмеження історії пошуку';

  @override
  String get searchHistoryLimitDescription =>
      'Налаштуйте, скільки попередніх пошукових запитів буде показано у пропозиціях';

  @override
  String get shorts => 'Шорти';

  @override
  String get searchUploadDate => 'Дата завантаження';

  @override
  String get searchUploadDateAny => 'Будь-яка дата';

  @override
  String get searchUploadDateHour => 'За останню годину';

  @override
  String get searchUploadDateToday => 'За сьогодні';

  @override
  String get searchUploadDateWeek => 'Цього тижня';

  @override
  String get searchUploadDateMonth => 'Цього місяця';

  @override
  String get searchUploadDateYear => 'Цього року';

  @override
  String get searchDuration => 'Тривалість';

  @override
  String get searchDurationAny => 'Будь-яка тривалість';

  @override
  String get searchDurationShort => 'Короткі (менше 4 хв)';

  @override
  String get searchDurationLong => 'Довгі (понад 20 хв)';

  @override
  String get searchDurationMedium => 'Середні (4-20 хв)';

  @override
  String get searchSortBy => 'Сортувати за';

  @override
  String get searchSortRelevance => 'Актуальністю';

  @override
  String get searchSortRating => 'Рейтингом';

  @override
  String get searchSortUploadDate => 'Датою завантаження';

  @override
  String get searchSortViewCount => 'Кількістю переглядів';

  @override
  String get clearSearchHistory => 'Очистити історію пошуку';

  @override
  String get appLogs => 'Журнали застосунку';

  @override
  String get appLogsDescription =>
      'Отримайте журнали того, що відбувається в застосунку, це може бути корисно для повідомлення про проблеми';

  @override
  String get copyToClipBoard => 'Копіювати в буфер обміну';

  @override
  String get logsCopied => 'Журнали скопійовано до буфера обміну';

  @override
  String get rememberSubtitleLanguage => 'Запам’ятати мову субтитрів';

  @override
  String get videoFilters => 'Фільтри відео';

  @override
  String nFilters(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString фільтрів',
      one: '1 фільтр',
      zero: 'Немає відео',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'Приховувати або затемнювати відео з усіх відео каналів у застосунку на основі фільтрів, визначених нижче. Це дозволяє, наприклад, приховати спортивні спойлери або приховати Shorts з певного каналу.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Визначити правила для фільтрації відео';

  @override
  String get videoFilterAllChannels => 'Всі канали';

  @override
  String get addVideoFilter => 'Створити фільтр';

  @override
  String get editVideoFilter => 'Редагувати фільтр';

  @override
  String get videoFilterType => 'Тип';

  @override
  String get videoFilterOperation => 'Операція';

  @override
  String get videoFilterValue => 'Значення';

  @override
  String get save => 'Зберегти';

  @override
  String get videoFilterEditDescription =>
      'Оберіть канал, тип фільтра, операцію та значення, щоб відфільтрувати відео зі списків. Наприклад, тип – назва відео, операція – містить, а значення – виключити усі відео зі словом «тест» у назві.';

  @override
  String get optional => 'необов’язково';

  @override
  String get videoFilterHideLabel => 'Приховати';

  @override
  String get videoFilterFilterLabel => 'Затемнювати';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter відео, де $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered => 'Відео відфільтроване з наступних причин:';

  @override
  String get videoFilterTapToReveal => 'Натисніть, щоб відкрити';

  @override
  String get videoFilterHide => 'Приховувати відфільтровані відео';

  @override
  String get videoFilterHideDescription =>
      'За замовчуванням відфільтровані відео не приховуються, а показуються у вигляді затемнених з вказанням причин, через які їх було відфільтровано. Цей параметр видаляє відфільтровані відео зі списків.';

  @override
  String get videoFilterNoFilters =>
      'Немає фільтрів, натисніть кнопку \"+\" нижче, щоб почати додавати фільтри.';

  @override
  String get videoFilterTypeVideoTitle => 'Назва відео';

  @override
  String get videoFilterTypeChannelName => 'Назва каналу';

  @override
  String get videoFilterTypeVideoLength => 'Тривалість відео (у секундах)';

  @override
  String get videoFilterOperationContains => 'Містить';

  @override
  String get videoFilterOperationNotContain => 'Не містить';

  @override
  String get videoFilterOperationLowerThan => 'Нижче';

  @override
  String get videoFilterOperationHigherThan => 'Вище';

  @override
  String get channel => 'Канал';

  @override
  String get videoFilterHideAllFromChannel =>
      'Відфільтрувати всі відео з каналу';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter всі відео з каналу';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Автоматично встановлювати субтитри до останньої обраної мови, якщо вони доступні';

  @override
  String get lockFullScreenToLandscape =>
      'Заблокувати орієнтацію повноекранного режиму відтворення відео відповідно до співвідношення сторін відео';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Заблоковує повноекранну орієнтацію залежно від формату відео: альбомну для широкоформатного відео та книжкову для відео в книжковій орієнтації';

  @override
  String get fillFullscreen => 'Розгорнути відео до розміру екрана';

  @override
  String get fillFullscreenDescription =>
      'Налаштовує відео на заповнення всього екрану в альбомному режимі';

  @override
  String get rememberPlaybackSpeed => 'Запам’ятовувати швидкість відтворення';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Автоматичне встановлення швидкості відтворення відповідно до останньої обраної швидкості';

  @override
  String get downloads => 'Завантаження';

  @override
  String get download => 'Завантаження';

  @override
  String get videoAlreadyDownloaded => 'Відео вже завантажено';

  @override
  String get noDownloadedVideos =>
      'Немає завантажених відео, переглядайте, довго натискайте відео в списку або натисніть кнопку завантаження на екрані відео, щоб завантажити';

  @override
  String get downloadsPlayAll => 'Відтворити все';

  @override
  String get videoDownloadStarted => 'Почалося завантаження відео';

  @override
  String get videoFailedDownloadRetry =>
      'Завантаження не вдалося, торкніться, щоб повторити спробу';

  @override
  String get videoDownloadAudioOnly => 'Тільки аудіо';

  @override
  String get manageSubscriptions => 'Керувати підписками';

  @override
  String get noSubscriptions =>
      'Немає підписок, переглядайте відео та підписуйтеся на будь-який канал, який вам подобається.';

  @override
  String get youCanSubscribeAgainLater =>
      'Ви можете підписатися на цей канал пізніше';

  @override
  String get unSubscribeQuestion => 'Відписатися?';

  @override
  String get clearHistoryQuestion => 'Очистити історію?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Це очистить історію переглядів вашого облікового запису в Invidious, який ви використовуєте. Цю дію неможливо скасувати.';

  @override
  String get noHistory =>
      'Немає історії перегляду, перегляньте кілька відео, і вона з\'явиться тут';

  @override
  String get homeLayoutEditor => 'Змінити макет головного екрану';

  @override
  String get layoutEditorAddVideoSource => 'Додать джерело відео';

  @override
  String get layoutEditorExplanation =>
      'Ви можете налаштувати, що відображати на головному екрані: у вас може бути до двох невеликих уявлень з горизонтальним прокручуванням і одне велике джерело.';

  @override
  String get home => 'Головний екран';

  @override
  String get library => 'Бібліотека';

  @override
  String get customizeAppLayout => 'Налаштувати розділи застосунку';

  @override
  String get customizeAppLayoutExplanation =>
      'Виберіть, які розділи ви хочете бачити на головній навігаційній панелі застосунку. Натисніть на головний значок, щоби вибрати, який екран показуватиметься під час запуску застосунку. Ви можете змінити порядок розділів, перетягнувши їх.';

  @override
  String get navigationBarStyle => 'Стиль панелі навігації';

  @override
  String get navigationBarLabelAlwaysShowing => 'Мітки завжди видно';

  @override
  String get navigationBarLabelShowOnSelect => 'Тільки на вибраному елементі';

  @override
  String get navigationBarLabelNeverShow => 'Ніколи не показувати мітку';

  @override
  String get distractionFreeMode => 'Режим зосередження';

  @override
  String get distractionFreeModeDescription =>
      'Вимкнути коментарі та рекомендації до відео';

  @override
  String get secondsShortForm => 'сек.';

  @override
  String get videoFilterApplyDateToFilter =>
      'Фільтрувати відео за вказаний час';

  @override
  String get videoFilterDayOfWeek => 'Виберіть дні для застосування фільтрів';

  @override
  String get videoFilterDayOfWeekDescription =>
      'Ви можете вибрати дні тижня і час, до яких застосовуються фільтри, наприклад, щоб уникнути спойлерів спортивних подій.';

  @override
  String get videoFilterStartTime => 'Час початку';

  @override
  String get videoFilterEndTime => 'Час кінця';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Застосовано до $selectedDays';
  }

  @override
  String get from => 'З';

  @override
  String get to => 'До';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'З $from до $to';
  }

  @override
  String get notifications => 'Повідомлення';

  @override
  String get notificationsDescription =>
      'Увімкніть та перегляньте, про що ви отримуєте повідомлення';

  @override
  String get enableNotificationDescriptions =>
      'Запускає фонову службу для перевірки та повідомлення вас про зміни, які ви відстежуєте';

  @override
  String get subscriptionNotification => 'Повідомлення про підписки';

  @override
  String get subscriptionNotificationDescription =>
      'Отримуйте повідомлення про нові відео з вашої стрічки підписок, якщо ви ввійшли у свій поточний екземпляр';

  @override
  String get subscriptionNotificationTitle => 'Нові відео з ваших підписок';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString нових відео',
      one: '1 нове відео',
      zero: 'немає нових відел',
    );
    return 'У вашій стрічці підписок –  $_temp0';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Потрібно вимкнути оптимізацію акумулятора';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'Для того, щоб надсилати вам повідомлення, Clipious має запустити фонову службу. Для безперебійної роботи, необхідно, щоб Clipious мав необмежене використання акумулятора, натиснувши кнопку «Добре», ви відкриєте налаштування оптимізації роботи акумулятора.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Повідомлення вимкнені';

  @override
  String get askToEnableBackgroundServiceContent =>
      'Щоб отримувати повідомлення, необхідно увімкнути сповіщення Clipious, натисніть «Добре», щоб увімкнути їх.';

  @override
  String get otherNotifications =>
      'Інші джерела повідомлень (значки дзвіночків)';

  @override
  String get deleteChannelNotificationTitle =>
      'Видалити повідемлення від каналу?';

  @override
  String get deleteChannelNotificationContent =>
      'Ви більше не будете отримувати повідомлення від цього каналу.';

  @override
  String get deletePlaylistNotificationTitle =>
      'Видалити повідомлення від добірки?';

  @override
  String get deletePlaylistNotificationContent =>
      'Ви більше не будете отримувати повідомлення від цієї добірки.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Нові відео від $channel';
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
      other: '$countString нових відео',
      one: '1 нове відео',
      zero: 'Немає відео',
    );
    return '$_temp0 від $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'Нові відео в списку відтворення $playlist';
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
      other: '$countString нових відео',
      one: '1 нове відео',
      zero: 'немає нових відео',
    );
    return 'Є $_temp0 у списку відтворення $playlist';
  }

  @override
  String get foregroundServiceNotificationTitle => 'Відео моніторинг';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'per year',
        '24': 'a day',
        'other': 'кожні $hours годин',
      },
    );
    return 'Буде перевіряти наявність нових відео раз $_temp0';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions => 'Перевірка підписок...';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'Перевірка списків відтворення...';

  @override
  String get foregroundServiceUpdatingChannels => 'Перевірка каналів...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Нова частота перевірки відео';

  @override
  String get notificationFrequencySettingsDescription =>
      'Як часто програма перевірятиме наявність нових відео';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '1d',
        'other': '${hours}h',
      },
    );
    return 'I$_temp0';
  }

  @override
  String get subtitlesBackground => 'Фон субтитрів';

  @override
  String get subtitlesBackgroundDescription =>
      'Додає чорний фон до субтитрів, щоб зробити їх більш читабельними';

  @override
  String get history => 'Історія';

  @override
  String get deArrowSettingDescription => 'Замініть заголовки та мініатюри';

  @override
  String get deArrowReplaceThumbnails => 'Замінити мініатюри';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Замініть мініатюри відео на додаток до назв';

  @override
  String get deArrowWarning =>
      'Увімкнення DeArrow може значно зменшити швидкість веб-перегляду програми, оскільки для кожного окремого відео потрібні додаткові http-запити';

  @override
  String get copySettingsAsJson =>
      'Скопіюйте налаштування як JSON у буфер обміну';

  @override
  String get copySettingsAsJsonDescription =>
      'Скопіюйте налаштування як JSON, щоб допомогти з усуненням помилок, якщо ви зіткнетеся з проблемою в програмі та вирішите порушити проблему';

  @override
  String get seeking => 'Шукає';

  @override
  String get skipStep => 'Пропустити крок вперед/назад';

  @override
  String get skipStepDescription => 'Секунди для пропуску дій вперед/назад';

  @override
  String get exponentialSkip => 'Експоненціальний пропуск вперед/назад';

  @override
  String get exponentialSkipDescription =>
      'Чим більше ви пропускаєте вперед, тим більший крок.';

  @override
  String get fullscreenOnLandscape => 'Повний екран в альбомній орієнтації';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Перехід у повноекранний режим, коли пристрій повернуто в ландшафтний режим';

  @override
  String get enabled => 'Увімкнено';

  @override
  String get submitFeedback => 'Надіслати відгук';

  @override
  String get submitFeedbackDescription =>
      'Знайшли помилку чи маєте пропозицію? Використовуйте цей інструмент, щоб зробити знімок екрана програми, додати коментарі та надіслати відгук';

  @override
  String get feedbackDisclaimer =>
      'Щоб надіслати відгук, вам знадобиться обліковий запис GitHub, і ваш знімок екрана буде надіслано в Imgur анонімно.';

  @override
  String get feedbackScreenshotError =>
      'Помилка під час завантаження знімка екрана в Imgur';

  @override
  String get channelSortByNewest => 'Найновіший';

  @override
  String get channelSortByOldest => 'Найстаріший';

  @override
  String get channelSortByPopular => 'Популярний';

  @override
  String get invidiousAccount => 'Зловісний обліковий запис';

  @override
  String get onDeviceSubscriptions => 'На пристрої';

  @override
  String get both => 'Обидва';

  @override
  String get refresh => 'Оновити';

  @override
  String get addBasicAuth => 'Додайте базову автентифікацію';

  @override
  String get addBasicAuthExplanation =>
      'Якщо ваш сервер вимагає базової автентифікації HTTP, додайте деталі нижче. Це не ваші образливі дані облікового запису';

  @override
  String get addHeader => 'Додайте заголовок';

  @override
  String get advancedConfiguration => 'Розширена конфігурація';

  @override
  String get customHeaders => 'Спеціальні заголовки';

  @override
  String get customHeadersExplanation =>
      'Встановіть власні заголовки для надсилання на сервер invidious';

  @override
  String get value => 'Значення';

  @override
  String get testAndAddServer => 'Перевірте та додайте сервер';

  @override
  String get alsoTestServerConfig =>
      'Також перевірте конфігурацію сервера, наприклад, чи правильно відображатимуться мініатюри';

  @override
  String get serverAlreadyExists => 'Сервер уже існує в налаштуваннях';

  @override
  String get wrongThumbnailConfiguration =>
      'Сервер доступний, але не налаштований належним чином, ескізи відео та каналу не відображатимуться належним чином. Якщо так, вимкніть тестову конфігурацію сервера Добре з цим, інакше виправте свій сервер';

  @override
  String get openWikiLink => 'Відкрийте wiki для допомоги';

  @override
  String get serverUnreachable =>
      'Сервер недоступний або не є дійсним invidious сервером';

  @override
  String get copyToDownloadFolder => 'Копіювати в папку завантаження';

  @override
  String get fileCopiedToDownloadFolder =>
      'Файл скопійовано в папку для завантаження';

  @override
  String get videoDeleted => 'Відео видалено';

  @override
  String get sleepTimer => 'Таймер сну';

  @override
  String get stopTheVideo => 'Зупиніть відео';

  @override
  String get stopTheVideoExplanation =>
      'Якщо ввімкнено, відео буде закрито, якщо вимкнено, відео буде просто призупинено';

  @override
  String get setTimer => 'Встановити таймер';

  @override
  String get cancelSleepTimer => 'Скасувати таймер сну';

  @override
  String premieresIn(Object formattedDuration) {
    return 'Прем\'єра за $formattedDuration';
  }

  @override
  String get screenControls => 'Екранні елементи керування';

  @override
  String get screenControlsExplanation =>
      'Під час перегляду відео в повноекранному режимі вертикальне перетягування зліва або справа регулює яскравість або гучність відповідно';

  @override
  String get retry => 'Повторіть спробу';

  @override
  String get forceTvUi => 'Force TV інтерфейс';

  @override
  String get forceTvUiExplanation =>
      'Змусити інтерфейс бути телевізійним, може бути корисним для деяких пристроїв, які не мають конфігурації системи Leanback. Потрібен перезапуск програми';

  @override
  String get noPublicServers => 'Загальнодоступні сервери недоступні';

  @override
  String get tapToSeeHow => 'Торкніться, щоб побачити, як розмістити власний';

  @override
  String get referToInvidiousWebsiteForHostingInstructions =>
      'Зверніться до веб-сайту Invidious, щоб отримати інструкції щодо розміщення invidious';
}
