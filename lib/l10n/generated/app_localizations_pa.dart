// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get subscriptions => 'ਸਬਸਕ੍ਰਿਪਸ਼ਨਜ਼';

  @override
  String get playlists => 'ਪਲੇਅ-ਲਿਸਟ';

  @override
  String get popular => 'ਹਰਮਨਪਿਆਰੇ';

  @override
  String get trending => 'ਰੁਝਾਨ ਵਿੱਚ';

  @override
  String get noVideoInPlayList => 'ਪਲੇਲਿਸਟ ਵਿੱਚ ਕੋਈ ਵੀਡੀਓ ਨਹੀਂ ਹੈ';

  @override
  String get removeFromPlayList => 'ਪਲੇਅ- ਲਿਸਟ ਤੋਂ ਹਟਾਓ';

  @override
  String get deletePlayListQ => 'ਪਲੇਅ-ਲਿਸਟ ਮਿਟਾਓ?';

  @override
  String get irreversibleAction => 'ਇਹ ਕਾਰਵਾਈ ਨਾ-ਬਦਲਣਯੋਗ ਹੈ';

  @override
  String get addPlayList => 'ਪਲੇਅ-ਲਿਸਟ ਸ਼ਾਮਿਲ ਕਰੋ';

  @override
  String get playListName => 'ਪਲੇਅ-ਲਿਸਟ ਦਾ ਨਾਮ';

  @override
  String get playlistVisibility => 'ਦਿਖਣਯੋਗਤਾ';

  @override
  String get publicPlaylist => 'ਜਨਤਕ';

  @override
  String get privatePlaylist => 'ਪ੍ਰਾਈਵੇਟ';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get add => 'ਸ਼ਾਮਿਲ ਕਰੋ';

  @override
  String get unlistedPlaylist => 'ਨਾ- ਲਿਸਟਡ';

  @override
  String get info => 'ਜਾਣਕਾਰੀ';

  @override
  String get videos => 'ਵੀਡੀਓਜ਼';

  @override
  String get streams => 'ਸਟ੍ਰੀਮਾਂ';

  @override
  String get latestVideos => 'ਨਵੀਨਤਮ ਵੀਡੀਓ';

  @override
  String get subscribed => 'ਸਬਸਕ੍ਰਾਈਬ ਹੈ';

  @override
  String get subscribe => 'ਸਬਸਕ੍ਰਾਈਬ';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'No subscribers',
        'other': '$count subscribers',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Share';

  @override
  String get shareYoutubeLink => 'ਯੂਟਿਊਬ ਲਿੰਕ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get shareInvidiousLink => 'ਇਨਵਿਡੀਅਸ ਲਿੰਕ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get redirectInvidiousLink => 'Invidious ਰੀਡਾਇਰੈਕਟ ਲਿੰਕ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get shareLinkWithTimestamp => 'Add timestamp';

  @override
  String get ok => 'ਠੀਕ ਹੈ';

  @override
  String get noChannels => 'ਕੋਈ ਚੈਨਲ ਨਹੀਂ';

  @override
  String get noPlaylists => 'ਕੋਈ ਪਲੇਅ-ਲਿਸਟ ਨਹੀਂ';

  @override
  String get channels => 'ਚੈਨਲ';

  @override
  String get couldntLoadVideo => 'ਵੀਡੀਓ ਲੋਡ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ';

  @override
  String get comments => 'ਟਿੱਪਣੀਆਂ';

  @override
  String get recommended => 'ਸਿਫਾਰਿਸ਼ ਕੀਤੇ';

  @override
  String get couldntFetchVideos =>
      'ਵੀਡੀਓ ਪ੍ਰਾਪਤ ਨਹੀਂ ਕੀਤੀਆਂ ਜਾ ਸਕੀਆਂ। ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਟੈਪ ਕਰੋ।';

  @override
  String get wizardIntro =>
      'ਇੱਕ ਜਨਤਕ ਸਰਵਰ ਚੁਣੋ ਜਾਂ ਆਪਣਾ ਖੁਦ ਦਾ ਸਰਵਰ ਸ਼ਾਮਲ ਕਰੋ। (ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਬਾਅਦ ਵਿੱਚ ਜਾ ਕੇ ਬਦਲਿਆ ਜਾ ਸਕਦਾ ਹੈ)';

  @override
  String get startUsingClipious => 'ਕਲਿੱਪੀਅਸ ਵਰਤਣਾ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get videoAddedToPlaylist => 'ਵੀਡੀਓ ਪਲੇਅ-ਲਿਸਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕੀਤਾ';

  @override
  String get videoAddedToQueue => 'Video added to queue';

  @override
  String get errorAddingVideoToPlaylist =>
      'ਵੀਡੀਓ ਨੂੰ ਪਲੇਅਲਿਸਟ ਵਿੱਚ ਜੋੜਨ ਦੌਰਾਨ ਤਰੁੱਟੀ';

  @override
  String get itemlistErrorGeneric => 'Could not fetch data';

  @override
  String get itemListErrorInvalidScope =>
      'You don\'t have the permission to see this, if you logged in using the token method try to log out and in again';

  @override
  String get selectPlaylist => 'ਪਲੇਅ-ਲਿਸਟ ਚੁਣੋ';

  @override
  String get createNewPlaylist => 'ਨਵੀਂ ਪਲੇਅ-ਲਿਸਟ ਬਣਾਓ';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString replies',
      one: '1 reply',
      zero: 'No replies',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'ਹੋਰ ਲੋਡ ਕਰੋ';

  @override
  String get topSorting => 'ਚੋਟੀ ਦੇ';

  @override
  String get newSorting => 'ਨਵੇਂ-ਨਕੋਰ';

  @override
  String get streamIsLive => 'ਲਾਈਵ';

  @override
  String get sponsorSkipped => 'ਸਪਾਂਸਰ ਨੂੰ ਸਕਿੱਪ ਕੀਤਾ';

  @override
  String get selectBrowsingCountry => 'ਦੇਸ਼ ਚੁਣੋ';

  @override
  String get showOnStart => 'ਚੁਣੋ ਕਿ ਜਦੋਂ ਐਪ ਸ਼ੁਰੂ ਹੁੰਦੀ ਹੈ ਤਾਂ ਕੀ ਵਿਖਾਉਣਾ ਹੈ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get browsing => 'ਬ੍ਰਾਊਜ਼ਿੰਗ';

  @override
  String get country => 'ਦੇਸ਼';

  @override
  String get whenAppStartsShow => 'ਜਦੋਂ ਐਪ ਸ਼ੁਰੂ ਹੁੰਦੀ ਹੈ, ਤਾਂ ਵਿਖਾਓ…';

  @override
  String get servers => 'ਸਰਵਰ';

  @override
  String get manageServers => 'ਸਰਵਰ ਪ੍ਰਬੰਧਨ';

  @override
  String currentServer(String current) {
    return 'ਵਰਤਮਾਨ ਵਿੱਚ $current ਦੀ ਵਰਤੋਂ ਕਰ ਰਿਹਾ ਹੈ';
  }

  @override
  String get useSponsorBlock => 'ਸਪਾਂਸਰਬਲਾਕ ਦੀ ਵਰਤੋਂ ਕਰੋ';

  @override
  String get sponsorBlockDescription =>
      'ਕਮਿਊਨਿਟੀ ਦੁਆਰਾ ਸਬਮਿੱਟ ਕੀਤੇ ਸਪਾਂਸਰ ਹਿੱਸੇ ਛੱਡੋ';

  @override
  String get about => 'ਦੇ ਬਾਰੇ ਵਿੱਚ';

  @override
  String get name => 'ਨਾਂ';

  @override
  String get package => 'ਪੈਕੇਜ';

  @override
  String get version => 'ਸੰਸਕਰਣ';

  @override
  String get build => 'ਬਿਲਡ';

  @override
  String get addServer => 'ਸਰਵਰ ਸ਼ਾਮਿਲ ਕਰੋ';

  @override
  String get useThisServer => 'ਇਸ ਸਰਵਰ ਦੀ ਵਰਤੋਂ ਕਰੋ';

  @override
  String get logIn => 'ਲਾੱਗ-ਇਨ';

  @override
  String get delete => 'ਮਿਟਾਓ';

  @override
  String get invalidInvidiousServer => 'ਅਵੈਧ Invidious ਸਰਵਰ';

  @override
  String get yourServers => 'ਤੁਹਾਡੇ ਸਰਵਰ';

  @override
  String get loggedIn => 'ਲਾੱਗ-ਇਨ ਕੀਤਾ ਹੈ';

  @override
  String get notLoggedIn => 'ਲੌਗ ਇਨ ਨਹੀਂ ਹੈ';

  @override
  String get addServerHelpText =>
      'ਆਪਣੇ ਸਰਵਰ ਨੂੰ ਜੋੜਨ ਲਈ + ਬਟਨ ਦੀ ਵਰਤੋਂ ਕਰੋ ਜਾਂ ਕਿਸੇ ਜਨਤਕ ਸਰਵਰ \'ਤੇ ਟੈਪ ਕਰੋ ਅਤੇ ਇਸਨੂੰ ਜੋੜੋ।';

  @override
  String get publicServers => 'ਪਬਲਿਕ ਸਰਵਰ';

  @override
  String get loadingPublicServer => 'ਜਨਤਕ ਸਰਵਰਾਂ ਨੂੰ ਲੋਡ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ';

  @override
  String get tapToAddServer => 'ਆਪਣੀ ਸੂਚੀ ਵਿੱਚ ਸਰਵਰ ਸ਼ਾਮਿਲ ਕਰਨ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String get publicServersError =>
      'ਜਨਤਕ ਸਰਵਰਾਂ ਦੀ ਸੂਚੀ ਪ੍ਰਾਪਤ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕੀ। ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਲਈ ਟੈਪ ਕਰੋ।';

  @override
  String get appearance => 'ਦਿੱਖ';

  @override
  String get useDynamicTheme => 'ਗਤੀਸ਼ੀਲ ਰੰਗ';

  @override
  String get useDynamicThemeDescription =>
      'ਮੈਟੀਰੀਅਲ ਯੂ ਰੰਗਾਂ ਦੀ ਵਰਤੋਂ ਕਰੋ (ਸਿਰਫ਼ Android 12+ \'ਤੇ ਉਪਲਬਧ)';

  @override
  String get useDash => 'DASH ਦੀ ਵਰਤੋਂ ਕਰੋ';

  @override
  String get useDashDescription =>
      'DASH ਅਨੁਕੂਲ ਸਟ੍ਰੀਮਿੰਗ ਕਈ ਵਾਰ ਸਮੱਸਿਆ ਪੈਦਾ ਕਰ ਸਕਦੀ ਹੈ, Youtube ਇਸ ਨੂੰ ਥ੍ਰੋਟਲ ਕਰ ਸਕਦਾ ਹੈ।';

  @override
  String get videoPlayer => 'ਵੀਡੀਓ ਪਲੇਅਰ';

  @override
  String get videoListed => 'ਜਨਤਕ';

  @override
  String get videoUnlisted => 'ਗੈਰ-ਸੂਚੀਬੱਧ';

  @override
  String get videoIsFamilyFriendly => 'ਪਰਿਵਾਰਕ ਦੋਸਤਾਨਾ';

  @override
  String get tapToManage => 'ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String get authentication => 'ਪ੍ਰਮਾਣਿਕਤਾ';

  @override
  String get tokenLogin => 'ਟੋਕਨ ਨਾਲ ਲੌਗ ਇਨ ਕਰੋ';

  @override
  String get tokenLoginDescription => 'ਲਾੱਗ-ਇਨ ਕਰਨ ਦਾ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤਾ ਤਰੀਕਾ';

  @override
  String get cookieLogin => 'ਕੂਕੀ ਨਾਲ ਲਾੱਗ-ਇਨ ਕਰੋ';

  @override
  String get cookieLoginDescription =>
      'ਇਸ ਵਿਧੀ ਦੀ ਵਰਤੋਂ ਕਰੋ ਜੇਕਰ ਤੁਹਾਨੂੰ ਟੋਕਨ ਪ੍ਰਮਾਣਿਕਤਾ ਨਾਲ ਸਮੱਸਿਆਵਾਂ ਦਾ ਸਾਹਮਣਾ ਕਰਨਾ ਪੈਂਦਾ ਹੈ';

  @override
  String get logout => 'ਲਾੱਗ ਆਊਟ';

  @override
  String get username => 'ਯੂਜ਼ਰਨੇਮ';

  @override
  String get password => 'Password';

  @override
  String get wrongUsernamePassword => 'Wrong username or password';

  @override
  String get error => 'Error';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats is not as expected';

  @override
  String get malformedStatsEndpointDescription =>
      'The server stats endpoint did not respond an expected payload, the key \"software.name\" should be equal to \"invidious\".\nResponse from the server:';

  @override
  String get serverIsNotReachable => 'Server is not reachable';

  @override
  String get videoQueue => 'Video queue';

  @override
  String get addToQueueList => 'Add to queue';

  @override
  String get addToPlaylist => 'Add to playlist';

  @override
  String get playNext => 'Play next';

  @override
  String get playNextAddedToQueue => 'Video will play next';

  @override
  String get addRecommendedToQueue => 'Auto-play recommended next';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Select which type of segments to skip';

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
  String get pressDownToShowSettings => 'Press down to show settings';

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
  String get searchHistoryDescription => 'Search history settings';

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
