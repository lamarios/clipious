// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get subscriptions => '订阅内容';

  @override
  String get playlists => '播放列表';

  @override
  String get popular => '热门';

  @override
  String get trending => '时下流行';

  @override
  String get noVideoInPlayList => '播放列表已无视频';

  @override
  String get removeFromPlayList => '从播放列表中移除';

  @override
  String get deletePlayListQ => '确定删除播放列表?';

  @override
  String get irreversibleAction => '该操作是无法倒置的，请慎重选择';

  @override
  String get addPlayList => '添加播放列表';

  @override
  String get playListName => '播放列表名称';

  @override
  String get playlistVisibility => '播放列表隐私设置';

  @override
  String get publicPlaylist => '公开';

  @override
  String get privatePlaylist => '私享';

  @override
  String get cancel => '取消';

  @override
  String get add => '添加';

  @override
  String get unlistedPlaylist => '不公开的播放列表';

  @override
  String get info => '信息';

  @override
  String get videos => '视频';

  @override
  String get streams => '直播';

  @override
  String get latestVideos => '频道最新视频';

  @override
  String get subscribed => '已订阅';

  @override
  String get subscribe => '订阅';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': '没有订阅者',
        'other': '$count位订阅者',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => '分享';

  @override
  String get shareYoutubeLink => '分享YouTube链接';

  @override
  String get shareInvidiousLink => '分享Invidious链接';

  @override
  String get redirectInvidiousLink => '分享重定向Invidious链接';

  @override
  String get shareLinkWithTimestamp => '分享带时间戳的链接';

  @override
  String get ok => '好的';

  @override
  String get noChannels => '无频道';

  @override
  String get noPlaylists => '无播放列表';

  @override
  String get channels => '频道';

  @override
  String get couldntLoadVideo => '无法加载视频';

  @override
  String get comments => '留言';

  @override
  String get recommended => '推荐';

  @override
  String get couldntFetchVideos => '无法获取视频。点击重试.';

  @override
  String get wizardIntro => '选择公共服务实例或添加您自己的实例。 （稍后可以在设置中更改。）';

  @override
  String get startUsingClipious => '开始使用Clipious';

  @override
  String get videoAddedToPlaylist => '视频成功添加到播放列表';

  @override
  String get videoAddedToQueue => '视频已加入队列';

  @override
  String get errorAddingVideoToPlaylist => '将视频添加到播放列表时出错';

  @override
  String get itemlistErrorGeneric => '无法抓取数据';

  @override
  String get itemListErrorInvalidScope => '你没有查看这个的权限，如果你使用token登录请尝试先登出再登入';

  @override
  String get selectPlaylist => '选择播放列表';

  @override
  String get createNewPlaylist => '新建播放列表';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString条回复',
      one: '1条回复',
      zero: '无回复',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => '加载更多';

  @override
  String get topSorting => '置顶';

  @override
  String get newSorting => '最新';

  @override
  String get streamIsLive => 'Live直播';

  @override
  String get sponsorSkipped => '跳过赞助商';

  @override
  String get selectBrowsingCountry => '选择浏览国家/地区';

  @override
  String get showOnStart => '选择应用程序启动时显示的内容';

  @override
  String get settings => '设置';

  @override
  String get browsing => '浏览';

  @override
  String get country => '国家/地区';

  @override
  String get whenAppStartsShow => '应用程序启动时，显示…';

  @override
  String get servers => '服务实例';

  @override
  String get manageServers => '管理服务实例';

  @override
  String currentServer(String current) {
    return '正使用 $current 实例';
  }

  @override
  String get useSponsorBlock => '使用 SponsorBlock';

  @override
  String get sponsorBlockDescription => '跳过公众提交的赞助商部分';

  @override
  String get about => '关于';

  @override
  String get name => '名称';

  @override
  String get package => '应用程序包';

  @override
  String get version => '版本';

  @override
  String get build => 'Build';

  @override
  String get addServer => '添加服务实例';

  @override
  String get useThisServer => '使用此实例';

  @override
  String get logIn => '登入';

  @override
  String get delete => '删除';

  @override
  String get invalidInvidiousServer => '无效的Invidious实例';

  @override
  String get yourServers => '您的服务实例';

  @override
  String get loggedIn => '已登入';

  @override
  String get notLoggedIn => '未登录';

  @override
  String get addServerHelpText => '使用 + 按钮添加您自己的服务实例或点击公共实例并添加它。';

  @override
  String get publicServers => '公共服务实例';

  @override
  String get loadingPublicServer => '正在加载公共服务实例';

  @override
  String get tapToAddServer => '点击以将服务实例添加到您的列表';

  @override
  String get publicServersError => '无法获取公共服务实例列表。点击重试。';

  @override
  String get appearance => '外观';

  @override
  String get useDynamicTheme => '动态色彩';

  @override
  String get useDynamicThemeDescription =>
      '使用 Material You 颜色（仅适用于 Android 12+）';

  @override
  String get useDash => '采用 DASH 视频流';

  @override
  String get useDashDescription => 'DASH 自适应视频流有时可能出现问题， YouTube 会阻止它。';

  @override
  String get videoPlayer => '正在播放';

  @override
  String get videoListed => '公开';

  @override
  String get videoUnlisted => '未列出';

  @override
  String get videoIsFamilyFriendly => '适合家庭观看';

  @override
  String get tapToManage => '点击管理';

  @override
  String get authentication => '认证';

  @override
  String get tokenLogin => '用密钥登录';

  @override
  String get tokenLoginDescription => '推荐登录方式';

  @override
  String get cookieLogin => 'Cookie登录';

  @override
  String get cookieLoginDescription => '如果密钥认证出现问题请采用此方式';

  @override
  String get logout => '退出';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get wrongUsernamePassword => '用户名或密码有误';

  @override
  String get error => '错误';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats 有未知问题';

  @override
  String get malformedStatsEndpointDescription =>
      '服务器在接收端中没有得到一个预期的数据包，”应用包名“应该在invidious之后。\n服务器反馈：';

  @override
  String get serverIsNotReachable => '无法连接到服务器';

  @override
  String get videoQueue => '已在队列中';

  @override
  String get addToQueueList => '添加到队列';

  @override
  String get addToPlaylist => '添加到播放列表';

  @override
  String get playNext => '下一个播放';

  @override
  String get playNextAddedToQueue => '即将播放的视频';

  @override
  String get addRecommendedToQueue => '自动播放推荐内容';

  @override
  String get sponsorBlockSettingsQuickDescription => '选择要跳过的赞助商片段类型';

  @override
  String get sponsorBlockCategorySponsor => '赞助商';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      '付费促销、付费推荐和直接广告。不是自我推销或免费推荐事业/创作者/网站/产品。';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => '未付费/自我推销';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      '类似于“赞助商”，除了无偿推广或自我推销。这包括有关商品、捐赠或有关他们合作商的部分 ';

  @override
  String get sponsorBlockCategoryInteraction => '互动提醒 （订阅）';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      '当有简短提醒时，请在内容中点赞、订阅或关注它们。如果是冗长或关于特定事物，它应该在自我推销。';

  @override
  String get sponsorBlockCategoryIntro => '间隙/介绍动画';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      '没有实际内容的间隔。可能是暂停、静态帧、重复动画。这不应该用于包含信息的过渡。';

  @override
  String get sponsorBlockCategoryOutro => '结束卡片/作品信息';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      '作品信息或 YouTube 结束卡片出现时。不是为信息作结论。';

  @override
  String get sponsorBlockCategoryPreview => '预览/回顾';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      '显示此视频或其他视频中的内容的剪辑合集，其中所有信息都会在视频的后面重复。';

  @override
  String get sponsorBlockCategoryFiller => '过滤题外话/笑话';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      '题外场景只为添加补白或幽默不影响理解视频主要内容。这不应包含内容和背景细节。这是一个非常激进的分类用于没心情享受“乐趣”时。';

  @override
  String get sponsorBlockCategoryMusicOffTopic => '音乐：非音乐部分';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      '只用于音乐视频，这个应用于未被其他分类覆盖的音乐视频。';

  @override
  String get useProxy => '使用代理';

  @override
  String get useProxyDescription => '通过服务实例代理视频流，可以解除区域和网络服务商的YouTube限制';

  @override
  String get pressDownToShowSettings => '按下显示设置项';

  @override
  String get quality => '画质';

  @override
  String get audio => '声音';

  @override
  String get subtitles => '字幕';

  @override
  String get playbackSpeed => '播放速度';

  @override
  String get blackBackground => '黑色背景';

  @override
  String get blackBackgroundDescription => '用于AMOLED 黑色主题背景';

  @override
  String get search => '搜索';

  @override
  String get subtitleFontSize => '字幕字体大小';

  @override
  String get subtitleFontSizeDescription => '如果字幕在屏幕上显示太小或太大可以改变字幕大小';

  @override
  String get skipSslVerification => '跳过 SSL 证书验证';

  @override
  String get skipSslVerificationDescription =>
      '用于使用自签名的SSL证书，或者当您的服务器出现SSL相关问题时。';

  @override
  String get themeBrightness => '主题';

  @override
  String get themeLight => '浅色主题';

  @override
  String get themeDark => '深色主题';

  @override
  String get followSystem => '跟随系统';

  @override
  String get requiresRestart => '需要重启应用';

  @override
  String get appLanguage => '应用语言';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString部视频',
      one: '1部视频',
      zero: '无视频',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation => '链接必须以http://或https://开头';

  @override
  String get returnYoutubeDislikeDescription =>
      '使用 returnyoutubedislike.com 提供的API显示可能不喜欢的视频';

  @override
  String get rydCustomInstance => '自定义BYD实例链接';

  @override
  String get rydCustomInstanceDescription => '使用自定义BYD实例，留空则使用默认实例';

  @override
  String get autoplayVideoOnLoad => '边加载边自动播放';

  @override
  String get autoplayVideoOnLoadDescription => '加载完成后自动播放';

  @override
  String get searchHistory => '搜索历史';

  @override
  String get searchHistoryDescription => '搜索历史设置';

  @override
  String get enableSearchHistory => '启用搜索历史';

  @override
  String get searchHistoryLimit => '搜索历史限制';

  @override
  String get searchHistoryLimitDescription => '设置在建议中显示的先前搜索记录的数量';

  @override
  String get shorts => '短视频';

  @override
  String get searchUploadDate => '上传日期';

  @override
  String get searchUploadDateAny => '任何日期';

  @override
  String get searchUploadDateHour => '上一个小时';

  @override
  String get searchUploadDateToday => '今天';

  @override
  String get searchUploadDateWeek => '当周';

  @override
  String get searchUploadDateMonth => '当月';

  @override
  String get searchUploadDateYear => '当年';

  @override
  String get searchDuration => '期间';

  @override
  String get searchDurationAny => '任何期间';

  @override
  String get searchDurationShort => '短（4分钟以下）';

  @override
  String get searchDurationLong => '长（20分钟以上）';

  @override
  String get searchDurationMedium => '中等（4至20分钟）';

  @override
  String get searchSortBy => '排序依据';

  @override
  String get searchSortRelevance => '相关度';

  @override
  String get searchSortRating => '收看数';

  @override
  String get searchSortUploadDate => '上传日期';

  @override
  String get searchSortViewCount => '播放量';

  @override
  String get clearSearchHistory => '清楚搜索历史';

  @override
  String get appLogs => '应用日志';

  @override
  String get appLogsDescription => '从应用日志中，可知道应用运行情况，有助于报告问题';

  @override
  String get copyToClipBoard => '复制到剪贴板';

  @override
  String get logsCopied => '复制日志到剪贴板';

  @override
  String get rememberSubtitleLanguage => '记住字幕语言';

  @override
  String get videoFilters => '视频筛选';

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
  String get videoFiltersSettingTileDescriptions => '定义过滤视频的规则';

  @override
  String get videoFilterAllChannels => '全部频道';

  @override
  String get addVideoFilter => '创建过滤器';

  @override
  String get editVideoFilter => '编辑过滤器';

  @override
  String get videoFilterType => '类型';

  @override
  String get videoFilterOperation => '操作';

  @override
  String get videoFilterValue => '值';

  @override
  String get save => '保存';

  @override
  String get videoFilterEditDescription =>
      'Select an optional channel, a filter type, operation and a value to filter OUT videos from lists. Example, type: video name, operation: contains, value: test will EXCLUDE all the videos with the word test in their name.';

  @override
  String get optional => '可选项';

  @override
  String get videoFilterHideLabel => '隐藏';

  @override
  String get videoFilterFilterLabel => '混淆';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter videos where $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered => '基于以下规则过滤视频：';

  @override
  String get videoFilterTapToReveal => '点击显示';

  @override
  String get videoFilterHide => '隐藏被过滤的视频';

  @override
  String get videoFilterHideDescription =>
      'By default filtered videos are not hidden but shown as obfuscated with the reason(s) why it has been filtered. This setting remove the filtered videos from lists.';

  @override
  String get videoFilterNoFilters => '没有视频过滤器，点击下方“+”按钮添加新视频过滤规则。';

  @override
  String get videoFilterTypeVideoTitle => '视频标题';

  @override
  String get videoFilterTypeChannelName => '频道名';

  @override
  String get videoFilterTypeVideoLength => '视频长度(秒)';

  @override
  String get videoFilterOperationContains => '包括';

  @override
  String get videoFilterOperationNotContain => '不包括';

  @override
  String get videoFilterOperationLowerThan => '小于';

  @override
  String get videoFilterOperationHigherThan => '大于';

  @override
  String get channel => '频道';

  @override
  String get videoFilterHideAllFromChannel => '过滤频道中所有的视频';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter频道中所有的视频';
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

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get subscriptions => '訂閱';

  @override
  String get playlists => '播放清單';

  @override
  String get popular => '熱門';

  @override
  String get trending => '趨勢';

  @override
  String get noVideoInPlayList => '播放清單中無影片';

  @override
  String get removeFromPlayList => '從播放清單中移除';

  @override
  String get deletePlayListQ => '確定刪除播放清單？';

  @override
  String get irreversibleAction => '這個操作無法復原，請謹慎選擇';

  @override
  String get addPlayList => '新增播放清單';

  @override
  String get playListName => '播放清單名稱';

  @override
  String get playlistVisibility => '播放清單隱私設定';

  @override
  String get publicPlaylist => '公開';

  @override
  String get privatePlaylist => '私人';

  @override
  String get cancel => '取消';

  @override
  String get add => '新增';

  @override
  String get unlistedPlaylist => '非公開的播放清單';

  @override
  String get info => '資訊';

  @override
  String get videos => '影片';

  @override
  String get streams => '串流';

  @override
  String get latestVideos => '最新影片';

  @override
  String get subscribed => '已訂閱';

  @override
  String get subscribe => '訂閱';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': '無訂閱者',
        'other': '$count位訂閱者',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => '分享';

  @override
  String get shareYoutubeLink => '分享 YouTube 連結';

  @override
  String get shareInvidiousLink => '分享 Invidious 連結';

  @override
  String get redirectInvidiousLink => '分享 Invidious 重定向連結';

  @override
  String get shareLinkWithTimestamp => '新增時間戳記';

  @override
  String get ok => '確定';

  @override
  String get noChannels => '無頻道';

  @override
  String get noPlaylists => '無播放清單';

  @override
  String get channels => '頻道';

  @override
  String get couldntLoadVideo => '無法載入影片';

  @override
  String get comments => '評論';

  @override
  String get recommended => '推薦';

  @override
  String get couldntFetchVideos => '無法取得影片。點選以再試一次。';

  @override
  String get wizardIntro => '選擇一個公開伺服器或新增您自己的伺服器。（可以稍後在設定中更改。）';

  @override
  String get startUsingClipious => '開始使用 Clipious';

  @override
  String get videoAddedToPlaylist => '影片已新增至播放清單';

  @override
  String get videoAddedToQueue => '影片已新增至佇列';

  @override
  String get errorAddingVideoToPlaylist => '新增影片至播放清單時出錯';

  @override
  String get itemlistErrorGeneric => '無法取得資料';

  @override
  String get itemListErrorInvalidScope =>
      '您沒有權限檢視此內容，如果您使用 token 方法登入，請嘗試登出並再次登入';

  @override
  String get selectPlaylist => '選擇播放清單';

  @override
  String get createNewPlaylist => '建立新的播放清單';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString條回覆',
      one: '1條回覆',
      zero: '無回覆',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => '載入更多';

  @override
  String get topSorting => '最熱門';

  @override
  String get newSorting => '最新';

  @override
  String get streamIsLive => '直播中';

  @override
  String get sponsorSkipped => '已跳過贊助商';

  @override
  String get selectBrowsingCountry => '選擇瀏覽國家';

  @override
  String get showOnStart => '選擇應用程式啟動時要顯示的內容';

  @override
  String get settings => '設定';

  @override
  String get browsing => '瀏覽';

  @override
  String get country => '國家';

  @override
  String get whenAppStartsShow => '當應用程式啟動時，顯示…';

  @override
  String get servers => '伺服器';

  @override
  String get manageServers => '管理伺服器';

  @override
  String currentServer(String current) {
    return '目前正在使用 $current';
  }

  @override
  String get useSponsorBlock => '使用 SponsorBlock';

  @override
  String get sponsorBlockDescription => '跳過由社群提交的贊助商片段';

  @override
  String get about => '關於';

  @override
  String get name => '名稱';

  @override
  String get package => '套件';

  @override
  String get version => '版本';

  @override
  String get build => '建置';

  @override
  String get addServer => '新增伺服器';

  @override
  String get useThisServer => '使用此伺服器';

  @override
  String get logIn => '登入';

  @override
  String get delete => '刪除';

  @override
  String get invalidInvidiousServer => '無效的 Invidious 伺服器';

  @override
  String get yourServers => '您的伺服器';

  @override
  String get loggedIn => '已登入';

  @override
  String get notLoggedIn => '未登入';

  @override
  String get addServerHelpText => '使用 + 按鈕新增您自己的伺服器或點選公開伺服器並新增。';

  @override
  String get publicServers => '公開伺服器';

  @override
  String get loadingPublicServer => '正在載入公開伺服器';

  @override
  String get tapToAddServer => '點選以將伺服器新增到您的清單';

  @override
  String get publicServersError => '無法取得公開伺服器清單。點選以重試。';

  @override
  String get appearance => '外觀';

  @override
  String get useDynamicTheme => '動態色彩';

  @override
  String get useDynamicThemeDescription =>
      '使用 Material You 配色（僅適用於 Android 12+）。需要重新啟動應用程式';

  @override
  String get useDash => '使用 DASH';

  @override
  String get useDashDescription => 'DASH 自適應性串流有時可能會會因為受到 YouTube 的限制而導致問題。';

  @override
  String get videoPlayer => '影片播放器';

  @override
  String get videoListed => '公開';

  @override
  String get videoUnlisted => '未列出';

  @override
  String get videoIsFamilyFriendly => '適合全家觀看';

  @override
  String get tapToManage => '點選以管理';

  @override
  String get authentication => '驗證';

  @override
  String get tokenLogin => '使用 token 登入';

  @override
  String get tokenLoginDescription => '推薦的登入方式';

  @override
  String get cookieLogin => '使用 cookie 登入';

  @override
  String get cookieLoginDescription => '如果您在使用 token 驗證時遇到問題，請使用此方法';

  @override
  String get logout => '登出';

  @override
  String get username => '使用者名稱';

  @override
  String get password => '密碼';

  @override
  String get wrongUsernamePassword => '使用者名稱或密碼錯誤';

  @override
  String get error => '錯誤';

  @override
  String get malformedStatsEndpointDescription =>
      '伺服器統計端點未回傳預期的內容，\"software.name\" 鍵應為 \"invidious\"。\n伺服器回應為：';

  @override
  String get serverIsNotReachable => '無法連結伺服器';

  @override
  String get videoQueue => '影片佇列';

  @override
  String get addToQueueList => '新增至佇列';

  @override
  String get addToPlaylist => '新增至播放清單';

  @override
  String get playNext => '播放下一部';

  @override
  String get playNextAddedToQueue => '影片將接著播放';

  @override
  String get addRecommendedToQueue => '自動播放推薦的下一部';

  @override
  String get sponsorBlockSettingsQuickDescription => '選擇要跳過的片段類型';

  @override
  String get sponsorBlockCategorySponsor => '贊助商';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      '付費推廣、付費推薦和直接廣告。不包括自我推廣或免費為他們喜歡的事業/創作者/網站/產品喊話。';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => '未付費/自我推廣';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      '與「贊助商」類似，但不包括未付費或自我推廣。這包括有關商品、贊助或他們合作的人的資訊的部分。 ';

  @override
  String get sponsorBlockCategoryInteraction => '互動提醒（訂閱）';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      '當內容中間有短暫的提醒喜歡、訂閱或關注他們時。如果它很長或關於某些特定的事情，則應該歸類為自我推廣。';

  @override
  String get sponsorBlockCategoryIntro => '間歇/介紹動畫';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      '沒有實際內容的間隔。可能是暫停、靜態框架、重複的動畫。不應該用於包含資訊的轉場。';

  @override
  String get sponsorBlockCategoryOutro => '結尾卡片/片尾字幕';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      '片尾字幕或 YouTube 結尾卡片出現時。不適用於包含資訊的結論。';

  @override
  String get sponsorBlockCategoryPreview => '預覽/回顧';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      '顯示在此影片或系列中其他影片中即將出現的內容的剪輯集，其中所有資訊都會在影片後面重複。';

  @override
  String get sponsorBlockCategoryFiller => '填充片段/笑話';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      '只為填充或幽默而新增的離題場景，並非理解影片主要內容所必需。這不應包括提供上下文或背景細節的片段。這是一個非常激進的類別，適用於您不想「開心」的時候。';

  @override
  String get sponsorBlockCategoryMusicOffTopic => '音樂：非音樂部分';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      '僅適用於音樂影片。這只應該用於音樂影片的部分，這些部分尚未被其他類別涵蓋。';

  @override
  String get useProxy => '代理影片';

  @override
  String get useProxyDescription => '透過從伺服器代理影片串流，您可以繞過區域封鎖或 ISP 封鎖 YouTube';

  @override
  String get pressDownToShowSettings => '按下以顯示設定';

  @override
  String get quality => '畫質';

  @override
  String get audio => '音訊';

  @override
  String get subtitles => '字幕';

  @override
  String get playbackSpeed => '播放速度';

  @override
  String get blackBackground => '黑色背景';

  @override
  String get blackBackgroundDescription => '適用於 OLED 螢幕的深色主題';

  @override
  String get search => '搜尋';

  @override
  String get subtitleFontSize => '字幕字型大小';

  @override
  String get subtitleFontSizeDescription => '如果您的裝置上的字幕太小或太大，可以更改字幕的大小';

  @override
  String get skipSslVerification => '跳過 SSL 憑證驗證';

  @override
  String get skipSslVerificationDescription =>
      '用於使用自簽名 SSL 憑證，或當伺服器有 SSL 相關問題時。';

  @override
  String get themeBrightness => '主題';

  @override
  String get themeLight => '淺色';

  @override
  String get themeDark => '暗色';

  @override
  String get followSystem => '跟隨系統';

  @override
  String get requiresRestart => '需要重新啟動應用程式';

  @override
  String get appLanguage => '應用程式語言';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString部影片',
      one: '1部影片',
      zero: '無影片',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation => '網址必須以 http:// 或 https:// 開頭';

  @override
  String get returnYoutubeDislikeDescription =>
      '使用 returnyoutubedislike.com 提供的 API 顯示預估的影片不喜歡數';

  @override
  String get rydCustomInstance => '自訂 RYD 執行個體網址';

  @override
  String get rydCustomInstanceDescription => '使用不同的 RYD 執行個體，留空則使用預設值';

  @override
  String get autoplayVideoOnLoad => '載入時自動播放影片';

  @override
  String get autoplayVideoOnLoadDescription => '影片載入後自動開始播放';

  @override
  String get searchHistory => '搜尋紀錄';

  @override
  String get searchHistoryDescription => '搜尋紀錄設定';

  @override
  String get enableSearchHistory => '啟用搜尋紀錄';

  @override
  String get searchHistoryLimit => '搜尋紀錄限制';

  @override
  String get searchHistoryLimitDescription => '設定在建議中顯示多少先前的搜尋';

  @override
  String get shorts => 'Shorts';

  @override
  String get searchUploadDate => '上傳日期';

  @override
  String get searchUploadDateAny => '不限時間';

  @override
  String get searchUploadDateHour => '過去一個小時';

  @override
  String get searchUploadDateToday => '今天';

  @override
  String get searchUploadDateWeek => '本週';

  @override
  String get searchUploadDateMonth => '本月';

  @override
  String get searchUploadDateYear => '今年';

  @override
  String get searchDuration => '影片長度';

  @override
  String get searchDurationAny => '不限長度';

  @override
  String get searchDurationShort => '短片（<4分）';

  @override
  String get searchDurationLong => '長片（>20分）';

  @override
  String get searchDurationMedium => '中等（4-20分）';

  @override
  String get searchSortBy => '排序依據';

  @override
  String get searchSortRelevance => '關聯性';

  @override
  String get searchSortRating => '評分';

  @override
  String get searchSortUploadDate => '上傳日期';

  @override
  String get searchSortViewCount => '觀看次數';

  @override
  String get clearSearchHistory => '清除搜尋紀錄';

  @override
  String get appLogs => '應用程式日誌';

  @override
  String get appLogsDescription => '取得應用程式中發生的日誌，可以用於報告問題';

  @override
  String get copyToClipBoard => '複製到剪貼簿';

  @override
  String get logsCopied => '日誌已複製到剪貼簿';

  @override
  String get rememberSubtitleLanguage => '記住字幕語言';

  @override
  String get videoFilters => '影片篩選器';

  @override
  String nFilters(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '篩選出$countString部影片',
      one: '篩選出一部影片',
      zero: '沒有影片',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      '根據下面定義的篩選器，從應用程式中的所有影片來源隱藏或模糊影片。例如，這可以讓您隱藏體育劇透或隱藏某個頻道的 Shorts。';

  @override
  String get videoFiltersSettingTileDescriptions => '定義篩選影片的規則';

  @override
  String get videoFilterAllChannels => '所有頻道';

  @override
  String get addVideoFilter => '建立篩選器';

  @override
  String get editVideoFilter => '編輯篩選器';

  @override
  String get videoFilterType => '類型';

  @override
  String get videoFilterOperation => '操作';

  @override
  String get videoFilterValue => '值';

  @override
  String get save => '儲存';

  @override
  String get videoFilterEditDescription =>
      '選擇一個選擇性的頻道、篩選器類型、操作和值，從清單中篩選出影片。例如，類型：影片名稱，操作：包含，值：測試將排除所有名稱中包含 test 的影片。';

  @override
  String get optional => '選擇性的';

  @override
  String get videoFilterHideLabel => '隱藏';

  @override
  String get videoFilterFilterLabel => '模糊';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter 影片，其中 $type $operation \'$value\'。';
  }

  @override
  String get videoFiltered => '影片因以下原因被篩選：';

  @override
  String get videoFilterTapToReveal => '點選以顯示';

  @override
  String get videoFilterHide => '隱藏篩選的影片';

  @override
  String get videoFilterHideDescription =>
      '預設情況下，篩選的影片不會被隱藏，而是以模糊的方式顯示，並說明為何被篩選。此設定將從清單中移除篩選的影片。';

  @override
  String get videoFilterNoFilters => '沒有影片篩選器，點選下方的 + 按鈕開始新增篩選器。';

  @override
  String get videoFilterTypeVideoTitle => '影片標題';

  @override
  String get videoFilterTypeChannelName => '頻道名稱';

  @override
  String get videoFilterTypeVideoLength => '影片長度（秒）';

  @override
  String get videoFilterOperationContains => '包含';

  @override
  String get videoFilterOperationNotContain => '不包含';

  @override
  String get videoFilterOperationLowerThan => '低於';

  @override
  String get videoFilterOperationHigherThan => '高於';

  @override
  String get channel => '頻道';

  @override
  String get videoFilterHideAllFromChannel => '篩選頻道的所有影片';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '從頻道 $hideOrFilter 所有影片';
  }

  @override
  String get rememberSubtitleLanguageDescription => '如果可用，自動將字幕設定為最後選擇的語言';

  @override
  String get lockFullScreenToLandscape => '將全螢幕方向鎖定為影片的長寬比';

  @override
  String get lockFullScreenToLandscapeDescription =>
      '根據影片格式鎖定全螢幕方向，寬影片為橫向，豎向影片為豎向';

  @override
  String get fillFullscreen => '最大化影片以適應螢幕';

  @override
  String get fillFullscreenDescription => '調整影片以填滿橫向模式的整個螢幕';

  @override
  String get rememberPlaybackSpeed => '記住播放速度';

  @override
  String get rememberPlaybackSpeedDescription => '自動將播放速度設定為最後選擇的速度';

  @override
  String get downloads => '下載';

  @override
  String get download => '下載';

  @override
  String get videoAlreadyDownloaded => '影片已經下載';

  @override
  String get noDownloadedVideos => '沒有下載的影片，瀏覽，長按清單中的影片或在影片螢幕上點選下載按鈕進行下載';

  @override
  String get downloadsPlayAll => '播放全部';

  @override
  String get videoDownloadStarted => '影片下載已開始';

  @override
  String get videoFailedDownloadRetry => '下載失敗，點選以重試';

  @override
  String get videoDownloadAudioOnly => '僅音訊';

  @override
  String get manageSubscriptions => '管理訂閱';

  @override
  String get noSubscriptions => '沒有訂閱，瀏覽影片並訂閱您喜歡的任何頻道。';

  @override
  String get youCanSubscribeAgainLater => '您稍後可以再次訂閱此頻道';

  @override
  String get unSubscribeQuestion => '取消訂閱？';

  @override
  String get clearHistoryQuestion => '清除紀錄？';

  @override
  String get clearHistoryQuestionExplanation =>
      '這將清除您在使用的 Invidious 執行個體上的帳戶的觀看紀錄。這個操作無法復原。';

  @override
  String get noHistory => '沒有觀看紀錄，它將在觀看一些影片後出現在這裡';

  @override
  String get homeLayoutEditor => '編輯首頁版面配置';

  @override
  String get layoutEditorAddVideoSource => '新增影片來源';

  @override
  String get layoutEditorExplanation =>
      '您可以決定在首頁上顯示什麼，您可以有最多 2 個帶有水平滾動的小檢視和一個大型來源。';

  @override
  String get home => '首頁';

  @override
  String get library => '圖書館';

  @override
  String get customizeAppLayout => '自定義應用程式區塊';

  @override
  String get customizeAppLayoutExplanation =>
      '選擇您希望出現在主應用程式導覽列中的哪些區塊。點選首頁圖示選擇應用程式啟動時顯示哪個螢幕。您可以透過拖動來重新排序區塊。';

  @override
  String get navigationBarStyle => '導覽列樣式';

  @override
  String get navigationBarLabelAlwaysShowing => '永遠顯示標籤';

  @override
  String get navigationBarLabelShowOnSelect => '在選定的專案上顯示標籤';

  @override
  String get navigationBarLabelNeverShow => '永不顯示標籤';

  @override
  String get distractionFreeMode => '無干擾模式';

  @override
  String get distractionFreeModeDescription => '停用影片評論和推薦';

  @override
  String get secondsShortForm => '秒';

  @override
  String get videoFilterApplyDateToFilter => '在指定的時間篩選影片';

  @override
  String get videoFilterDayOfWeek => '選擇套用篩選器的天數';

  @override
  String get videoFilterDayOfWeekDescription =>
      '您可以選擇性地選擇篩選器適用的星期幾和時間，來達到例如避免體育賽事劇透的目的。';

  @override
  String get videoFilterStartTime => '開始時間';

  @override
  String get videoFilterEndTime => '結束時間';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return '套用於 $selectedDays';
  }

  @override
  String get from => '從';

  @override
  String get to => '到';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return '從 $from 到 $to';
  }

  @override
  String get notifications => '通知';

  @override
  String get notificationsDescription => '啟用並檢視您收到的通知內容';

  @override
  String get enableNotificationDescriptions => '執行前臺服務以檢查並通知您正在監視的變化';

  @override
  String get subscriptionNotification => '訂閱通知';

  @override
  String get subscriptionNotificationDescription =>
      '如果您已登入到目前執行個體，則會收到訂閱來源中新影片的通知';

  @override
  String get subscriptionNotificationTitle => '您的訂閱中有新影片';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString部新影片',
      one: '1部新影片',
      zero: '無新影片',
    );
    return '您的訂閱來源中有 $_temp0';
  }

  @override
  String get askForDisableBatteryOptimizationTitle => '需要停用電池最佳化';

  @override
  String get askForDisableBatteryOptimizationContent =>
      '為了傳送通知，Clipious 需要執行一個背景服務。為了使其順暢執行，需要給予 Clipious 不受限制的電池使用權，點選確定將開啟電池最佳化設定。';

  @override
  String get askToEnableBackgroundServiceTitle => '通知已關閉';

  @override
  String get askToEnableBackgroundServiceContent =>
      '要取得通知，需要啟用 Clipious 通知，按確定以啟用。';

  @override
  String get otherNotifications => '其他通知來源（鈴鐺圖示）';

  @override
  String get deleteChannelNotificationTitle => '刪除頻道通知？';

  @override
  String get deleteChannelNotificationContent => '您將不再收到來自此頻道的任何通知。';

  @override
  String get deletePlaylistNotificationTitle => '刪除播放清單通知？';

  @override
  String get deletePlaylistNotificationContent => '您將不再收到來自此播放清單的任何通知。';

  @override
  String channelNotificationTitle(String channel) {
    return '$channel 的新影片';
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
      other: '$countString部新影片',
      one: '1部新影片',
      zero: '無新影片',
    );
    return '$channel 有 $_temp0';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return '$playlist 播放清單中的新影片';
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
      other: '$countString部新影片',
      one: '1部新影片',
      zero: '無新影片',
    );
    return '$playlist 播放清單中有 $_temp0';
  }

  @override
  String get foregroundServiceNotificationTitle => '影片監控';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': '小時',
        '24': '天',
        'other': '每 $hours 小時',
      },
    );
    return '將每 $_temp0 檢查一次新影片';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions => '正在檢查訂閱...';

  @override
  String get foregroundServiceUpdatingPlaylist => '正在檢查播放清單...';

  @override
  String get foregroundServiceUpdatingChannels => '正在檢查頻道...';

  @override
  String get notificationFrequencySettingsTitle => '新影片檢查頻率';

  @override
  String get notificationFrequencySettingsDescription => '應用程式將多久檢查一次新影片';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '1天',
        'other': '$hours小時',
      },
    );
    return '$_temp0';
  }

  @override
  String get subtitlesBackground => '字幕背景';

  @override
  String get subtitlesBackgroundDescription => '為字幕新增黑色背景以使其更易於閱讀';

  @override
  String get history => '紀錄';

  @override
  String get deArrowSettingDescription => '替換點選誘餌標題和縮圖';

  @override
  String get deArrowReplaceThumbnails => '替換縮圖';

  @override
  String get deArrowReplaceThumbnailsDescription => '除標題外，還替換影片縮圖';

  @override
  String get deArrowWarning =>
      '啟用 DeArrow 可能會顯著降低應用程式的瀏覽速度，因為每個影片都需要額外的 http 請求';

  @override
  String get copySettingsAsJson => '將設定以 JSON 格式複製到剪貼簿';

  @override
  String get copySettingsAsJsonDescription =>
      '如果您遇到應用程式問題並決定提出問題，請將設定複製為 JSON 以協助除錯';

  @override
  String get skipStep => '向前/向後跳過一步';

  @override
  String get skipStepDescription => '快轉/倒轉操作時要跳過的秒數';

  @override
  String get exponentialSkip => '指數型快轉/倒轉';

  @override
  String get exponentialSkipDescription => '您快轉的次數越多，每次快轉的時間間隔就越大。';

  @override
  String get fullscreenOnLandscape => '橫向顯示時全螢幕顯示';

  @override
  String get fullscreenOnLandscapeDescription => '當裝置旋轉至橫向模式時切換到全螢幕';

  @override
  String get enabled => '已啟用';

  @override
  String get submitFeedback => '送出回饋';

  @override
  String get submitFeedbackDescription => '發現錯誤或有建議？使用此工具截圖、註釋並提供回饋';

  @override
  String get feedbackDisclaimer =>
      '您需要擁有 GitHub 帳號才能傳送回饋意見，並且您的截圖將會匿名傳送到 Imgur。';

  @override
  String get feedbackScreenshotError => '將截圖上傳到 Imgur 時發生錯誤';

  @override
  String get channelSortByNewest => '最新';

  @override
  String get channelSortByOldest => '最舊';

  @override
  String get channelSortByPopular => '熱門';

  @override
  String get invidiousAccount => 'Invidious 帳號';

  @override
  String get onDeviceSubscriptions => '在裝置上';

  @override
  String get refresh => '更新';
}
