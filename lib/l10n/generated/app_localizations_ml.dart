// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get subscriptions => 'Subscriptions';

  @override
  String get playlists => 'Playlists';

  @override
  String get popular => 'ജനപ്രിയമായത്';

  @override
  String get trending => 'Trending';

  @override
  String get noVideoInPlayList => 'No video in playlist';

  @override
  String get removeFromPlayList => 'Remove from playlist';

  @override
  String get deletePlayListQ => 'Delete Playlist?';

  @override
  String get irreversibleAction => 'This action is irreversible';

  @override
  String get addPlayList => 'Add Playlist';

  @override
  String get playListName => 'Playlist name';

  @override
  String get playlistVisibility => 'ദൃശ്യപരത';

  @override
  String get publicPlaylist => 'പൊതു';

  @override
  String get privatePlaylist => 'സ്വകാര്യ';

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get add => 'ചേർക്കുക';

  @override
  String get unlistedPlaylist => 'Unlisted';

  @override
  String get info => 'വിവരം';

  @override
  String get videos => 'Videos';

  @override
  String get streams => 'Streams';

  @override
  String get latestVideos => 'Latest Videos';

  @override
  String get subscribed => 'Subscribed';

  @override
  String get subscribe => 'Subscribe';

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
  String get share => 'പങ്കിടുക';

  @override
  String get shareYoutubeLink => 'Share YouTube link';

  @override
  String get shareInvidiousLink => 'Share Invidious link';

  @override
  String get redirectInvidiousLink => 'Share Invidious Redirect link';

  @override
  String get shareLinkWithTimestamp => 'Add timestamp';

  @override
  String get ok => 'ശരി';

  @override
  String get noChannels => 'No channels';

  @override
  String get noPlaylists => 'No playlists';

  @override
  String get channels => 'Channels';

  @override
  String get couldntLoadVideo => 'Could not load the video';

  @override
  String get comments => 'അഭിപ്രായങ്ങൾ';

  @override
  String get recommended => 'ശുപാർശ ചെയ്ത';

  @override
  String get couldntFetchVideos => 'Could not fetch videos. Tap to try again.';

  @override
  String get wizardIntro =>
      'Select a public server or add your own. (Can be changed later in the settings)';

  @override
  String get startUsingClipious => 'Start using Clipious';

  @override
  String get videoAddedToPlaylist => 'Video added to playlist';

  @override
  String get videoAddedToQueue => 'Video added to queue';

  @override
  String get errorAddingVideoToPlaylist =>
      'Error while adding video to playlist';

  @override
  String get itemlistErrorGeneric => 'Could not fetch data';

  @override
  String get itemListErrorInvalidScope =>
      'You don\'t have the permission to see this, if you logged in using the token method try to log out and in again';

  @override
  String get selectPlaylist => 'Select playlist';

  @override
  String get createNewPlaylist => 'Create new playlist';

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
  String get loadMore => 'Load more';

  @override
  String get topSorting => 'മുകളിൽ';

  @override
  String get newSorting => 'പുതിയത്';

  @override
  String get streamIsLive => 'തത്സമയം';

  @override
  String get sponsorSkipped => 'Sponsor skipped';

  @override
  String get selectBrowsingCountry => 'Select browsing country';

  @override
  String get showOnStart => 'Select what to show when the app starts';

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get browsing => 'Browsing';

  @override
  String get country => 'രാജ്യം';

  @override
  String get whenAppStartsShow => 'When the app starts, show…';

  @override
  String get servers => 'Servers';

  @override
  String get manageServers => 'Manage servers';

  @override
  String currentServer(String current) {
    return 'നിലവിൽ $current ഉപയോഗിക്കുന്നു';
  }

  @override
  String get useSponsorBlock => 'SponsorBlock ഉപയോഗിക്കുക';

  @override
  String get sponsorBlockDescription =>
      'Skip sponsor segments submitted by the community';

  @override
  String get about => 'കുറിച്ച്';

  @override
  String get name => 'പേര്';

  @override
  String get package => 'Package';

  @override
  String get version => 'പതിപ്പ്';

  @override
  String get build => 'Build';

  @override
  String get addServer => 'Add server';

  @override
  String get useThisServer => 'Use this server';

  @override
  String get logIn => 'Log in';

  @override
  String get delete => 'ഇല്ലാതാക്കുക';

  @override
  String get invalidInvidiousServer => 'Invalid Invidious server';

  @override
  String get yourServers => 'Your servers';

  @override
  String get loggedIn => 'Logged in';

  @override
  String get notLoggedIn => 'Not logged in';

  @override
  String get addServerHelpText =>
      'Use the + button to add your own servers or tap on a public server and add it.';

  @override
  String get publicServers => 'Public servers';

  @override
  String get loadingPublicServer => 'Loading public servers';

  @override
  String get tapToAddServer => 'Tap to add server to your list';

  @override
  String get publicServersError =>
      'Could not fetch list of public servers. Tap to retry.';

  @override
  String get appearance => 'രൂപഭാവം';

  @override
  String get useDynamicTheme => 'Dynamic colors';

  @override
  String get useDynamicThemeDescription =>
      'Use Material You colors (only available on Android 12+)';

  @override
  String get useDash => 'Use DASH';

  @override
  String get useDashDescription =>
      'DASH adaptive streaming can sometimes be problematic, Youtube can throttle it.';

  @override
  String get videoPlayer => 'Video player';

  @override
  String get videoListed => 'പരസ്യമായ';

  @override
  String get videoUnlisted => 'Unlisted';

  @override
  String get videoIsFamilyFriendly => 'കുടുംബ സൗഹൃദപരമായ';

  @override
  String get tapToManage => 'കൈകാര്യം ചെയ്യാൻ തൊടുക';

  @override
  String get authentication => 'Authentication';

  @override
  String get tokenLogin => 'Log in with token';

  @override
  String get tokenLoginDescription => 'Recommended way to log in';

  @override
  String get cookieLogin => 'Log in with cookie';

  @override
  String get cookieLoginDescription =>
      'Use this method if you face issues with the token authentication';

  @override
  String get logout => 'Log out';

  @override
  String get username => 'ഉപയോക്തൃനാമം';

  @override
  String get password => 'Password';

  @override
  String get wrongUsernamePassword => 'Wrong username or password';

  @override
  String get error => 'പിശക്';

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
  String get addToQueueList => 'വരിയിലേക്ക് ചേർക്കുക';

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
  String get sponsorBlockCategoryMusicOffTopic => 'സംഗീതം: സംഗീതേതര വിഭാഗം';

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
  String get quality => 'ഗുണമേന്മ';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'ഉപശീർഷകങ്ങൾ';

  @override
  String get playbackSpeed => 'പിന്നണി വേഗത';

  @override
  String get blackBackground => 'കറുത്ത പശ്ചാത്തലം';

  @override
  String get blackBackgroundDescription => 'For dark theme on OLED screen';

  @override
  String get search => 'തിരയുക';

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
  String get themeLight => 'വെളിച്ചം';

  @override
  String get themeDark => 'ഇരുണ്ട';

  @override
  String get followSystem => 'വ്യവസ്ഥിതിയെ പിന്തുടരുക';

  @override
  String get requiresRestart => 'പ്രയോഗം പുനരാരംഭിക്കേണ്ടതുണ്ട്';

  @override
  String get appLanguage => 'പ്രയോഗ ഭാഷ';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString വീഡിയോകൾ',
      one: '1 വീഡിയോ',
      zero: 'വീഡിയോകൾ ഇല്ല',
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
  String get searchUploadDateAny => 'ഏതെങ്കിലും തീയതി';

  @override
  String get searchUploadDateHour => 'അവസാന മണിക്കൂർ';

  @override
  String get searchUploadDateToday => 'ഇന്ന്';

  @override
  String get searchUploadDateWeek => 'ഈ ആഴ്ച';

  @override
  String get searchUploadDateMonth => 'ഈ മാസം';

  @override
  String get searchUploadDateYear => 'ഈ വർഷം';

  @override
  String get searchDuration => 'ദൈർഘ്യം';

  @override
  String get searchDurationAny => 'Any duration';

  @override
  String get searchDurationShort => 'Short (<4 minutes)';

  @override
  String get searchDurationLong => 'Long (>20 minutes)';

  @override
  String get searchDurationMedium => 'Medium (4-20 minutes)';

  @override
  String get searchSortBy => 'ഇങ്ങനെ അടുക്കുക';

  @override
  String get searchSortRelevance => 'പ്രസക്തി';

  @override
  String get searchSortRating => 'Rating';

  @override
  String get searchSortUploadDate => 'Upload Date';

  @override
  String get searchSortViewCount => 'View Count';

  @override
  String get clearSearchHistory => 'തിരയൽ ചരിത്രം മായ്‌ക്കുക';

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
  String get videoFilterType => 'തരം';

  @override
  String get videoFilterOperation => 'പ്രവർത്തനം';

  @override
  String get videoFilterValue => 'മൂല്യം';

  @override
  String get save => 'Save';

  @override
  String get videoFilterEditDescription =>
      'Select an optional channel, a filter type, operation and a value to filter OUT videos from lists. Example, type: video name, operation: contains, value: test will EXCLUDE all the videos with the word test in their name.';

  @override
  String get optional => 'optional';

  @override
  String get videoFilterHideLabel => 'മറയ്ക്കുക';

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
  String get videoFilterOperationContains => 'അടങ്ങിയിരിക്കുന്നു';

  @override
  String get videoFilterOperationNotContain => 'അടങ്ങിയിട്ടില്ല';

  @override
  String get videoFilterOperationLowerThan => 'അതിനേക്കാൾ താന്നത്';

  @override
  String get videoFilterOperationHigherThan => 'അതിലും ഉയർന്നത്';

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
  String get home => 'പൂമുഖം';

  @override
  String get library => 'Library';

  @override
  String get customizeAppLayout => 'പ്രയോഗത്തിലെ വിഭാഗങ്ങൾ ഇഷ്ടാനുസൃതമാക്കുക';

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
      'വീഡിയോ അഭിപ്രായങ്ങളും ശുപാർശകളും പ്രവർത്തനരഹിതമാക്കുക';

  @override
  String get secondsShortForm => 'നിമി';

  @override
  String get videoFilterApplyDateToFilter => 'Filter videos on given times';

  @override
  String get videoFilterDayOfWeek => 'Select days to apply filters';

  @override
  String get videoFilterDayOfWeekDescription =>
      'You can selectively choose days of the week and time to which the filters apply to, for example, avoid sport events spoilers.';

  @override
  String get videoFilterStartTime => 'ആരംഭ സമയം';

  @override
  String get videoFilterEndTime => 'അവസാന സമയം';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Applied on $selectedDays';
  }

  @override
  String get from => 'മുതൽ';

  @override
  String get to => 'വരെ';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return '$from മുതൽ $to വരെ';
  }

  @override
  String get notifications => 'അറിയിപ്പുകൾ';

  @override
  String get notificationsDescription =>
      'നിങ്ങളെ അറിയിക്കുന്നത് പ്രവർത്തനക്ഷമമാക്കുകയും അവലോകനം ചെയ്യുകയും ചെയ്യുക';

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
  String get askToEnableBackgroundServiceTitle =>
      'അറിയിപ്പുകൾ നിർത്തിയിരിക്കുന്നു';

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
  String get subtitlesBackground => 'ഉപശീർഷക പശ്ചാത്തലം';

  @override
  String get subtitlesBackgroundDescription =>
      'ഉപശീർഷകങ്ങൾ കൂടുതൽ വായിക്കാൻ കഴിയുന്ന തരത്തിൽ ഒരു കറുത്ത പശ്ചാത്തലം ചേർക്കുന്നു';

  @override
  String get history => 'ചരിത്രം';

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
      'നിങ്ങൾ എത്രത്തോളം മുന്നോട്ട് നീങ്ങുന്നുവോ അത്രയും വലുതായിരിക്കും ചുവടുവെപ്പ്.';

  @override
  String get fullscreenOnLandscape => 'Full screen on landscape';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Switch to full screen when the device is rotated to landscape mode';

  @override
  String get enabled => 'പ്രവർത്തനക്ഷമമാക്കി';

  @override
  String get submitFeedback => 'പ്രതികരണം സമർപ്പിക്കുക';

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
  String get channelSortByNewest => 'ഏറ്റവും പുതിയത്';

  @override
  String get channelSortByOldest => 'ഏറ്റവും പഴയത്';

  @override
  String get channelSortByPopular => 'ജനപ്രിയമായത്';

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
