// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get subscriptions => 'Подписки';

  @override
  String get playlists => 'Плейлисты';

  @override
  String get popular => 'Популярное';

  @override
  String get trending => 'В тренде';

  @override
  String get noVideoInPlayList => 'Нет видео в плейлисте';

  @override
  String get removeFromPlayList => 'Удалить из плейлиста';

  @override
  String get deletePlayListQ => 'Удалить плейлист?';

  @override
  String get irreversibleAction => 'Данное действие необратимо';

  @override
  String get addPlayList => 'Добавить плейлист';

  @override
  String get playListName => 'Название плейлиста';

  @override
  String get playlistVisibility => 'Видимость';

  @override
  String get publicPlaylist => 'Публичный';

  @override
  String get privatePlaylist => 'Личный';

  @override
  String get cancel => 'Отмена';

  @override
  String get add => 'Добавить';

  @override
  String get unlistedPlaylist => 'По ссылке';

  @override
  String get info => 'Информация';

  @override
  String get videos => 'Видео';

  @override
  String get streams => 'Стримы';

  @override
  String get latestVideos => 'Последние видео';

  @override
  String get subscribed => 'Подписан';

  @override
  String get subscribe => 'Подписаться';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Нет подписчиков',
        'other': '$count подписчиков',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Поделиться';

  @override
  String get shareYoutubeLink => 'Поделиться ссылкой YouTube';

  @override
  String get shareInvidiousLink => 'Поделиться ссылкой Invidious';

  @override
  String get redirectInvidiousLink =>
      'Поделиться перенаправляющей ссылкой Invidious';

  @override
  String get shareLinkWithTimestamp => 'Добавить отметку времени';

  @override
  String get ok => 'ОК';

  @override
  String get noChannels => 'Нет каналов';

  @override
  String get noPlaylists => 'Нет плейлистов';

  @override
  String get channels => 'Каналы';

  @override
  String get couldntLoadVideo => 'Не удалось загрузить видео';

  @override
  String get comments => 'Комментарии';

  @override
  String get recommended => 'Рекомендации';

  @override
  String get couldntFetchVideos =>
      'Не удалось получить видео. Нажмите, чтобы повторить попытку.';

  @override
  String get wizardIntro =>
      'Выберите общедоступный сервер или добавьте свой собственный. (можно изменить позже в настройках)';

  @override
  String get startUsingClipious => 'Начать использовать Clipious';

  @override
  String get videoAddedToPlaylist => 'Видео добавлено в плейлист';

  @override
  String get videoAddedToQueue => 'Видео добавлено в очередь';

  @override
  String get errorAddingVideoToPlaylist =>
      'Ошибка при добавлении видео в плейлист';

  @override
  String get itemlistErrorGeneric => 'Не удалось получить данные';

  @override
  String get itemListErrorInvalidScope =>
      'У вас нет прав на просмотр этого, если вы вошли через токен, то попробуйте выйти и снова войти';

  @override
  String get selectPlaylist => 'Выбрать плейлист';

  @override
  String get createNewPlaylist => 'Создать новый плейлист';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString repliеs',
      one: '1 ответ',
      zero: 'Нет ответов',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Загрузить больше';

  @override
  String get topSorting => 'Лучшие';

  @override
  String get newSorting => 'Новые';

  @override
  String get streamIsLive => 'Livе';

  @override
  String get sponsorSkipped => 'Спонсор пропущен';

  @override
  String get selectBrowsingCountry => 'Выберите страну просмотра';

  @override
  String get showOnStart => 'Выберите, что показывать при запуске приложения';

  @override
  String get settings => 'Настройки';

  @override
  String get browsing => 'Просмотр';

  @override
  String get country => 'Страна';

  @override
  String get whenAppStartsShow => 'Когда приложение запускается, показывать…';

  @override
  String get servers => 'Сервера';

  @override
  String get manageServers => 'Управление серверами';

  @override
  String currentServer(String current) {
    return 'Сейчас используется $current';
  }

  @override
  String get useSponsorBlock => 'Использовать SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'Пропускать спонсорские сегменты, представленные сообществом';

  @override
  String get about => 'О приложении';

  @override
  String get name => 'Имя';

  @override
  String get package => 'Packagе';

  @override
  String get version => 'Версия';

  @override
  String get build => 'Вuild';

  @override
  String get addServer => 'Добавить сервер';

  @override
  String get useThisServer => 'Использовать этот сервер';

  @override
  String get logIn => 'Войти';

  @override
  String get delete => 'Удалить';

  @override
  String get invalidInvidiousServer => 'Неверный сервер Invidious';

  @override
  String get yourServers => 'Ваши сервера';

  @override
  String get loggedIn => 'Вы вошли на сервер';

  @override
  String get notLoggedIn => 'Вы не авторизованы';

  @override
  String get addServerHelpText =>
      'Используйте кнопку + для добавления своих собственных серверов или нажмите на общедоступный сервер и добавьте его.';

  @override
  String get publicServers => 'Публичные сервера';

  @override
  String get loadingPublicServer => 'Загрузка публичных серверов';

  @override
  String get tapToAddServer => 'Нажмите, чтобы добавить сервер в список';

  @override
  String get publicServersError =>
      'Не удалось получить список публичных серверов. Нажмите, чтобы повторить попытку.';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get useDynamicTheme => 'Динамические цвета';

  @override
  String get useDynamicThemeDescription =>
      'Используйте цвета Material You (доступно только на Android 12+)';

  @override
  String get useDash => 'Использовать DASH';

  @override
  String get useDashDescription =>
      'Адаптивная потоковая передача DASH иногда может быть проблематичной, Youtube может ухудшать качество.';

  @override
  String get videoPlayer => 'Видеопроигрыватель';

  @override
  String get videoListed => 'Публично';

  @override
  String get videoUnlisted => 'По ссылке';

  @override
  String get videoIsFamilyFriendly => 'Для семейного просмотра';

  @override
  String get tapToManage => 'Нажмите для управления';

  @override
  String get authentication => 'Аутентификация';

  @override
  String get tokenLogin => 'Вход в аккаунт через токен';

  @override
  String get tokenLoginDescription => 'Рекомендуемый способ входа в аккаунт';

  @override
  String get cookieLogin => 'Войти с помощью cookie';

  @override
  String get cookieLoginDescription =>
      'Используйте этот метод, если у вас возникли проблемы с аутентификацией с помощью токена';

  @override
  String get logout => 'Выйти';

  @override
  String get username => 'Имя пользователя';

  @override
  String get password => 'Пароль';

  @override
  String get wrongUsernamePassword =>
      'Неправильное имя пользователя или пароль';

  @override
  String get error => 'Ошибка';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats не такое, как ожидалось';

  @override
  String get malformedStatsEndpointDescription =>
      'Конечная точка статистики сервера не ответила на ожидаемую нагрузку, ключ \"software.name\" должен быть равен \"invidious\".\nОтвет от сервера:';

  @override
  String get serverIsNotReachable => 'Сервер недоступен';

  @override
  String get videoQueue => 'Очередь видео';

  @override
  String get addToQueueList => 'Добавить в очередь';

  @override
  String get addToPlaylist => 'Добавить в плейлист';

  @override
  String get playNext => 'Воспроизвести следующим';

  @override
  String get playNextAddedToQueue => 'Это видео будет следующим';

  @override
  String get addRecommendedToQueue =>
      'Автовоспроизведение следующего видео из рекомендаций';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Выберите тип сегментов для пропуска';

  @override
  String get sponsorBlockCategorySponsor => 'Спонсор';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Платное продвижение, платные рефералы и прямая реклама. Не для саморекламы или бесплатных криков о причинах/создателях/сайтах/продуктах, которые им нравятся.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo =>
      'Неоплачиваемый/самостоятельное продвижение';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Аналогично \"спонсору\", за исключением неоплачиваемой или саморекламы. Сюда входят разделы о товарах, пожертвованиях или информация о том, с кем они сотрудничали. ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Напоминание о взаимодействии (Подписаться)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Если в середине контента есть короткое напоминание о необходимости поставить лайк, подписаться или следовать за ними. Если контент длинный или посвящен чему-то конкретному, его следует поместить в раздел саморекламы.';

  @override
  String get sponsorBlockCategoryIntro => 'Антракт/Вступительная анимация';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Интервал без фактического содержания. Это может быть пауза, статичный кадр, повторяющаяся анимация. Не следует использовать для переходов, содержащих информацию.';

  @override
  String get sponsorBlockCategoryOutro => 'Конечные карты/кредиты';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Для упоминаний или концовок видео. Не для важной информации.';

  @override
  String get sponsorBlockCategoryPreview => 'Превью/Рекап';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Коллекция клипов, которые показывают, что будет дальше в этом видео или в других видео из серии, где вся информация повторяется позже в видео.';

  @override
  String get sponsorBlockCategoryFiller => 'Заполнять Наполнения/Шутки';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Касательные сцены, добавленные только для наполнения или юмора, которые не требуются для понимания основного содержания видео. Сюда не должны входить сегменты, обеспечивающие контекст или фоновые детали. Это очень агрессивная категория, предназначенная для тех случаев, когда у вас нет настроения для \"веселья\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic =>
      'Музыка: Немузыкальная секция';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Только для использования в музыкальных видео. Этот пункт должен быть использован только для секций музыкальных видео, которые не попадают под другие категории.';

  @override
  String get useProxy => 'Проксировать видео';

  @override
  String get useProxyDescription =>
      'Проксируя видеопотоки с сервера, вы можете обойти региональные блокировки или блокировки провайдера YouTube';

  @override
  String get pressDownToShowSettings => 'Нажмите вниз для отображения настроек';

  @override
  String get quality => 'Качество';

  @override
  String get audio => 'Аудио';

  @override
  String get subtitles => 'Субтитры';

  @override
  String get playbackSpeed => 'Скорость воспроизведения';

  @override
  String get blackBackground => 'Черный фон';

  @override
  String get blackBackgroundDescription => 'Для темной темы на OLED-экране';

  @override
  String get search => 'Искать';

  @override
  String get subtitleFontSize => 'Размер субтитров';

  @override
  String get subtitleFontSizeDescription =>
      'Измените размер субтитров, если они слишком маленькие или слишком большие на вашем устройстве';

  @override
  String get skipSslVerification => 'Пропустить проверку SSL-сертификата';

  @override
  String get skipSslVerificationDescription =>
      'Для использования самоподписанного SSL-сертификата или при возникновении проблем с SSL на вашем сервере.';

  @override
  String get themeBrightness => 'Тема';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get followSystem => 'Как в системе';

  @override
  String get requiresRestart => 'Требуется перезапуск приложения';

  @override
  String get appLanguage => 'Язык приложения';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString видео',
      one: '1 video',
      zero: 'Нет видео',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Ссылка должна начинаться с http:// или с https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Показывать примерное количество дизлайков видео с помощью сервиса ReturnYouTubeDislike.com';

  @override
  String get rydCustomInstance => 'Ссылка на сторонний сервер RYD';

  @override
  String get rydCustomInstanceDescription =>
      'Изменится сервер RYD, чтобы использовать официальный, оставьте поле пустым';

  @override
  String get autoplayVideoOnLoad =>
      'Автоматически воспроизводить видео после скачивания';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Автоматически начать воспроизведение видео после как оно будет скачано';

  @override
  String get searchHistory => 'История поиска';

  @override
  String get searchHistoryDescription => 'Настройки истории поиска';

  @override
  String get enableSearchHistory => 'Включить историю поиска';

  @override
  String get searchHistoryLimit => 'Предел истории поиска';

  @override
  String get searchHistoryLimitDescription =>
      'Укажите сколько предыдущих поисковых запросов будут показываться в предложениях';

  @override
  String get shorts => 'Моменты';

  @override
  String get searchUploadDate => 'Дата загрузки';

  @override
  String get searchUploadDateAny => 'Любая дата';

  @override
  String get searchUploadDateHour => 'Последний час';

  @override
  String get searchUploadDateToday => 'Сегодня';

  @override
  String get searchUploadDateWeek => 'На этой неделе';

  @override
  String get searchUploadDateMonth => 'В этос месяце';

  @override
  String get searchUploadDateYear => 'В этом году';

  @override
  String get searchDuration => 'Продолжительность';

  @override
  String get searchDurationAny => 'Любая продолжительность';

  @override
  String get searchDurationShort => 'Короткие (<4 минут)';

  @override
  String get searchDurationLong => 'Длинные (>20 минут)';

  @override
  String get searchDurationMedium => 'Средние (4-20 минут)';

  @override
  String get searchSortBy => 'Сортировать по';

  @override
  String get searchSortRelevance => 'Актуальности';

  @override
  String get searchSortRating => 'Рейтингу';

  @override
  String get searchSortUploadDate => 'Дате загрузки';

  @override
  String get searchSortViewCount => 'Количеству просмотров';

  @override
  String get clearSearchHistory => 'Очистить историю поиска';

  @override
  String get appLogs => 'Журнал приложения';

  @override
  String get appLogsDescription =>
      'Получите логи того, что происходит в приложении, может быть полезно при сообщении проблем';

  @override
  String get copyToClipBoard => 'Копировать в буфер обмена';

  @override
  String get logsCopied => 'Логи скопированы в буфер обмена';

  @override
  String get rememberSubtitleLanguage => 'Запомнить язык субтитров';

  @override
  String get videoFilters => 'Фильтры видео';

  @override
  String nFilters(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString фильтров',
      one: '1 фильтр',
      zero: 'Нет видео',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'Скрывать или прятать видео из всех лент в приложении на основе заданных ниже фильтров. Это позволяет вам, например, скрыть спойлеры к фильму или скрыть Shorts от определённого канала.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Задайте правила для фильтрации видео';

  @override
  String get videoFilterAllChannels => 'Все каналы';

  @override
  String get addVideoFilter => 'Создать фильтр';

  @override
  String get editVideoFilter => 'Изменить фильтр';

  @override
  String get videoFilterType => 'Тип';

  @override
  String get videoFilterOperation => 'Операция';

  @override
  String get videoFilterValue => 'Значение';

  @override
  String get save => 'Сохранить';

  @override
  String get videoFilterEditDescription =>
      'Выберите желаемый канал, тип фильтра, операцию и значение чтобы ОТФИЛЬТРОВАТЬ видео из лент. К примеру, тип: название видео, операция: содержит, значение: тест будет ИСКЛЮЧАТЬ все видео со словом тест в их названии.';

  @override
  String get optional => 'по желанию';

  @override
  String get videoFilterHideLabel => 'Скрыть';

  @override
  String get videoFilterFilterLabel => 'Спрятать';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter видео где $type $operation \"$value\".';
  }

  @override
  String get videoFiltered => 'Видео отфильтровано по следующим причинам:';

  @override
  String get videoFilterTapToReveal => 'Нажмите чтобы показать';

  @override
  String get videoFilterHide => 'Скрывать отфильтрованные видео';

  @override
  String get videoFilterHideDescription =>
      'По умолчанию отфильтрованные видео не скрыты, а показаны как спрятанные с причинами, по которым они были отфильтрованы. Этот параметр уберёт отфильтрованные видео с лент.';

  @override
  String get videoFilterNoFilters =>
      'Фильтров нет, нажмите на + внизу чтобы начать добавлять фильтры.';

  @override
  String get videoFilterTypeVideoTitle => 'Название видео';

  @override
  String get videoFilterTypeChannelName => 'Название канала';

  @override
  String get videoFilterTypeVideoLength => 'Длительность видео (в секундах)';

  @override
  String get videoFilterOperationContains => 'Содержит';

  @override
  String get videoFilterOperationNotContain => 'Не содержит';

  @override
  String get videoFilterOperationLowerThan => 'Меньше чем';

  @override
  String get videoFilterOperationHigherThan => 'Больше чем';

  @override
  String get channel => 'Канал';

  @override
  String get videoFilterHideAllFromChannel => 'Фильтровать все видео от канала';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter все видео от канала';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Автоматически менять язык субтитров на последний выбранный если доступно';

  @override
  String get lockFullScreenToLandscape =>
      'Блокировка полноэкранной ориентации к пропорциям видео';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Блокирует полноэкранную ориентацию на основе формата видео, ландшафтная для горизонтальных видео и портретная для вертикальных';

  @override
  String get fillFullscreen => 'Увеличивать видео за рамки экрана';

  @override
  String get fillFullscreenDescription =>
      'Растягивает видео чтобы оно занимало весь экран в полноэкранном режиме';

  @override
  String get rememberPlaybackSpeed => 'Запомнить скорость воспроизведения';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Автоматически менять скорость воспроизведения на последнюю выбранную';

  @override
  String get downloads => 'Скачивания';

  @override
  String get download => 'Скачать';

  @override
  String get videoAlreadyDownloaded => 'Видео уже скачано';

  @override
  String get noDownloadedVideos =>
      'Загруженных видео нет, найдите, нажмите и удерживайте видео и нажмите на кнопку загрузки на экране видео чтобы его скачать';

  @override
  String get downloadsPlayAll => 'Смотреть все';

  @override
  String get videoDownloadStarted => 'Началось скачивание видео';

  @override
  String get videoFailedDownloadRetry =>
      'Скачивание не удалось, нажмите чтобы начать заново';

  @override
  String get videoDownloadAudioOnly => 'Только звук';

  @override
  String get manageSubscriptions => 'Управление подписками';

  @override
  String get noSubscriptions =>
      'Подписок нет, ищите видео и подписывайтесь на любые понравившиеся вам каналы.';

  @override
  String get youCanSubscribeAgainLater =>
      'Позже вы сможете снова подписаться на этот канал';

  @override
  String get unSubscribeQuestion => 'Отписаться?';

  @override
  String get clearHistoryQuestion => 'Очистить историю?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Это очистит историю просмотра из вашего аккаунта на используемом вами сервере Invidious. Данное действие нельзя отменить.';

  @override
  String get noHistory =>
      'Истории просмотра нет, откройте любые видео и они появятся здесь';

  @override
  String get homeLayoutEditor => 'Изменить расстановку главного меню';

  @override
  String get layoutEditorAddVideoSource => 'Добавить источник видео';

  @override
  String get layoutEditorExplanation =>
      'Вы можете решить что показать на главной странице, у вас может быть до 2 маленьких представлений с горизонтальной прокруткой и один большой источник.';

  @override
  String get home => 'Главная';

  @override
  String get library => 'Библиотека';

  @override
  String get customizeAppLayout => 'Настроить разделы приложения';

  @override
  String get customizeAppLayoutExplanation =>
      'Выберите какие разделы вы хотите видеть на панели навигации приложения. Нажмите на значок дома чтобы выбрать страницу, которая будет показываться при запуске приложения. Вы можете сортировать разделы перетаскиванием.';

  @override
  String get navigationBarStyle => 'Стиль панели навигации';

  @override
  String get navigationBarLabelAlwaysShowing => 'Всегда показывать названия';

  @override
  String get navigationBarLabelShowOnSelect =>
      'Показывать название на выбранном элементе';

  @override
  String get navigationBarLabelNeverShow => 'Не показывать названия';

  @override
  String get distractionFreeMode => 'Режим фокусировки';

  @override
  String get distractionFreeModeDescription =>
      'Отключить комментарии и рекомендации';

  @override
  String get secondsShortForm => 'с';

  @override
  String get videoFilterApplyDateToFilter =>
      'Фильтровать видео в выбранное время';

  @override
  String get videoFilterDayOfWeek => 'Выберите дни применения фильтров';

  @override
  String get videoFilterDayOfWeekDescription =>
      'Вы можете выборочно настроить дни недели и время, в которые будут применяться фильтры, например, для того, чтобы не узнать результаты спортивных мероприятий заранее.';

  @override
  String get videoFilterStartTime => 'Время начала';

  @override
  String get videoFilterEndTime => 'Время конца';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Действует на $selectedDays';
  }

  @override
  String get from => 'От';

  @override
  String get to => 'До';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'От $from до $to';
  }

  @override
  String get notifications => 'Уведомления';

  @override
  String get notificationsDescription =>
      'Включите и рассмотрите, о чём вас уведомляют';

  @override
  String get enableNotificationDescriptions =>
      'Запускает приоритетный сервис для проверки и оповещения об изменениях, за которыми вы следите';

  @override
  String get subscriptionNotification => 'Уведомления подписок';

  @override
  String get subscriptionNotificationDescription =>
      'Получайте уведомления о новых видео из ваших подписок если вы авторизованы на текущем сервере';

  @override
  String get subscriptionNotificationTitle => 'Новые видео из ваших подписок';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'появилось $countString новых видео',
      one: 'появилось 1 новое видео',
      zero: 'нет новых видео',
    );
    return 'В ваших подписках $_temp0';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Необходимо выключить оптимизацию расхода батареи';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'Для того чтобы присылать уведомления Clipious требуется запускать фоновые сервисы. Для стабильной работы необходимо чтобы Clipious имел доступ к неограниченному расходу батареи, нажатие на ОК откроет настройки оптимизации расхода батареи.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Уведомления отключены';

  @override
  String get askToEnableBackgroundServiceContent =>
      'Для того чтобы получать оповещения, уведомления Clipious должны быть включены, чтобы это сделать нажмите ОК.';

  @override
  String get otherNotifications =>
      'Другие источники уведомлений (значки с колокольчиком)';

  @override
  String get deleteChannelNotificationTitle => 'Удалить уведомления от канала?';

  @override
  String get deleteChannelNotificationContent =>
      'Вы больше не будете получать уведомления от этого канала.';

  @override
  String get deletePlaylistNotificationTitle =>
      'Удалить уведомления от плейлиста?';

  @override
  String get deletePlaylistNotificationContent =>
      'Вы больше не будете получать уведомления от этого плейлиста.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Новые видео от $channel';
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
      other: 'появилось $countString новых видео',
      one: 'появилось 1 новое видео',
      zero: 'нет новых видео',
    );
    return 'У $channel $_temp0';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'Новые видео в плейлисте $playlist';
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
      other: 'появилось $countString новых видео',
      one: 'появилось 1 новое видео',
      zero: 'нет новых видео',
    );
    return 'В плейлисте $playlist $_temp0';
  }

  @override
  String get foregroundServiceNotificationTitle => 'Мониторинг видео';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'каждый час',
        '24': 'каждый день',
        'other': 'каждые $hours часов',
      },
    );
    return 'Проверки на новые видео будут $_temp0';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'Проверяются подписки...';

  @override
  String get foregroundServiceUpdatingPlaylist => 'Проверяются плейлисты...';

  @override
  String get foregroundServiceUpdatingChannels => 'Проверяются каналы...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Частота проверки новых видео';

  @override
  String get notificationFrequencySettingsDescription =>
      'Насколько часто приложение будет проверять наличие новых видео';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '1д',
        'other': '$hoursч',
      },
    );
    return '$_temp0';
  }

  @override
  String get subtitlesBackground => 'Задний фон субтитров';

  @override
  String get subtitlesBackgroundDescription =>
      'Добавляет к субтитрам чёрный фон чтобы сделать их разборчивее';

  @override
  String get history => 'История';

  @override
  String get deArrowSettingDescription =>
      'Заменить кликбейтные заголовки и превью';

  @override
  String get deArrowReplaceThumbnails => 'Заменить превью';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Замените превью видео в дополнение к заголовкам';

  @override
  String get deArrowWarning =>
      'Включение DeArrow может значительно снизить быстродействие приложения, так как для каждого видео потребуются дополнительные http-запросы';

  @override
  String get copySettingsAsJson =>
      'Скопировать настройки в формате JSON в буфер обмена';

  @override
  String get copySettingsAsJsonDescription =>
      'Скопировать настройки в формате JSON, чтобы облегчить отладку, если у вас возникнет проблема с приложением и вы решите поднять обсуждение о ней';

  @override
  String get seeking => 'Перемотка';

  @override
  String get skipStep => 'Перемотка двойным нажатием';

  @override
  String get skipStepDescription =>
      'Количество секунд для перемотки двойным нажатием';

  @override
  String get exponentialSkip => 'Нарастающая перемотка';

  @override
  String get exponentialSkipDescription =>
      'Количество секунд одной перемотки вперёд возрастает с каждым нажатием.';

  @override
  String get fullscreenOnLandscape => 'Полный экран при ландшафтном режиме';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Переходить в полноэкранный режим при горизонтальном повороте устройства';

  @override
  String get enabled => 'Включено';

  @override
  String get submitFeedback => 'Отправить отзыв';

  @override
  String get submitFeedbackDescription =>
      'Нашли ошибку или у вас есть предложение? Используйте этот инструмент, чтобы сделать скриншот приложения, добавить аннотации и отправить отзыв';

  @override
  String get feedbackDisclaimer =>
      'Чтобы отправить отзыв, вам понадобится учётная запись GitHub, и ваш скриншот будет отправлен в Imgur анонимно.';

  @override
  String get feedbackScreenshotError => 'Ошибка при загрузке скриншота в Imgur';

  @override
  String get channelSortByNewest => 'Новейшие';

  @override
  String get channelSortByOldest => 'Старейшие';

  @override
  String get channelSortByPopular => 'Популярные';

  @override
  String get invidiousAccount => 'Аккаунт Invidious';

  @override
  String get onDeviceSubscriptions => 'На устройстве';

  @override
  String get both => 'Оба';

  @override
  String get refresh => 'Обновить';

  @override
  String get addBasicAuth => 'Добавить Базовую Аутентификацию';

  @override
  String get addBasicAuthExplanation =>
      'Если ваш сервер требует базовой HTTP-аутентификации, добавьте информацию сдесь. Это не информация о вашем аккаунте invidious';

  @override
  String get addHeader => 'Добавить заголовок';

  @override
  String get advancedConfiguration => 'Расширенная Конфигурация';

  @override
  String get customHeaders => 'Собственный заголовок';

  @override
  String get customHeadersExplanation =>
      'Выберите собственный заголовок который будет отправлен серверу invidious';

  @override
  String get value => 'Значение';

  @override
  String get testAndAddServer => 'Проверить и добавить сервер';

  @override
  String get alsoTestServerConfig =>
      'Также проверить конфигурацию сервера, чтобы миниатюры отображались корректно';

  @override
  String get serverAlreadyExists => 'Сервер уже есть в настройках';

  @override
  String get wrongThumbnailConfiguration =>
      'Сервер работает, но сконфигурирован некорректно, миниатюры видео и каналов не будут отображаться правильно. Выключите проверку конфигурации сервера если вы согласны с этим, в противном случая починить свой сервер';

  @override
  String get openWikiLink => 'Откройте вики для получения помощи';

  @override
  String get serverUnreachable =>
      'Сервер не готов, или это неправильный сервер invidious';

  @override
  String get copyToDownloadFolder => 'Скопировано в загрузучную папку';

  @override
  String get fileCopiedToDownloadFolder =>
      'Файл скопирован в загрузучную папку';

  @override
  String get videoDeleted => 'Видео удалено';

  @override
  String get sleepTimer => 'Таймер сна';

  @override
  String get stopTheVideo => 'Остановить видео';

  @override
  String get stopTheVideoExplanation =>
      'Если включено, то видео будет закрыто, если выключено то видео просто остановится';

  @override
  String get setTimer => 'Задать таймер';

  @override
  String get cancelSleepTimer => 'Отменить таймер сна';

  @override
  String premieresIn(Object formattedDuration) {
    return 'Премьера в $formattedDuration';
  }

  @override
  String get screenControls => 'Контроль экрана';

  @override
  String get screenControlsExplanation =>
      'Когда вы смотрите видео на полном экране, вертикальные проведения слева или справа будут менять яркость или громкость';

  @override
  String get retry => 'Попробовать снова';

  @override
  String get forceTvUi => 'Принудительный интерфейс телевизора';

  @override
  String get forceTvUiExplanation =>
      'Принудительное использование интерфейса телевизора, что может быть полезно для устройств, не имеющих системной конфигурации leanback. Требуется перезапуск';

  @override
  String get noPublicServers => 'Нет общедоступных серверов';

  @override
  String get tapToSeeHow => 'Нажмите чтобы увидеть, как хостить свой';

  @override
  String get referToInvidiousWebsiteForHostingInstructions =>
      'Обратитесь к сайту Invidious за инструкциями по размещению invidious';
}
