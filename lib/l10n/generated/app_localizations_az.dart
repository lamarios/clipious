// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get subscriptions => 'Abunəliklər';

  @override
  String get playlists => 'Oynatma siyahıları';

  @override
  String get popular => 'Sevimli';

  @override
  String get trending => 'Trenddə olan';

  @override
  String get noVideoInPlayList => 'Oynatma siyahısında video yoxdur';

  @override
  String get removeFromPlayList => 'Oynatma siyahısından sil';

  @override
  String get deletePlayListQ => 'Oynatma siyahısı silinsin?';

  @override
  String get irreversibleAction => 'Bu fəaliyyət dəyişdirilə bilməz';

  @override
  String get addPlayList => 'Oynatma siyahısına əlavə et';

  @override
  String get playListName => 'Oynatma siyahısı adı';

  @override
  String get playlistVisibility => 'Görünmə';

  @override
  String get publicPlaylist => 'İctimai';

  @override
  String get privatePlaylist => 'Şəxsi';

  @override
  String get cancel => 'Ləğv et';

  @override
  String get add => 'Əlavə et';

  @override
  String get unlistedPlaylist => 'Siyahısız';

  @override
  String get info => 'Məlumat';

  @override
  String get videos => 'Videolar';

  @override
  String get streams => 'Yayımlar';

  @override
  String get latestVideos => 'Son Videolar';

  @override
  String get subscribed => 'Abunə Olundu';

  @override
  String get subscribe => 'Abunə Ol';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Abunəçi yoxdur',
        'other': '$count abunəçi',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Paylaşım';

  @override
  String get shareYoutubeLink => 'YouTube bağlantısın paylaş';

  @override
  String get shareInvidiousLink => 'Invidious bağlantısın paylaş';

  @override
  String get redirectInvidiousLink => 'Invidious Yönləndirmə linkin paylaş';

  @override
  String get shareLinkWithTimestamp => 'Vaxt möhürü əlavə et';

  @override
  String get ok => 'Oldu';

  @override
  String get noChannels => 'Kanallar yoxdur';

  @override
  String get noPlaylists => 'Oynatma siyahıları yoxdur';

  @override
  String get channels => 'Kanallar';

  @override
  String get couldntLoadVideo => 'Videonu yükləmək alınmadı';

  @override
  String get comments => 'Şərhlər';

  @override
  String get recommended => 'Tövsiyə edilən';

  @override
  String get couldntFetchVideos =>
      'Videoları əldə etmək olmadı. Təkrar cəhd etmək üçün toxun.';

  @override
  String get wizardIntro =>
      'İctimai server seç və ya öz serverinizi əlavə edin.(Daha sonra tənzimləmələrdə dəyişdirilə bilər)';

  @override
  String get startUsingClipious => 'Clipious istifadə etməyə başla';

  @override
  String get videoAddedToPlaylist => 'Video oynatma siyahısına əlavə edildi';

  @override
  String get videoAddedToQueue => 'Video növbəyə əlavə edildi';

  @override
  String get errorAddingVideoToPlaylist =>
      'Oynatma siyahısına video əlavə edilərkən xəta';

  @override
  String get itemlistErrorGeneric => 'Məlumat əldə etmək alınmadı';

  @override
  String get itemListErrorInvalidScope =>
      'Bunu görmək icazəniz yoxdur. Əgər nişan üsulu işlədərək daxil olmusunuzsa, çıxmağa və təkrar daxil olmağa çalışın';

  @override
  String get selectPlaylist => 'Oynatma siyahısı seç';

  @override
  String get createNewPlaylist => 'Yeni oynatma siyahısı yarat';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString cavab',
      one: '1 cavab',
      zero: 'Cavab yoxdur',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Daha çox yüklə';

  @override
  String get topSorting => 'Ən yaxşı';

  @override
  String get newSorting => 'Yeni';

  @override
  String get streamIsLive => 'Canlı';

  @override
  String get sponsorSkipped => 'Sponsor ötürüldü';

  @override
  String get selectBrowsingCountry => 'Kəşf edilən ölkə seçin';

  @override
  String get showOnStart => 'Tətbiq başlayanda nə göstəriləcəyini seçin';

  @override
  String get settings => 'Tənzimləmələr';

  @override
  String get browsing => 'Kəşf edilən';

  @override
  String get country => 'Ölkə';

  @override
  String get whenAppStartsShow => 'Tətbiq başlayanda, göstər…';

  @override
  String get servers => 'Serverlər';

  @override
  String get manageServers => 'Serverləri idarə et';

  @override
  String currentServer(String current) {
    return '$current hazırda istifadə edilir';
  }

  @override
  String get useSponsorBlock => 'SponsorBlock İstifadə Et';

  @override
  String get sponsorBlockDescription =>
      'İcma tərəfindən təklif edilən sponsor bölümlərin ötür';

  @override
  String get about => 'Haqqında';

  @override
  String get name => 'Ad';

  @override
  String get package => 'Paket';

  @override
  String get version => 'Versiya';

  @override
  String get build => 'Qurulan';

  @override
  String get addServer => 'Server əlavə et';

  @override
  String get useThisServer => 'Bu serveri istifadə et';

  @override
  String get logIn => 'Daxil ol';

  @override
  String get delete => 'Sil';

  @override
  String get invalidInvidiousServer => 'Etibarsız Invidious Serveri';

  @override
  String get yourServers => 'Serverləriniz';

  @override
  String get loggedIn => 'Daxil olundu';

  @override
  String get notLoggedIn => 'Giriş edə bilmədin';

  @override
  String get addServerHelpText =>
      'Öz serverlərinizi əlavə etmək üçün + düyməsin istifadə edin və ya ictimai serverə toxunun və onu əlavə edin.';

  @override
  String get publicServers => 'İctimai serverlər';

  @override
  String get loadingPublicServer => 'İctimai serverlər yüklənilir';

  @override
  String get tapToAddServer => 'Siyahınıza server əlavə etmək üçün toxun';

  @override
  String get publicServersError =>
      'İctimai serverlərin siyahısın əldə etmək olmadı. Təkrar sınamaq üçün toxun.';

  @override
  String get appearance => 'Görünüş';

  @override
  String get useDynamicTheme => 'Dinamik rənglər';

  @override
  String get useDynamicThemeDescription =>
      'Material You rəngləri istifadə et (yalnız Android 12+/da mövcuddur)';

  @override
  String get useDash => 'DASH İstifadə Et';

  @override
  String get useDashDescription =>
      'DASH uyğun yayımı bəzən problemli ola bilər, Youtube bunu qısa bilər.';

  @override
  String get videoPlayer => 'Video oynadıcı';

  @override
  String get videoListed => 'İctimai';

  @override
  String get videoUnlisted => 'Siyahısız';

  @override
  String get videoIsFamilyFriendly => 'Ailə dostu';

  @override
  String get tapToManage => 'İdarə etmək üçün toxun';

  @override
  String get authentication => 'Təsdiqləmə';

  @override
  String get tokenLogin => 'Nişan ilə daxil ol';

  @override
  String get tokenLoginDescription => 'Giriş üçün tövsiyə olunan üsul';

  @override
  String get cookieLogin => 'Hesab ilə daxil olun';

  @override
  String get cookieLoginDescription =>
      'Nişan təsdiqləməsi ilə problemlərlə qarşılaşsanız, bu üsulu istifadə edin';

  @override
  String get logout => 'Çıxın';

  @override
  String get username => 'İstifadəçi adı';

  @override
  String get password => 'Parol';

  @override
  String get wrongUsernamePassword => 'Səhv istifadəçi adı və ya parol';

  @override
  String get error => 'Xəta';

  @override
  String get malformedStatsEndpoint => '/api/v1/status gözlənildiyi kimi deyil';

  @override
  String get malformedStatsEndpointDescription =>
      'Server statistikasının son çıxışı gözlənilən faydalı yükləmə cavabı vermədi, \"software.name\" açarı \"invidious\"a bərabər olmalıdır.\nServerdən cavab:';

  @override
  String get serverIsNotReachable => 'Server əlçatan deyil';

  @override
  String get videoQueue => 'Video növbəsi';

  @override
  String get addToQueueList => 'Növbəyə əlavə et';

  @override
  String get addToPlaylist => 'Pleylistə əlavə et';

  @override
  String get playNext => 'Növbətini oynat';

  @override
  String get playNextAddedToQueue => 'Növbətidə video oynadılacaq';

  @override
  String get addRecommendedToQueue => 'Auto-play recommended next';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Bölümlərin hansı növün ötürəcəyinizi seçin';

  @override
  String get sponsorBlockCategorySponsor => 'Sponsor';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Paid promotion, paid referrals and direct advertisements. Not for self-promotion or free shoutouts to causes/creators/websites/products they like.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => 'Unpaid/Self Promotion';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Similar to \"sponsor\" except for unpaid or self promotion. This includes sections about merchandise, donations, or information about who they collaborated ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Interaction Reminder (Subscribe)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'When there is a short reminder to like, subscribe or follow them in the middle of content. If it is long or about something specific, it should be under self promotion instead.';

  @override
  String get sponsorBlockCategoryIntro => 'Intermission/Intro Animation';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'An interval without actual content. Could be a pause, static frame, repeating animation. This should not be used for transitions containing information.';

  @override
  String get sponsorBlockCategoryOutro => 'Endcards/Credits';

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
  String get useProxy => 'Proxy videos';

  @override
  String get useProxyDescription =>
      'By proxying video streams from the server, you can bypass regional blocks or ISP blocking YouTube';

  @override
  String get pressDownToShowSettings =>
      'Tənzimləmələri göstərmək üçün aşağı bas';

  @override
  String get quality => 'Quality';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Subtitles';

  @override
  String get playbackSpeed => 'Playback speed';

  @override
  String get blackBackground => 'Black background';

  @override
  String get blackBackgroundDescription => 'For dark theme on OLED screen';

  @override
  String get search => 'Search';

  @override
  String get subtitleFontSize => 'Subtitles font size';

  @override
  String get subtitleFontSizeDescription =>
      'Change the size of the subtitles if it is too small or too big on your device';

  @override
  String get skipSslVerification => 'Skip SSL certificate verification';

  @override
  String get skipSslVerificationDescription =>
      'For using a self-signed SSL certificate, or when having SSL related issues with your server.';

  @override
  String get themeBrightness => 'Theme';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get followSystem => 'Follow system';

  @override
  String get requiresRestart => 'Requires app restart';

  @override
  String get appLanguage => 'App language';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString videos',
      one: '1 video',
      zero: 'No videos',
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
  String get autoplayVideoOnLoad => 'Automatically play video on load';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Automatically start playing the video after it has loaded';

  @override
  String get searchHistory => 'Search history';

  @override
  String get searchHistoryDescription => 'Axtarış tarixçəsi tənzimləmələri';

  @override
  String get enableSearchHistory => 'Enable search history';

  @override
  String get searchHistoryLimit => 'Search history limit';

  @override
  String get searchHistoryLimitDescription =>
      'Set how many previous searches will show up in suggestions';

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
  String get searchSortRelevance => 'Relevance';

  @override
  String get searchSortRating => 'Rating';

  @override
  String get searchSortUploadDate => 'Upload Date';

  @override
  String get searchSortViewCount => 'View Count';

  @override
  String get clearSearchHistory => 'Clear search history';

  @override
  String get appLogs => 'Application Logs';

  @override
  String get appLogsDescription =>
      'Get logs of what is happening in the application, can be useful to report issues';

  @override
  String get copyToClipBoard => 'Copy to clipboard';

  @override
  String get logsCopied => 'Logs copied to clipboard';

  @override
  String get rememberSubtitleLanguage => 'Remember subtitles language';

  @override
  String get videoFilters => 'Video filters';

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
      'Define rules to filter out videos';

  @override
  String get videoFilterAllChannels => 'All channels';

  @override
  String get addVideoFilter => 'Create filter';

  @override
  String get editVideoFilter => 'Edit filter';

  @override
  String get videoFilterType => 'Type';

  @override
  String get videoFilterOperation => 'Operation';

  @override
  String get videoFilterValue => 'Value';

  @override
  String get save => 'Save';

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
