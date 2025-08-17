// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get subscriptions => 'اشتراكات';

  @override
  String get playlists => 'قوائم التشغيل';

  @override
  String get popular => 'الاكثر شهرة';

  @override
  String get trending => 'الرائج';

  @override
  String get noVideoInPlayList => 'لا يوجد فيديو في القائمة التشغيل';

  @override
  String get removeFromPlayList => 'إزالة من القائمة التشغيل';

  @override
  String get deletePlayListQ => 'حذف القائمة التشغيل؟';

  @override
  String get irreversibleAction => 'هذا العمل لا رجوع فيه';

  @override
  String get addPlayList => 'إضافة إلى القائمة التشغيل';

  @override
  String get playListName => 'إسم قائمة التشغيل';

  @override
  String get playlistVisibility => 'ظهور';

  @override
  String get publicPlaylist => 'عام';

  @override
  String get privatePlaylist => 'خاص';

  @override
  String get cancel => 'إلغاء';

  @override
  String get add => 'إضافة';

  @override
  String get unlistedPlaylist => 'إزالة من القائمة';

  @override
  String get info => 'معلومات';

  @override
  String get videos => 'فيديوهات';

  @override
  String get streams => 'بث';

  @override
  String get latestVideos => 'آخر الفيديوات';

  @override
  String get subscribed => 'مشترك';

  @override
  String get subscribe => 'اشتراك';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'لا يوجد مشتركين',
        'other': '$count مشتركين',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'شارك';

  @override
  String get shareYoutubeLink => 'مشاركة الرابط اليوتيوب';

  @override
  String get shareInvidiousLink => 'مشاركة رابط إنفيديوس';

  @override
  String get redirectInvidiousLink => 'مشاركة رابط إعادة توجيه إنفيديوس';

  @override
  String get shareLinkWithTimestamp => 'إضافة الطابع الزمني';

  @override
  String get ok => 'موافق';

  @override
  String get noChannels => 'لا توجد قنوات';

  @override
  String get noPlaylists => 'لا توجد قوائم تشغيل';

  @override
  String get channels => 'قنوات';

  @override
  String get couldntLoadVideo => 'تعذر تحميل الفيديو';

  @override
  String get comments => 'التعليقات';

  @override
  String get recommended => 'موصى به';

  @override
  String get couldntFetchVideos =>
      'تعذر جلب مقاطع الفيديو. انقر للمحاولة مرة أخرى.';

  @override
  String get wizardIntro =>
      'حدد خادماً عاماً أو أضف خادمك الخاص. (يمكن تغييرها لاحقا في الإعدادات)';

  @override
  String get startUsingClipious => 'ابدأ باستخدام كِلبّيوس';

  @override
  String get videoAddedToPlaylist => 'تمت إضافة الفيديو إلى قائمة التشغيل';

  @override
  String get videoAddedToQueue => 'تمت إضافة الفيديو إلى قائمة الانتظار';

  @override
  String get errorAddingVideoToPlaylist =>
      'حدث خطأ أثناء إضافة الفيديو إلى قائمة التشغيل';

  @override
  String get itemlistErrorGeneric => 'تعذر جلب البيانات';

  @override
  String get itemListErrorInvalidScope =>
      'ليس لديك الإذن لرؤية هذا، إذا قمت بتسجيل الدخول باستخدام طريقة الرمز المميز، فحاول تسجيل الخروج والدخول مرة أخرى';

  @override
  String get selectPlaylist => 'اختر قائمة التشغيل';

  @override
  String get createNewPlaylist => 'إنشاء قائمة تشغيل جديدة';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ردود',
      one: 'رد واحد',
      zero: 'لا يوجد ردود',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'تحميل المزيد';

  @override
  String get topSorting => 'أعلى';

  @override
  String get newSorting => 'حديث';

  @override
  String get streamIsLive => 'مباشر';

  @override
  String get sponsorSkipped => 'تم تخطي فقرة الراعي';

  @override
  String get selectBrowsingCountry => 'حدد بلد التصفح';

  @override
  String get showOnStart => 'اختر ما تريد إظهاره عند بدء تشغيل التطبيق';

  @override
  String get settings => 'الإعدادات';

  @override
  String get browsing => 'التصفح';

  @override
  String get country => 'البلد';

  @override
  String get whenAppStartsShow => 'عند بدء تشغيل التطبيق ، أظهر …';

  @override
  String get servers => 'الخوادم';

  @override
  String get manageServers => 'إدارة الخوادم';

  @override
  String currentServer(String current) {
    return 'يتم استخدام $current حالياً';
  }

  @override
  String get useSponsorBlock => 'استخدم حجب فقرة الراعي';

  @override
  String get sponsorBlockDescription => 'تخطي مقاطع الراعي المقدمة من المجتمع';

  @override
  String get about => 'نبذة عن';

  @override
  String get name => 'الاسم';

  @override
  String get package => 'الحزمة';

  @override
  String get version => 'الإصدار';

  @override
  String get build => 'البناء';

  @override
  String get addServer => 'إضافة خادم';

  @override
  String get useThisServer => 'استخدم هذا الخادم';

  @override
  String get logIn => 'تسجيل الدخول';

  @override
  String get delete => 'حذف';

  @override
  String get invalidInvidiousServer => 'خادم غير صالح غير صالح';

  @override
  String get yourServers => 'خوادمك';

  @override
  String get loggedIn => 'تسجيل الدخول';

  @override
  String get notLoggedIn => 'لم يتم تسجيل الدخول';

  @override
  String get addServerHelpText =>
      'استخدم زر + لإضافة خوادمك الخاصة أو انقر على خادم عام وأضفه.';

  @override
  String get publicServers => 'الخوادم العامة';

  @override
  String get loadingPublicServer => 'تحميل الخوادم العامة';

  @override
  String get tapToAddServer => 'انقر لإضافة خادم إلى قائمتك';

  @override
  String get publicServersError =>
      'تعذر جلب قائمة الخوادم العامة. انقر لإعادة المحاولة.';

  @override
  String get appearance => 'المظهر';

  @override
  String get useDynamicTheme => '–ألوان ديناميكية';

  @override
  String get useDynamicThemeDescription =>
      'استخدم مواد أنت ألوان (متوفر فقط على أندرويد 12+)';

  @override
  String get useDash => 'استخدم DASH';

  @override
  String get useDashDescription =>
      'قد يكون البث التكيفي لـ DASH إشكاليًا في بعض الأحيان، ويمكن أن يخنقه Youtube.';

  @override
  String get videoPlayer => 'مشغل الفيديو';

  @override
  String get videoListed => 'عام';

  @override
  String get videoUnlisted => 'غير مدرج';

  @override
  String get videoIsFamilyFriendly => 'مناسبة للعائلات';

  @override
  String get tapToManage => 'انقر للإدارة';

  @override
  String get authentication => 'المصادقة';

  @override
  String get tokenLogin => 'تسجيل الدخول باستخدام الرمز المميز';

  @override
  String get tokenLoginDescription => 'الطريقة الموصى بها لتسجيل الدخول';

  @override
  String get cookieLogin => 'تسجيل الدخول باستخدام ملف تعريف الارتباط';

  @override
  String get cookieLoginDescription =>
      'استخدم هذه الطريقة إذا كنت تواجه مشكلات في مصادقة الرمز المميز';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get password => 'كلمة المرور';

  @override
  String get wrongUsernamePassword => 'اسم مستخدم أو كلمة مرور خاطئة';

  @override
  String get error => 'خطأ';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats is not as expected';

  @override
  String get malformedStatsEndpointDescription =>
      'لم تستجب نقطة نهاية إحصائيات الخادم حمولة متوقعة، يجب أن يكون المفتاح \"software.name\" يساوي \"غير صالح\".\nالاستجابة من الخادم:';

  @override
  String get serverIsNotReachable => 'لا يمكن الوصول إلى الخادم';

  @override
  String get videoQueue => 'قائمة انتظار الفيديو';

  @override
  String get addToQueueList => 'إضافة إلى قائمة الانتظار';

  @override
  String get addToPlaylist => 'إضافة إلى قائمة التشغيل';

  @override
  String get playNext => 'اللعب بعد ذلك';

  @override
  String get playNextAddedToQueue => 'سيتم تشغيل الفيديو التالي';

  @override
  String get addRecommendedToQueue => 'يوصى بالتشغيل التلقائي التالي';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'حدد نوع المقاطع المراد تخطيها';

  @override
  String get sponsorBlockCategorySponsor => 'الراعي';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'الترويج المدفوع والإحالات المدفوعة والإعلانات المباشرة. ليس للترويج الذاتي أو الصراخ المجاني للقضايا/المبدعين/المواقع الإلكترونية/المنتجات التي يحبونها.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => 'ترقية ذاتية/بدون أجر';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'مشابه لـ \"الراعي\" باستثناء الترويج الذاتي أو غير المدفوع الأجر. يتضمن ذلك أقسامًا عن البضائع أو التبرعات أو معلومات حول من تعاونوا معه ';

  @override
  String get sponsorBlockCategoryInteraction => 'تذكير التفاعل (اشتراك)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'عندما يكون هناك تذكير قصير للإعجاب أو الاشتراك أو المتابعة في منتصف المحتوى. إذا كان طويلاً أو عن شيء محدد، فيجب أن يكون تحت الترويج الذاتي بدلاً من ذلك.';

  @override
  String get sponsorBlockCategoryIntro => 'رسوم متحركة بينية/استهلالية';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'فاصل بدون محتوى فعلي. يمكن أن تكون وقفة أو إطار ثابت أو رسوم متحركة متكررة. لا ينبغي استخدام هذا في الانتقالات التي تحتوي على معلومات.';

  @override
  String get sponsorBlockCategoryOutro => 'بطاقات النهاية/الرصيد';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'الاعتمادات أو عند ظهور بطاقات نهاية يوتيوب. ليس للاستنتاجات مع المعلومات.';

  @override
  String get sponsorBlockCategoryPreview => 'المعاينة/الخلاصة';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'مجموعة من المقاطع التي تظهر ما سيأتي في هذا الفيديو أو مقاطع الفيديو الأخرى في سلسلة حيث تتكرر جميع المعلومات في وقت لاحق في الفيديو.';

  @override
  String get sponsorBlockCategoryFiller => 'حشو اللمز/النكات';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'المشاهد العرضية المضافة فقط للحشو أو الفكاهة غير المطلوبة لفهم المحتوى الرئيسي للفيديو. يجب ألا يتضمن ذلك المقاطع التي توفر السياق أو تفاصيل الخلفية. هذه فئة عدوانية للغاية مخصصة عندما لا تكون في مزاج \"المرح\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'الموسيقى القسم غير الموسيقي';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'للاستخدام في الفيديوهات الموسيقية فقط. يجب استخدام هذا فقط لمقاطع الفيديو الموسيقية التي لا تغطيها بالفعل فئة أخرى.';

  @override
  String get useProxy => 'فيديوهات التوكيل';

  @override
  String get useProxyDescription =>
      'من خلال استخدام البروكسي لبث الفيديو من الخادم، يمكنك تجاوز الحظر الإقليمي أو حجب مزود خدمة الإنترنت ليوتيوب';

  @override
  String get pressDownToShowSettings => 'اضغط لأسفل لإظهار الإعدادات';

  @override
  String get quality => 'الجودة';

  @override
  String get audio => 'الصوت';

  @override
  String get subtitles => 'الترجمات';

  @override
  String get playbackSpeed => 'سرعة التشغيل';

  @override
  String get blackBackground => 'خلفية سوداء';

  @override
  String get blackBackgroundDescription => 'للسمات الداكنة على شاشة OLED';

  @override
  String get search => 'بحث';

  @override
  String get subtitleFontSize => 'حجم خط الترجمة';

  @override
  String get subtitleFontSizeDescription =>
      'قم بتغيير حجم الترجمة إذا كانت صغيرة جدًا أو كبيرة جدًا على جهازك';

  @override
  String get skipSslVerification => 'تخطي التحقق من شهادة SSL';

  @override
  String get skipSslVerificationDescription =>
      'لاستخدام شهادة SSL موقعة ذاتيًا، أو عند وجود مشكلات متعلقة بـ SSL مع الخادم الخاص بك.';

  @override
  String get themeBrightness => 'الموضوع';

  @override
  String get themeLight => 'خفيف';

  @override
  String get themeDark => 'داكن';

  @override
  String get followSystem => 'اتبع النظام';

  @override
  String get requiresRestart => 'يتطلب إعادة تشغيل التطبيق';

  @override
  String get appLanguage => 'لغة التطبيق';

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
      'عرض تقديرات عدم الإعجاب بالفيديو باستخدام واجهة برمجة التطبيقات (API) التي يوفرها موقع returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'Custom RYD instance url';

  @override
  String get rydCustomInstanceDescription =>
      'Use a different RYD instance, leave empty to use the default';

  @override
  String get autoplayVideoOnLoad => 'تشغيل الفيديو تلقائياً عند التحميل';

  @override
  String get autoplayVideoOnLoadDescription =>
      'بدء تشغيل الفيديو تلقائياً بعد تحميله';

  @override
  String get searchHistory => 'تاريخ البحث';

  @override
  String get searchHistoryDescription => 'إعدادات سجل البحث';

  @override
  String get enableSearchHistory => 'تمكين سجل البحث';

  @override
  String get searchHistoryLimit => 'حد محفوظات البحث';

  @override
  String get searchHistoryLimitDescription =>
      'تعيين عدد عمليات البحث السابقة التي ستظهر في الاقتراحات';

  @override
  String get shorts => 'السراويل القصيرة';

  @override
  String get searchUploadDate => 'تاريخ التحميل';

  @override
  String get searchUploadDateAny => 'أي تاريخ';

  @override
  String get searchUploadDateHour => 'آخر ساعة';

  @override
  String get searchUploadDateToday => 'اليوم';

  @override
  String get searchUploadDateWeek => 'هذا الأسبوع';

  @override
  String get searchUploadDateMonth => 'هذا الشهر';

  @override
  String get searchUploadDateYear => 'هذا العام';

  @override
  String get searchDuration => 'المدة';

  @override
  String get searchDurationAny => 'أي مدة';

  @override
  String get searchDurationShort => 'قصير (أقل من 4 دقائق)';

  @override
  String get searchDurationLong => 'طويلة (أكثر من 20 دقيقة)';

  @override
  String get searchDurationMedium => 'متوسطة (4-20 دقيقة)';

  @override
  String get searchSortBy => 'فرز حسب';

  @override
  String get searchSortRelevance => 'الصلة بالموضوع';

  @override
  String get searchSortRating => 'التقييم';

  @override
  String get searchSortUploadDate => 'تاريخ التحميل';

  @override
  String get searchSortViewCount => 'عرض العدد';

  @override
  String get clearSearchHistory => 'مسح سجل البحث';

  @override
  String get appLogs => 'سجلات التطبيق';

  @override
  String get appLogsDescription =>
      'الحصول على سجلات لما يحدث في التطبيق، يمكن أن تكون مفيدة للإبلاغ عن المشكلات';

  @override
  String get copyToClipBoard => 'نسخ إلى الحافظة';

  @override
  String get logsCopied => 'السجلات المنسوخة إلى الحافظة';

  @override
  String get rememberSubtitleLanguage => 'تذكر لغة الترجمة';

  @override
  String get videoFilters => 'فلاتر الفيديو';

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
      'إخفاء مقاطع الفيديو أو التعتيم عليها من جميع موجزات الفيديو في التطبيق بناءً على الفلاتر المحددة أدناه. يسمح لك ذلك على سبيل المثال بإخفاء المفسدين الرياضيين أو إخفاء مقاطع الفيديو القصيرة من قناة معينة.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'تحديد قواعد لتصفية مقاطع الفيديو';

  @override
  String get videoFilterAllChannels => 'جميع القنوات';

  @override
  String get addVideoFilter => 'إنشاء فلتر';

  @override
  String get editVideoFilter => 'تحرير الفلتر';

  @override
  String get videoFilterType => 'النوع';

  @override
  String get videoFilterOperation => 'العملية';

  @override
  String get videoFilterValue => 'القيمة';

  @override
  String get save => 'الحفظ';

  @override
  String get videoFilterEditDescription =>
      'حدد قناة اختيارية ونوع مرشح وعملية وقيمة لتصفية مقاطع الفيديو من القوائم. مثال، اكتب: اسم الفيديو، العملية: يحتوي على، القيمة: اختبار، ستستثني جميع مقاطع الفيديو التي تحتوي على كلمة \"اختبار\" في اسمها.';

  @override
  String get optional => 'اختياري';

  @override
  String get videoFilterHideLabel => 'إخفاء';

  @override
  String get videoFilterFilterLabel => 'التعتيم';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter videos where $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered => 'تمت تصفية الفيديو للسبب (الأسباب) التالية:';

  @override
  String get videoFilterTapToReveal => 'انقر للكشف عن';

  @override
  String get videoFilterHide => 'إخفاء مقاطع الفيديو التي تمت تصفيتها';

  @override
  String get videoFilterHideDescription =>
      'بشكل افتراضي لا يتم إخفاء مقاطع الفيديو التي تمت تصفيتها ولكن يتم عرضها على أنها مبهمة مع سبب (أسباب) تصفيتها. يزيل هذا الإعداد مقاطع الفيديو التي تمت تصفيتها من القوائم.';

  @override
  String get videoFilterNoFilters =>
      'لا توجد فلاتر فيديو، اضغط على زر \"+\" أدناه لبدء إضافة الفلاتر.';

  @override
  String get videoFilterTypeVideoTitle => 'عنوان الفيديو';

  @override
  String get videoFilterTypeChannelName => 'اسم القناة';

  @override
  String get videoFilterTypeVideoLength => 'طول الفيديو (بالثانية)';

  @override
  String get videoFilterOperationContains => 'يحتوي على';

  @override
  String get videoFilterOperationNotContain => 'لا يحتوي على';

  @override
  String get videoFilterOperationLowerThan => '‌أقل من';

  @override
  String get videoFilterOperationHigherThan => 'أعلى من';

  @override
  String get channel => 'القناة';

  @override
  String get videoFilterHideAllFromChannel =>
      'تصفية جميع مقاطع الفيديو من القناة';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter جميع مقاطع الفيديو من القناة';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'ضبط الترجمة تلقائياً على اللغة الأخيرة المحددة تلقائياً، إذا كانت متوفرة';

  @override
  String get lockFullScreenToLandscape =>
      'قفل اتجاه ملء الشاشة إلى نسبة العرض إلى الارتفاع للفيديو';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'يقفل اتجاه ملء الشاشة بناءً على تنسيق الفيديو، أفقي للفيديو العريض وعمودي لمقاطع الفيديو العمودية';

  @override
  String get fillFullscreen => 'تكبير الفيديو لتناسب الشاشة';

  @override
  String get fillFullscreenDescription =>
      'يضبط الفيديو لملء الشاشة بالكامل في الوضع الأفقي';

  @override
  String get rememberPlaybackSpeed => 'تذكر سرعة التشغيل';

  @override
  String get rememberPlaybackSpeedDescription =>
      'ضبط سرعة التشغيل تلقائياً على آخر سرعة تم تحديدها';

  @override
  String get downloads => 'التنزيلات';

  @override
  String get download => 'تنزيل';

  @override
  String get videoAlreadyDownloaded => 'تم تنزيل الفيديو بالفعل';

  @override
  String get noDownloadedVideos =>
      'لا توجد مقاطع فيديو تم تنزيلها، تصفح أو اضغط مطولاً على مقطع فيديو في قائمة أو اضغط على زر التنزيل على شاشة الفيديو للتنزيل';

  @override
  String get downloadsPlayAll => 'تشغيل الكل';

  @override
  String get videoDownloadStarted => 'بدء تنزيل الفيديو';

  @override
  String get videoFailedDownloadRetry => 'فشل التنزيل، انقر لإعادة المحاولة';

  @override
  String get videoDownloadAudioOnly => 'الصوت فقط';

  @override
  String get manageSubscriptions => 'إدارة الاشتراكات';

  @override
  String get noSubscriptions =>
      'لا توجد اشتراكات، تصفح مقاطع الفيديو واشترك في أي قناة تريدها.';

  @override
  String get youCanSubscribeAgainLater =>
      'يمكنك الاشتراك في هذه القناة مرة أخرى لاحقاً';

  @override
  String get unSubscribeQuestion => 'إلغاء الاشتراك؟';

  @override
  String get clearHistoryQuestion => '‌مسح التاريخ ?';

  @override
  String get clearHistoryQuestionExplanation =>
      'سيؤدي هذا إلى مسح سجل المشاهدة الخاص بك لحسابك على مثيل Invidious الذي تستخدمه. لا يمكن التراجع عن ذلك.';

  @override
  String get noHistory =>
      'لا يوجد سجل مشاهدة، شاهد بعض مقاطع الفيديو وستظهر هنا';

  @override
  String get homeLayoutEditor => 'تحرير تخطيط الصفحة الرئيسية';

  @override
  String get layoutEditorAddVideoSource => 'إضافة مصدر فيديو';

  @override
  String get layoutEditorExplanation =>
      'يمكنك تحديد ما ستعرضه على شاشتك الرئيسية، يمكنك الحصول على ما يصل إلى عرضين صغيرين مع تمرير أفقي ومصدر واحد كبير.';

  @override
  String get home => '‌الصفحة الرئيسية';

  @override
  String get library => '‌المكتبة';

  @override
  String get customizeAppLayout => 'تخصيص أقسام التطبيق';

  @override
  String get customizeAppLayoutExplanation =>
      'حدد الأقسام التي تريد أن تظهر في شريط التنقل الرئيسي للتطبيق. انقر على أيقونة الصفحة الرئيسية لتحديد الشاشة التي تظهر عند بدء تشغيل التطبيق. يمكنك إعادة ترتيب الأقسام عن طريق سحبها.';

  @override
  String get navigationBarStyle => 'نمط شريط التنقل';

  @override
  String get navigationBarLabelAlwaysShowing => 'تظهر التسمية دائمًا';

  @override
  String get navigationBarLabelShowOnSelect =>
      'التسمية المعروضة على العنصر المحدد';

  @override
  String get navigationBarLabelNeverShow => 'عدم إظهار الملصق';

  @override
  String get distractionFreeMode => 'وضع عدم التشتيت';

  @override
  String get distractionFreeModeDescription => 'تعطيل تعليقات وتوصيات الفيديو';

  @override
  String get secondsShortForm => 'ثوانٍ';

  @override
  String get videoFilterApplyDateToFilter =>
      'تصفية مقاطع الفيديو في أوقات محددة';

  @override
  String get videoFilterDayOfWeek => 'حدد أيام لتطبيق الفلاتر';

  @override
  String get videoFilterDayOfWeekDescription =>
      'يمكنك اختيار أيام الأسبوع والوقت الذي تنطبق عليه الفلاتر بشكل انتقائي، على سبيل المثال، تجنب إفساد الأحداث الرياضية.';

  @override
  String get videoFilterStartTime => 'وقت البدء';

  @override
  String get videoFilterEndTime => 'وقت الانتهاء';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'تطبق على $selectedDays';
  }

  @override
  String get from => 'من';

  @override
  String get to => 'إلى';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'من $from إلى $to';
  }

  @override
  String get notifications => 'الإشعارات';

  @override
  String get notificationsDescription =>
      'تمكين ومراجعة ما يتم إعلامك به ومراجعته';

  @override
  String get enableNotificationDescriptions =>
      'تشغيل الخدمة الأمامية للتحقق من التغييرات التي تراقبها وإخطارك بها';

  @override
  String get subscriptionNotification => 'إشعارات الاشتراك';

  @override
  String get subscriptionNotificationDescription =>
      'احصل على إشعارات بمقاطع الفيديو الجديدة من موجز اشتراكك إذا قمت بتسجيل الدخول إلى مثيلك الحالي';

  @override
  String get subscriptionNotificationTitle => 'فيديوهات جديدة من اشتراكاتك';

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
      'مطلوب تعطيل تحسين البطارية المعطلة';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'من أجل إرسال الإشعارات يحتاج Clipious إلى تشغيل خدمة في الخلفية. ولكي تعمل بسلاسة، يجب أن يتم منح Clipious استخدامًا غير مقيّد للبطارية دون قيود، وسيؤدي النقر على موافق إلى فتح إعدادات تحسين البطارية.';

  @override
  String get askToEnableBackgroundServiceTitle => 'تم إيقاف تشغيل الإشعارات';

  @override
  String get askToEnableBackgroundServiceContent =>
      'للحصول على إشعارات، يجب تمكين إشعارات Clipious، اضغط على موافق لتمكينها.';

  @override
  String get otherNotifications => 'مصادر الإشعارات الأخرى (أيقونات الجرس)';

  @override
  String get deleteChannelNotificationTitle => 'حذف إشعار القناة ?';

  @override
  String get deleteChannelNotificationContent =>
      'لن تتلقى إشعارات أخرى من هذه القناة.';

  @override
  String get deletePlaylistNotificationTitle => 'إشعار حذف قائمة التشغيل؟';

  @override
  String get deletePlaylistNotificationContent =>
      'لن تتلقى إشعارات أخرى من قائمة التشغيل هذه.';

  @override
  String channelNotificationTitle(String channel) {
    return 'فيديوهات جديدة من $channel';
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
  String get foregroundServiceNotificationTitle => 'المراقبة بالفيديو';

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
      'التحقق من الاشتراكات...';

  @override
  String get foregroundServiceUpdatingPlaylist => 'التحقق من قوائم التشغيل...';

  @override
  String get foregroundServiceUpdatingChannels => 'التحقق من القنوات...';

  @override
  String get notificationFrequencySettingsTitle => 'تردد فحص الفيديو الجديد';

  @override
  String get notificationFrequencySettingsDescription =>
      'عدد المرات التي سيتحقق فيها التطبيق من وجود مقاطع فيديو جديدة';

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
  String get subtitlesBackground => 'خلفية الترجمة';

  @override
  String get subtitlesBackgroundDescription =>
      'يضيف خلفية سوداء إلى الترجمة لجعلها أكثر سهولة في القراءة';

  @override
  String get history => 'التاريخ';

  @override
  String get deArrowSettingDescription =>
      'استبدال عناوين طعم النقر والصور المصغرة';

  @override
  String get deArrowReplaceThumbnails => 'استبدال الصور المصغرة';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'استبدال الصور المصغرة للفيديو بالإضافة إلى العناوين';

  @override
  String get deArrowWarning =>
      'يمكن أن يؤدي تمكين DeArrow إلى تقليل سرعة تصفح التطبيق بشكل كبير حيث يلزم وجود طلبات http إضافية لكل مقطع فيديو واحد';

  @override
  String get copySettingsAsJson => 'نسخ الإعدادات بصيغة JSON إلى الحافظة';

  @override
  String get copySettingsAsJsonDescription =>
      'انسخ الإعدادات بصيغة JSON للمساعدة في تصحيح الأخطاء إذا واجهت مشكلة في التطبيق وقررت رفع مشكلة';

  @override
  String get seeking => 'البحث عن';

  @override
  String get skipStep => 'تخطي خطوة للأمام/للخلف';

  @override
  String get skipStepDescription =>
      'ثوانٍ للتخطي في الإجراءات الأمامية/الخلفية';

  @override
  String get exponentialSkip => 'التخطي الأسي للأمام/للخلف';

  @override
  String get exponentialSkipDescription =>
      'كلما تخطيت إلى الأمام، كلما كانت الخطوة أكبر.';

  @override
  String get fullscreenOnLandscape => 'شاشة كاملة على الوضع الأفقي';

  @override
  String get fullscreenOnLandscapeDescription =>
      'التبديل إلى وضع ملء الشاشة عند تدوير الجهاز إلى الوضع الأفقي';

  @override
  String get enabled => 'ممكّنة';

  @override
  String get submitFeedback => 'إرسال الملاحظات';

  @override
  String get submitFeedbackDescription =>
      'هل عثرت على خطأ أو لديك اقتراح؟ استخدم هذه الأداة لالتقاط لقطة شاشة للتطبيق، وقم بالتعليق عليها وإرسال الملاحظات';

  @override
  String get feedbackDisclaimer =>
      'لإرسال الملاحظات ستحتاج إلى حساب GitHub وسيتم إرسال لقطة الشاشة الخاصة بك إلى Imgur بشكل مجهول.';

  @override
  String get feedbackScreenshotError => 'خطأ أثناء تحميل لقطة شاشة على Imgur';

  @override
  String get channelSortByNewest => 'الأحدث';

  @override
  String get channelSortByOldest => 'الأقدم';

  @override
  String get channelSortByPopular => 'مشهور';

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
