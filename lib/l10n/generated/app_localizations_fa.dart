// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get subscriptions => 'اشتراک‌ها';

  @override
  String get playlists => 'فهرست‌های پخش';

  @override
  String get popular => 'محبوب‌ها';

  @override
  String get trending => 'پرطرفدار';

  @override
  String get noVideoInPlayList => 'ویدیویی در این فهرست پخش وجود ندارد';

  @override
  String get removeFromPlayList => 'حذف از فهرست پخش';

  @override
  String get deletePlayListQ => 'حذف فهرست پخش؟';

  @override
  String get irreversibleAction => 'این عمل غیرقابل بازگشت است';

  @override
  String get addPlayList => 'افزودن فهرست پخش';

  @override
  String get playListName => 'نام فهرست پخش';

  @override
  String get playlistVisibility => 'دسترسی تماشا';

  @override
  String get publicPlaylist => 'عمومی';

  @override
  String get privatePlaylist => 'خصوصی';

  @override
  String get cancel => 'لغو';

  @override
  String get add => 'افزودن';

  @override
  String get unlistedPlaylist => 'فهرست نشده';

  @override
  String get info => 'اطلاعات';

  @override
  String get videos => 'ویدیوها';

  @override
  String get streams => 'پخش زنده‌ها';

  @override
  String get latestVideos => 'تازه‌ترین ویدیوها';

  @override
  String get subscribed => 'مشترک شده';

  @override
  String get subscribe => 'مشترک شو';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'بدون مشترک',
        'other': '$count مشترک',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'اشتراک‌گذاری';

  @override
  String get shareYoutubeLink => 'اشتراک گذاری پیوند YouTube';

  @override
  String get shareInvidiousLink => 'اشتراک گذاری پیوند Invidious';

  @override
  String get redirectInvidiousLink => 'اشتراک گذاری پیوند تغییرمسیر Invidious';

  @override
  String get shareLinkWithTimestamp => 'افزودن مهرزمان';

  @override
  String get ok => 'تایید';

  @override
  String get noChannels => 'بدون کانال';

  @override
  String get noPlaylists => 'بدون فهرست پخش';

  @override
  String get channels => 'کانال‌ها';

  @override
  String get couldntLoadVideo => 'ویدیو بارگذاری نشد';

  @override
  String get comments => 'نظرها';

  @override
  String get recommended => 'پیشنهاد شده';

  @override
  String get couldntFetchVideos =>
      'ویدیو دریافت نشد. برای تلاش مجدد کلیک کنید.';

  @override
  String get wizardIntro =>
      'یک سرویس دهندهٔ عمومی انتخاب کنید یا سرویس دهندهٔ خودتان را وارد کنید. (می‌توانید بعدا در تنظیمات تغییر دهید)';

  @override
  String get startUsingClipious => 'آغاز استفاده از Clipious';

  @override
  String get videoAddedToPlaylist => 'ویدیو به فهرست پخش افزوده شد';

  @override
  String get videoAddedToQueue => 'ویدیو به صف افزوده شد';

  @override
  String get errorAddingVideoToPlaylist =>
      'خطا در هنگام افزودن ویدیو به فهرست پخش';

  @override
  String get itemlistErrorGeneric => 'اطلاعات دریافت نشد';

  @override
  String get itemListErrorInvalidScope =>
      'شما اجازهٔ دسترسی به این مورد را ندارید، اگر برای ورود از شیوهٔ Token استفاده کرده‌اید خروج و ورود دوباره را امتحان کنید';

  @override
  String get selectPlaylist => 'انتخاب فهرست پخش';

  @override
  String get createNewPlaylist => 'ساختن فهرست پخش تازه';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString پاسخ',
      one: '1 reply',
      zero: 'بدون پاسخ',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'بارگذاری بیشتر';

  @override
  String get topSorting => 'بالا';

  @override
  String get newSorting => 'تازه';

  @override
  String get streamIsLive => 'زنده';

  @override
  String get sponsorSkipped => 'حامی مالی رد شد';

  @override
  String get selectBrowsingCountry => 'کشور را انتخاب کنید';

  @override
  String get showOnStart =>
      'انتخاب کنید که پس از باز شدن اپ چه چیزی نمایش داده شود';

  @override
  String get settings => 'تنظیمات';

  @override
  String get browsing => 'مرور';

  @override
  String get country => 'کشور';

  @override
  String get whenAppStartsShow => 'هنگامی که اپ باز شد، نمایش بده…';

  @override
  String get servers => 'سرویس دهندگان';

  @override
  String get manageServers => 'مدیریت سرویس دهندگان';

  @override
  String currentServer(String current) {
    return 'همینک در حال استفاده از $current';
  }

  @override
  String get useSponsorBlock => 'استفاده از SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'رد شدن از بخش‌های حامی مالی که توسط عموم مخاطبان معرفی شده‌اند';

  @override
  String get about => 'درباره';

  @override
  String get name => 'نام';

  @override
  String get package => 'بسته';

  @override
  String get version => 'نسخه';

  @override
  String get build => 'Build (بیلد)';

  @override
  String get addServer => 'افزودن سرویس دهنده';

  @override
  String get useThisServer => 'از این سرویس دهنده استفاده کن';

  @override
  String get logIn => 'ورود';

  @override
  String get delete => 'حذف';

  @override
  String get invalidInvidiousServer => 'سرویس دهندهٔ نامعتبر Invidious';

  @override
  String get yourServers => 'سرویس دهنده‌های شما';

  @override
  String get loggedIn => 'وارد شده';

  @override
  String get notLoggedIn => 'وارد نشده';

  @override
  String get addServerHelpText =>
      'از دکمهٔ + برای افزودن سرویس دهندگان خود استفاده کنید یا روی یکی از سرویس دهندگان عمومی ضربه بزنید تا افزوده شود.';

  @override
  String get publicServers => 'سرویس دهندگان عمومی';

  @override
  String get loadingPublicServer => 'در حال بارگزاری سرویس دهندگان عمومی';

  @override
  String get tapToAddServer => 'برای افزودن سرویس دهنده به فهرست، ضربه بزنید';

  @override
  String get publicServersError =>
      'فهرست سرویس دهندگان عمومی دریافت نشد. برای تلاش مجدد ضربه بزنید.';

  @override
  String get appearance => 'ظاهر';

  @override
  String get useDynamicTheme => 'رنگ‌های پویا';

  @override
  String get useDynamicThemeDescription =>
      'از رنگ‌های Material You استفاده کن (تنها روی Android 12 و بالاتر)';

  @override
  String get useDash => 'استفاده از DASH';

  @override
  String get useDashDescription =>
      'پخش تطبیقی DASH گاهی اوقات ممکن است مشکل‌ساز باشد. YouTube می‌تواند محدودش کند.';

  @override
  String get videoPlayer => 'پخش کنندهٔ ویدیو';

  @override
  String get videoListed => 'عمومی';

  @override
  String get videoUnlisted => 'فهرست نشده';

  @override
  String get videoIsFamilyFriendly => 'مناسب خانواده';

  @override
  String get tapToManage => 'برای مدیریت ضربه بزنید';

  @override
  String get authentication => 'احراز هویت';

  @override
  String get tokenLogin => 'ورود با استفاده از Token';

  @override
  String get tokenLoginDescription => 'شیوهٔ پیشنهادی ورود';

  @override
  String get cookieLogin => 'ورود با استفاده از Cookie';

  @override
  String get cookieLoginDescription =>
      'چنانچه در استفاده از token با مشکل مواجه شدید، از این شیوه استفاده کنید';

  @override
  String get logout => 'خروج';

  @override
  String get username => 'نام کاربری';

  @override
  String get password => 'رمز عبور';

  @override
  String get wrongUsernamePassword => 'نام کاربری یا رمز اشتباه است';

  @override
  String get error => 'خطا';

  @override
  String get malformedStatsEndpoint =>
      '/api/v1/stats آن گونه که انتظار می‌رود نیست';

  @override
  String get malformedStatsEndpointDescription =>
      'نقطهٔ پایانی آمار سرویس دهنده پاسخ درستی نداد. کلید «software.name» باید برابر با «invidious» باشد.\nپاسخ دریافتی از سرویس دهنده:';

  @override
  String get serverIsNotReachable => 'سرویس دهنده در دسترس نیست';

  @override
  String get videoQueue => 'صف ویدیو';

  @override
  String get addToQueueList => 'افزودن به صف';

  @override
  String get addToPlaylist => 'افزودن به فهرست پخش';

  @override
  String get playNext => 'بعدی را پخش کن';

  @override
  String get playNextAddedToQueue => 'ویدیو پس از پایان پخش خواهد شد';

  @override
  String get addRecommendedToQueue => 'پیشنهاد شده را به صورت خودکار پخش کن';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'انتخاب کنید که چه نوع بخش‌هایی رد شوند';

  @override
  String get sponsorBlockCategorySponsor => 'حامی مالی';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'تبلیغات و ارجاعاتی که پولی به ازایشان دریافت شده و تبلیغات مستفیم. شامل تبلیغ-خود یا اشاره‌های رایگان به اهداف/سازندگان/وب‌سایت‌ها و محصولاتی که دوست دارند نمی‌شود.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => 'تبلیغات رایگان/شخصی';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'همانند «حامی مالی» با این تفاوت که مختص تبلیغات رایگان یا شخصی است. این گزینه شامل بخش‌های معرفی کالاهای شخصی، دریافت کمک‌های مالی یا اطلاعات همکاران می‌شود. ';

  @override
  String get sponsorBlockCategoryInteraction => 'یادآوری تعامل (اشتراک)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'هنگامی که یادآور کوتاهی برای پسندیدن، اشتراک یا دنبال کردنشان در میانهٔ محتوا وجود دارد. اگر یادآور بلند باشد یا در مورد موضعی خاص، باید به تبلیغ شخصی منتقل شود.';

  @override
  String get sponsorBlockCategoryIntro => 'وقفه/انیمیشن آغازین';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'فاصله‌ای فاقد محتوای واقعی. می‌تواند مکث، قاب ایستا، انیمیشن تکرار شونده باشد. از این گزینه برای transitionهای حاوی اطلاعات استفاده نشود.';

  @override
  String get sponsorBlockCategoryOutro => 'کارت‌های پایان ویدیو/عناوین';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'عناوین یا هنگامی که کارت‌های پایان ویدیوی YouTube نمایان می‌شوند. برای نتیجه‌گیری با اطلاعات استفاده نشود.';

  @override
  String get sponsorBlockCategoryPreview => 'پیش نمایش/جمع‌بندی';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'مجموعه‌ای از کلیپ‌ها که خلاصه‌ای از آن‌چه در ویدیو خواهد بود یا دیگرهای ویدیوهای یک مجموعه را نمایش می‌دهند که همهٔ اطلاعات در ویدیوی پیش‌رو خواهد بود.';

  @override
  String get sponsorBlockCategoryFiller => 'پالایش حواشی/شوخی‌ها';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'نماهای حواشی تنها برای شوخی‌هایی افزوده شده که وجودشان جهت درک محتوای اصلی ویدیو ضروری نیست. این گزینه نباید برای بخش‌هایی که بافت یا جزییات پیش‌زمینه‌ای اضافه می‌کنند استفاده شود. این دسته‌بندی تهاجمی برای مواقعیست که شما حوصلهٔ «شوخی» ندارید.';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'موسیقی: بخش‌های بدون موسیقی';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'تنها برای موزیک ویدیوها. این گزینه تنها بایدبرای بخش‌هایی از موزیک ویدیوها استفاده شود که در دسته‌های دیگر نبوده‌اند.';

  @override
  String get useProxy => 'استفاده از پروکسی برای پخش ویدیوها';

  @override
  String get useProxyDescription =>
      'با استفاده از پروکسی برای پخش ویدیوها از سرویس دهنده، می‌توانید محدودیت‌های منطقه‌ای یا اعمال شده توسط ISP را رد کنید';

  @override
  String get pressDownToShowSettings =>
      'برای نمایش گزینه‌های بیشتر پایین را فشار دهید';

  @override
  String get quality => 'کیفیت';

  @override
  String get audio => 'صدا';

  @override
  String get subtitles => 'زیرنویس';

  @override
  String get playbackSpeed => 'سرعت پخش';

  @override
  String get blackBackground => 'پس‌زمینهٔ سیاه';

  @override
  String get blackBackgroundDescription =>
      'برای نمایه‌های تیره روی نمایشگرهای OLED';

  @override
  String get search => 'جست و جو';

  @override
  String get subtitleFontSize => 'اندازهٔ قلم زیرنویس';

  @override
  String get subtitleFontSizeDescription =>
      'چنانچه اندازهٔ زیرنویس روی دستگاه شما بسیار کوچک یا بزرگ است، اندازهٔ آن را تغییر دهید';

  @override
  String get skipSslVerification => 'رد شدن از مرحلهٔ تایید SSL';

  @override
  String get skipSslVerificationDescription =>
      'هنگام استفاده از self-signed SSL certificate یا هنگامی که سرویس دهنده مشکل مربوط به SSL دارد.';

  @override
  String get themeBrightness => 'ظاهر اپ';

  @override
  String get themeLight => 'روشن';

  @override
  String get themeDark => 'تیره';

  @override
  String get followSystem => 'پیروی از دستگاه شما';

  @override
  String get requiresRestart => 'نیازمند بازکردن دوبارهٔ اپ';

  @override
  String get appLanguage => 'زبان اپ';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ویدیو',
      one: '1 video',
      zero: 'بدون ویدیو',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'نشانی باید با http:// یا https:// آغاز شود';

  @override
  String get returnYoutubeDislikeDescription =>
      'نمایش تعداد حدودی dislikeهای ویدیو با استفاده از API فراهم شده توسط eturnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'نشانی اختصاصی RYD';

  @override
  String get rydCustomInstanceDescription =>
      'از یک RYD متفاوت استفاده کنید، برای استفاده از پیش‌فرض خالی بگذارید';

  @override
  String get autoplayVideoOnLoad => 'پخش خودکار ویدیو به محض بارگزاری';

  @override
  String get autoplayVideoOnLoadDescription =>
      'پخش خودکار ویدیو پس از پایان بارگزاری';

  @override
  String get searchHistory => 'سابقهٔ جست و جو';

  @override
  String get searchHistoryDescription => 'تنظیمات سابقهٔ جست و جو';

  @override
  String get enableSearchHistory => 'فعال کردن سابقهٔ جست و جو';

  @override
  String get searchHistoryLimit => 'محدود کردن سابقهٔ جست و جو';

  @override
  String get searchHistoryLimitDescription =>
      'معین کنید که چه تعداد از جست و جوهای پیشین شما در موارد پیشنهادی نمایش داده شود';

  @override
  String get shorts => 'Shortها';

  @override
  String get searchUploadDate => 'تاریخ انتشار';

  @override
  String get searchUploadDateAny => 'هر تاریخی';

  @override
  String get searchUploadDateHour => 'یک ساعت پیش';

  @override
  String get searchUploadDateToday => 'امروز';

  @override
  String get searchUploadDateWeek => 'این هفته';

  @override
  String get searchUploadDateMonth => 'این ماه';

  @override
  String get searchUploadDateYear => 'امسال';

  @override
  String get searchDuration => 'مدت';

  @override
  String get searchDurationAny => 'هر مدتی';

  @override
  String get searchDurationShort => 'کوتاه ( کمتر از ۴ دقیقه)';

  @override
  String get searchDurationLong => 'بلند (بیش از ۲۰ دقیقه)';

  @override
  String get searchDurationMedium => 'متوسط (۴ تا ۲۰ دقیقه)';

  @override
  String get searchSortBy => 'به ترتیب';

  @override
  String get searchSortRelevance => 'ارتباط';

  @override
  String get searchSortRating => 'امتیاز';

  @override
  String get searchSortUploadDate => 'تاریخ انتشار';

  @override
  String get searchSortViewCount => 'تعداد نمایش';

  @override
  String get clearSearchHistory => 'پاک کردن سابقهٔ جست و جو';

  @override
  String get appLogs => 'Logهای اپلیکیشن';

  @override
  String get appLogsDescription =>
      'از آن چه که در اپلیکیشن اتفاق می‌دهد log تهیه کنید. هنگام گزارش مشکلات ممکن است مفید باشد';

  @override
  String get copyToClipBoard => 'نسخه‌برداری به کلیپ‌بورد';

  @override
  String get logsCopied => 'نسخه‌بردای از Logها به کلیپ‌بورد انجام شد';

  @override
  String get rememberSubtitleLanguage => 'زبان زیرنویس را به خاطر بسپار';

  @override
  String get videoFilters => 'پالایش ویدیوها';

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
      zero: 'بدون ویدیو',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'با استفاده از گزینه‌های پالایش، ویدیوها را مخفی یا محو کنید تا در اپلیکیشن نمایش داده نشود. به عنوان مثال می‌توانید ویدیوهای ورزشی یا shortهای یک کانال خاص را مخفی کنید.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'قواعد پالایش ویدیوها را معین کنید';

  @override
  String get videoFilterAllChannels => 'همهٔ کانال‌ها';

  @override
  String get addVideoFilter => 'ساخت قاعده';

  @override
  String get editVideoFilter => 'ویرایش قاعده';

  @override
  String get videoFilterType => 'نوع';

  @override
  String get videoFilterOperation => 'عملیات';

  @override
  String get videoFilterValue => 'مقدار';

  @override
  String get save => 'ذخیره';

  @override
  String get videoFilterEditDescription =>
      'یک کانال (اختیاری)، نوع قاعده، عملیات و مقدار را مشخص کنید تا ویدیوها از فهرست حذف شوند. مثال «نوع: نام ویدیو, عملیات: شامل, مقدار: تست» تمام ویدیوهایی که کلمهٔ تست در عنوانشان وجود داشته باشد را حذف می‌کند.';

  @override
  String get optional => 'اختیاری';

  @override
  String get videoFilterHideLabel => 'مخفی کن';

  @override
  String get videoFilterFilterLabel => 'محو کن';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter ویدیوهایی که $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered => 'ویدیو به دلایل زیر پالایش شده است:';

  @override
  String get videoFilterTapToReveal => 'برای نمایش ضربه بزنید';

  @override
  String get videoFilterHide => 'ویدیوهای پالایش شده را مخفی کن';

  @override
  String get videoFilterHideDescription =>
      'به صورت پیش‌فرض ویدیوهای پالایش شده مخفی نشده و تنها به صورت محو شده با ذکر دلیل نمایش داده می‌شود. این گزینه ویدیوهای پالایش شده را از فهرست‌ها حذف می‌کند.';

  @override
  String get videoFilterNoFilters =>
      'هیچ قاعده‌ای برای پالایش ویدیوها وجود ندارد. برای افزودن روی دکمهٔ + ضربه بزنید.';

  @override
  String get videoFilterTypeVideoTitle => 'عنوان ویدیو';

  @override
  String get videoFilterTypeChannelName => 'نام کانال';

  @override
  String get videoFilterTypeVideoLength => 'طول ویدیو (ثانیه)';

  @override
  String get videoFilterOperationContains => 'شامل';

  @override
  String get videoFilterOperationNotContain => 'عدم شمول';

  @override
  String get videoFilterOperationLowerThan => 'کمتر از';

  @override
  String get videoFilterOperationHigherThan => 'بالاتر از';

  @override
  String get channel => 'کانال';

  @override
  String get videoFilterHideAllFromChannel =>
      'همهٔ ویدیوهای کانال را پالایش کن';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter همهٔ ویدیوهای کانال';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'چنانچه در دسترس بود، زبان زیرنویس را به صورت خودکار به آخرین زبان انتخاب شده عوض کن';

  @override
  String get lockFullScreenToLandscape =>
      'قفل چرخش صفحهٔ نمایش به نسبت ابعاد ویدیو';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'چرخش صفحهٔ نمایش را براساس قالب ویدیو انجام بده: افقی برای ویدیوهای wide و عمودی برای ویدیوهای عمودی';

  @override
  String get fillFullscreen => 'پوشش کامل صفحهٔ نمایش با ویدیو';

  @override
  String get fillFullscreenDescription =>
      'کل صفحه را در وضعیت افقی با ویدیو پوشش بده';

  @override
  String get rememberPlaybackSpeed => 'سرعت پخش ویدیو را به خاطر بسپار';

  @override
  String get rememberPlaybackSpeedDescription =>
      'سرعت پخش را به صورت خودکار به آخرین سرعت انتخاب شده عوض کن';

  @override
  String get downloads => 'دریافت‌ها';

  @override
  String get download => 'دریافت';

  @override
  String get videoAlreadyDownloaded => 'ویدیو پیشتر دریافت شده است';

  @override
  String get noDownloadedVideos =>
      'ویدیویی دریافت نشده است. ویدیوها را ببینید، انگشت را روی یک ویدیو در فهرست نگه داشته یا روی دکمهٔ دریافت ضربه بزنید';

  @override
  String get downloadsPlayAll => 'پخش همه';

  @override
  String get videoDownloadStarted => 'دریافت ویدیو آغاز شد';

  @override
  String get videoFailedDownloadRetry =>
      'دریافت موفق نبود. برای تلاش دوباره ضربه بزنید';

  @override
  String get videoDownloadAudioOnly => 'فقط صدا';

  @override
  String get manageSubscriptions => 'مدیریت اشتراک‌ها';

  @override
  String get noSubscriptions =>
      'اشتراکی ندارید، هنگام مشاهدهٔ ویدیوها مشترک کانال‌هایی که می‌پسندید شوید.';

  @override
  String get youCanSubscribeAgainLater =>
      'می‌توانید بعدا دوباره مشترک این کانال شوید';

  @override
  String get unSubscribeQuestion => 'لغو اشتراک؟';

  @override
  String get clearHistoryQuestion => 'حذف سابقه؟';

  @override
  String get clearHistoryQuestionExplanation =>
      'این گزینه همهٔ سوابق مربوط به حساب شما را از سرویس دهندهٔ Invidious شما حذف خواهد کرد. این عمل غیرقابل بازگشت است.';

  @override
  String get noHistory =>
      'سابقهٔ بازدیدی وجود ندارد. چند ویدیو تماشا کنید تا سابقهٔ شما این‌جا نشان داده شود';

  @override
  String get homeLayoutEditor => 'ویرایش چیدمان صفحهٔ اصلی';

  @override
  String get layoutEditorAddVideoSource => 'افزودن منبع ویدیو';

  @override
  String get layoutEditorExplanation =>
      'می‌توانید معین کنید چه چیزی در صفحهٔ اصلی شما نمایش داده شود. می‌توانید تا ۲ نمای کوچک با پیمایش افقی و یک نمای بزرگ داشته باشید.';

  @override
  String get home => 'صفحهٔ اصلی';

  @override
  String get library => 'کتابخانه';

  @override
  String get customizeAppLayout => 'شخصی‌سازی بخش‌های اپ';

  @override
  String get customizeAppLayoutExplanation =>
      'معین کنید چه بخش‌هایی در نوار پیشمایش اپ نشان داده شوند. روی نمایهٔ خانه کلیک کنید تا معین کنید چه چیزی هنگام بازکردن اپ نمایش داده شود. می‌توانید بخش‌ها را با کشیدن و رها کردن مرتب کنید.';

  @override
  String get navigationBarStyle => 'ظاهر نوار پیشمایش';

  @override
  String get navigationBarLabelAlwaysShowing => 'برچسب همیشه نمایش داده شود';

  @override
  String get navigationBarLabelShowOnSelect =>
      'برچسب گزینه انتخاب شده همیشه دیده شود';

  @override
  String get navigationBarLabelNeverShow => 'برچسب هرگز دیده نشود';

  @override
  String get distractionFreeMode => 'حالت کاهش حواس پرتی';

  @override
  String get distractionFreeModeDescription =>
      'غیرفعال کردن نظرهای ویدیوها و پیشنهادها';

  @override
  String get secondsShortForm => 'ثانیه';

  @override
  String get videoFilterApplyDateToFilter => 'پالایش ویدیوها در زمان مشخص شده';

  @override
  String get videoFilterDayOfWeek => 'برای تایید پالایش، روزها را انتخاب کنید';

  @override
  String get videoFilterDayOfWeekDescription =>
      'می‌توانید روزها و زمان‌های دلخواه خود را مشخص کنید تا قواعد پالایشی فعال شوند. به عنوان مثال اگر نمی‌خواهید نتیجهٔ مسابقات ورزشی لو برود.';

  @override
  String get videoFilterStartTime => 'زمان آغاز';

  @override
  String get videoFilterEndTime => 'زمان پایان';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'فعال روی $selectedDays';
  }

  @override
  String get from => 'از';

  @override
  String get to => 'تا';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'از $from تا $to';
  }

  @override
  String get notifications => 'اطلاعیه‌ها';

  @override
  String get notificationsDescription =>
      'معین کنید که چه مواردی به شما اطلاع داده شود';

  @override
  String get enableNotificationDescriptions =>
      'یک سرویس در پیش‌زمینه اجرا می‌کند تا ضمن بررسی، شما را از تغییراتی که رصد می‌کند آگاه سازد';

  @override
  String get subscriptionNotification => 'اطلاعیه‌های اشتراک‌ها';

  @override
  String get subscriptionNotificationDescription =>
      'چنانچه به سرویس دهندهٔ مورداستفاده وارد شده‌اید، از ارسال ویدیوهای تازهٔ کانال‌هایی که مشترکشان هستید آگاه شوید';

  @override
  String get subscriptionNotificationTitle => 'ویدیوهای تازه از اشتراک‌های شما';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ویدیوی تازه',
      one: '1 new video',
      zero: '۰ ویدیوی تازه',
    );
    return '$_temp0 در اشتراک‌های شما';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'غیرفعال کردن بهینه‌سازی مصرف باتری لازم است';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'جهت ارسال اطلاعیه، Clipious نیاز دارد تا یک سرویس در پس‌زمینه اجرا کند. برای این که این سرویس بدون مشکل اجرا شود، لازم است که Clipious دسترسی نامحدود به مصرف باتری داشته باشد. ضربه روی تایید، شما را به تنظیمات بهینه‌سازی منتقل خواهد کرد.';

  @override
  String get askToEnableBackgroundServiceTitle => 'اطلاع‌رسانی‌ها خاموش است';

  @override
  String get askToEnableBackgroundServiceContent =>
      'جهت دریافت اطلاع‌رسانی، لازم است که گزینهٔ اطلاع‌رسانی Clipious فعال باشد. برای فعال کردن روی تایید ضربه بزنید.';

  @override
  String get otherNotifications => 'منابع دیگر اطلاع‌رسانی (bell icons)';

  @override
  String get deleteChannelNotificationTitle => 'حذف اطلاع‌رسان کانال؟';

  @override
  String get deleteChannelNotificationContent =>
      'دیگر از این کانال اطلاع‌رسان دریافت نخواهید کرد.';

  @override
  String get deletePlaylistNotificationTitle => 'حذف اطلاع‌رسان فهرست پخش؟';

  @override
  String get deletePlaylistNotificationContent =>
      'دیگر از این فهرست پخش اطلاع‌رسان دریافت نخواهید کرد.';

  @override
  String channelNotificationTitle(String channel) {
    return 'ویدیوی تازه از $channel';
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
      other: '$countString ویدیوی تازه',
      one: '1 new video',
      zero: '۰ ویدیوی تازه',
    );
    return '$_temp0 از $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'ویدیوهای تازه در فهرست پخش $playlist';
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
      other: '$countString ویدیوی تازه',
      one: '۱ ویدیوی تازه',
      zero: '۰ ویدیوی تازه',
    );
    return '$_temp0 in the $playlist playlist';
  }

  @override
  String get foregroundServiceNotificationTitle => 'پایش ویدیوها';

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
    return 'بررسی جهت ویدیوهای تازه هر$_temp0';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions => 'بررسی اشتراک‌ها…';

  @override
  String get foregroundServiceUpdatingPlaylist => 'بررسی فهرست‌های پخش…';

  @override
  String get foregroundServiceUpdatingChannels => 'بررسی کانال‌ها…';

  @override
  String get notificationFrequencySettingsTitle => 'تناوب بررسی ویدیوهای تازه';

  @override
  String get notificationFrequencySettingsDescription =>
      'هر چند وقت یک بار اپلیکیشن وجود ویدیوهای جدید را بررسی کند';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '۱ روز',
        'other': '$hoursساعت',
      },
    );
    return '$_temp0';
  }

  @override
  String get subtitlesBackground => 'پس‌زمینهٔ زیرنویس';

  @override
  String get subtitlesBackgroundDescription =>
      'برای خواناتر کردن زیرنویس، پس‌زمینهٔ سیاه اضافه می‌کند';

  @override
  String get history => 'سابقه';

  @override
  String get deArrowSettingDescription =>
      'جایگزین کردن عنوان‌های گمراه‌کننده با تصویر بندانگشتی';

  @override
  String get deArrowReplaceThumbnails => 'جایگزین کردن تصویر بندانگشتی';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'جایگزین کردن تصویر بندانگشتی علاوه بر عنوان';

  @override
  String get deArrowWarning =>
      'فعال کردن DeArrow به دلیل افزودن درخواست‌های http موردنیاز هر ویدیو، می‌تواند به شکل چشمگیری سرعت استفاده از اپلیکیشن را کاهش دهد';

  @override
  String get copySettingsAsJson =>
      'نسخه‌برداری تنظیمات به صورت JSON در کلیپ‌بورد';

  @override
  String get copySettingsAsJsonDescription =>
      'چنانچه به مشکلی در اپ برخوردید و تصمیم داشتید پیگیری کنید، از تنظیمات برای استفاده در عیب‌یابی به صورت JSON نسخه‌برداری شود';

  @override
  String get seeking => 'مرور ویدیو';

  @override
  String get skipStep => 'میزان عقب/جلو';

  @override
  String get skipStepDescription =>
      'ثانیه‌هایی که زمان عقب/جلو بردن ویدیو رد شود';

  @override
  String get exponentialSkip => 'عقب/جلو کردن به صورت تصاعدی';

  @override
  String get exponentialSkipDescription =>
      'هرچی بیشتر به جلو بزنید، میزان جلو رفتن بزرگتر خواهد بود.';

  @override
  String get fullscreenOnLandscape => 'تمام صفحه در حالت افقی';

  @override
  String get fullscreenOnLandscapeDescription =>
      'هنگامی که دستگاه در حالت افقی است به وضعیت تمام صفحه تغییر بده';

  @override
  String get enabled => 'فعال';

  @override
  String get submitFeedback => 'ارسال بازخورد';

  @override
  String get submitFeedbackDescription =>
      'مشکلی پیدا کرده‌اید یا پیشنهادی دارید؟ از این ابزار برای گرفتن screenshot از برنامه، یادداشت نوشتن روی آن و ارسال بازخورد استفاده کنید';

  @override
  String get feedbackDisclaimer =>
      'برای ارسال بازخورد شما به حساب GitHub نیاز دارید و تصویر شما به صورت ناشناس به Imgur ارسال می شود.';

  @override
  String get feedbackScreenshotError => 'خطا در هنگام بارگذاری تصویر به Imgur';

  @override
  String get channelSortByNewest => 'تازه‌ترین';

  @override
  String get channelSortByOldest => 'قدیمی‌ترین';

  @override
  String get channelSortByPopular => 'محبوب';

  @override
  String get invidiousAccount => 'حساب کاربری Invidious';

  @override
  String get onDeviceSubscriptions => 'روی دستگاه';

  @override
  String get both => 'هردو';

  @override
  String get refresh => 'تازه‌سازی';

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
