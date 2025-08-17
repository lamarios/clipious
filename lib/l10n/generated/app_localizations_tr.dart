// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get subscriptions => 'Abonelikler';

  @override
  String get playlists => 'Çalma listeleri';

  @override
  String get popular => 'Popüler';

  @override
  String get trending => 'Trendler';

  @override
  String get noVideoInPlayList => 'Oynatma listesinde video yok';

  @override
  String get removeFromPlayList => 'Çalma listesinden kaldır';

  @override
  String get deletePlayListQ => 'Çalma Listesini Sil?';

  @override
  String get irreversibleAction => 'Bu eylem geri döndürülemez';

  @override
  String get addPlayList => 'Çalma Listesi Ekle';

  @override
  String get playListName => 'Çalma listesi adı';

  @override
  String get playlistVisibility => 'Görünürlük';

  @override
  String get publicPlaylist => 'Kamu';

  @override
  String get privatePlaylist => 'Özel';

  @override
  String get cancel => 'İptal etmek';

  @override
  String get add => 'Eklemek';

  @override
  String get unlistedPlaylist => 'Listelenmemiş';

  @override
  String get info => 'Bilgi';

  @override
  String get videos => 'Videolar';

  @override
  String get streams => 'Akarsular';

  @override
  String get latestVideos => 'En Yeni Videolar';

  @override
  String get subscribed => 'Abone Olunan';

  @override
  String get subscribe => 'Abone ol';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Abone yok',
        'other': '$count abone',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Paylaş';

  @override
  String get shareYoutubeLink => 'YouTube bağlantısını paylaş';

  @override
  String get shareInvidiousLink => 'Davetsiz bağlantıyı paylaş';

  @override
  String get redirectInvidiousLink =>
      'Davetsiz Yönlendirme bağlantısını paylaşın';

  @override
  String get shareLinkWithTimestamp => 'Zaman damgası ekle';

  @override
  String get ok => 'tamam';

  @override
  String get noChannels => 'Kanal yok';

  @override
  String get noPlaylists => 'Çalma listesi yok';

  @override
  String get channels => 'Kanallar';

  @override
  String get couldntLoadVideo => 'Video yüklenemedi';

  @override
  String get comments => 'Yorumlar';

  @override
  String get recommended => 'Önerilen';

  @override
  String get couldntFetchVideos =>
      'Video alınamadı. Tekrar denemek için dokunun.';

  @override
  String get wizardIntro =>
      'Ortak bir sunucu seçin veya kendinizinkini ekleyin. (Daha sonra ayarlarda değiştirilebilir)';

  @override
  String get startUsingClipious => 'Clipious\'u kullanmaya başlayın';

  @override
  String get videoAddedToPlaylist => 'Video oynatma listesine eklendi';

  @override
  String get videoAddedToQueue => 'Sıraya eklenen video';

  @override
  String get errorAddingVideoToPlaylist =>
      'Oynatma listesine video eklerken hata oluştu';

  @override
  String get itemlistErrorGeneric => 'Veri alınamadı';

  @override
  String get itemListErrorInvalidScope =>
      'Bunu görme izniniz yok, belirteç yöntemini kullanarak oturum açtıysanız oturumu kapatıp tekrar açmayı deneyin';

  @override
  String get selectPlaylist => 'Çalma listesi seç';

  @override
  String get createNewPlaylist => 'Yeni çalma listesi oluştur';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString yanıt',
      one: '1 reply',
      zero: 'Yanıt yok',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Daha fazla yükle';

  @override
  String get topSorting => 'Üst';

  @override
  String get newSorting => 'Yeni';

  @override
  String get streamIsLive => 'Canlı';

  @override
  String get sponsorSkipped => 'Sponsor atlandı';

  @override
  String get selectBrowsingCountry => 'Gözatma ülkesini seçin';

  @override
  String get showOnStart => 'Uygulama başladığında ne gösterileceğini seçin';

  @override
  String get settings => 'Ayarlar';

  @override
  String get browsing => 'Gözatma';

  @override
  String get country => 'Ülke';

  @override
  String get whenAppStartsShow => 'Uygulama başladığında, göster…';

  @override
  String get servers => 'Sunucular';

  @override
  String get manageServers => 'Sunucuları yönet';

  @override
  String currentServer(String current) {
    return 'Şu anda $current kullanıyor';
  }

  @override
  String get useSponsorBlock => 'Sponsor Engelini Kullan';

  @override
  String get sponsorBlockDescription =>
      'Topluluk tarafından gönderilen sponsor segmentlerini atla';

  @override
  String get about => 'Hakkında';

  @override
  String get name => 'İsim';

  @override
  String get package => 'Paket';

  @override
  String get version => 'Sürüm';

  @override
  String get build => 'İnşa etmek';

  @override
  String get addServer => 'Sunucu ekle';

  @override
  String get useThisServer => 'Bu sunucuyu kullan';

  @override
  String get logIn => 'Giriş yap';

  @override
  String get delete => 'Silmek';

  @override
  String get invalidInvidiousServer => 'Geçersiz Davetsiz sunucu';

  @override
  String get yourServers => 'Sunucularınız';

  @override
  String get loggedIn => 'Oturum aç';

  @override
  String get notLoggedIn => 'Giriş yapılmadı';

  @override
  String get addServerHelpText =>
      'Kendi sunucularınızı eklemek için + düğmesini kullanın veya genel bir sunucuya dokunup ekleyin.';

  @override
  String get publicServers => 'Genel sunucular';

  @override
  String get loadingPublicServer => 'Genel sunucular yükleniyor';

  @override
  String get tapToAddServer => 'Listenize sunucu eklemek için dokunun';

  @override
  String get publicServersError =>
      'Genel sunucuların listesi alınamadı. Yeniden denemek için dokunun.';

  @override
  String get appearance => 'Görünüm';

  @override
  String get useDynamicTheme => 'Dinamik renkler';

  @override
  String get useDynamicThemeDescription =>
      'Kullandığınız Malzeme renklerini kullanın (yalnızca Android 12+ \'da mevcuttur)';

  @override
  String get useDash => 'ÇİZGİ kullan';

  @override
  String get useDashDescription =>
      'ÇİZGİ uyarlamalı akış bazen sorunlu olabilir, Youtube bunu kısabilir.';

  @override
  String get videoPlayer => 'Video oynatıcı';

  @override
  String get videoListed => 'Kamu';

  @override
  String get videoUnlisted => 'Listelenmemiş';

  @override
  String get videoIsFamilyFriendly => 'Aile dostu';

  @override
  String get tapToManage => 'Yönetmek için dokunun';

  @override
  String get authentication => 'Kimlik doğrulama';

  @override
  String get tokenLogin => 'Token ile giriş yap';

  @override
  String get tokenLoginDescription => 'Giriş yapmanın önerilen yolu';

  @override
  String get cookieLogin => 'Cookie ile giriş yap';

  @override
  String get cookieLoginDescription =>
      'Belirteç kimlik doğrulamasıyla ilgili sorunlarla karşılaşırsanız bu yöntemi kullanın';

  @override
  String get logout => 'Çıkış yap';

  @override
  String get username => 'Kullanıcı adı';

  @override
  String get password => 'Şifre';

  @override
  String get wrongUsernamePassword => 'Yanlış kullanıcı adı veya şifre';

  @override
  String get error => 'Hata';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats beklenildiği gibi değil';

  @override
  String get malformedStatsEndpointDescription =>
      'Sunucu istatistikleri bitiş noktası beklenen bir yüke yanıt vermedi, anahtar \"software.name \" \"davetsiz\" ile eşit olmalıdır.\nSunucudan yanıt:';

  @override
  String get serverIsNotReachable => 'Sunucuya erişilemiyor';

  @override
  String get videoQueue => 'Video kuyruğu';

  @override
  String get addToQueueList => 'Sıraya ekle';

  @override
  String get addToPlaylist => 'Çalma listesine ekle';

  @override
  String get playNext => 'Sonrakini oyna';

  @override
  String get playNextAddedToQueue => 'Sonraki video oynatılacak';

  @override
  String get addRecommendedToQueue => 'Sonraki otomatik oynatma önerilir';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Hangi tür segmentlerin atlanacağını seçin';

  @override
  String get sponsorBlockCategorySponsor => 'Sponsor';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Ücretli tanıtım, ücretli yönlendirmeler ve doğrudan reklamlar. Beğendikleri nedenlere / içerik oluşturuculara / web sitelerine / ürünlere kendi kendini tanıtmak veya ücretsiz bağırmak için değil.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo =>
      'Ödenmemiş / Kendini Tanıtma';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Ödenmemiş veya kendi kendini tanıtma dışında \"sponsor\" a benzer. Bu, mallarla ilgili bölümleri içerir, bağışlar, veya kiminle işbirliği yaptıkları hakkında bilgi ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Etkileşim Hatırlatıcısı (Abone Ol)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Beğenmek için kısa bir hatırlatma olduğunda, içeriğin ortasında abone olun veya takip edin. Uzunsa veya belirli bir şeyle ilgiliyse, bunun yerine kendini tanıtma altında olmalıdır.';

  @override
  String get sponsorBlockCategoryIntro => 'Ara / Giriş Animasyonu';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Gerçek içeriği olmayan bir aralık. Duraklama, statik kare, yinelenen animasyon olabilir. Bu, bilgi içeren geçişler için kullanılmamalıdır.';

  @override
  String get sponsorBlockCategoryOutro => 'Bitiş Kartları / Krediler';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Krediler veya YouTube bitiş kartları göründüğünde. Bilgi içeren sonuçlar için değil.';

  @override
  String get sponsorBlockCategoryPreview => 'Önizleme / Özet';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Tüm bilgilerin videonun ilerleyen bölümlerinde tekrarlandığı bir serideki bu videoda veya diğer videolarda neler olduğunu gösteren kliplerin toplanması.';

  @override
  String get sponsorBlockCategoryFiller => 'Dolgu Teğeti / Şakalar';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Teğetsel sahneler, yalnızca videonun ana içeriğini anlamak için gerekli olmayan dolgu veya mizah için eklenir. Bu, bağlam veya arka plan ayrıntıları sağlayan bölümleri içermemelidir. Bu, \"eğlence\" havasında olmadığınız zamanlar için tasarlanmış çok agresif bir kategoridir.';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'Müzik: Müzik Dışı Bölüm';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Sadece müzik videolarında kullanım içindir. Bu, yalnızca başka bir kategorinin kapsamadığı müzik videolarının bölümleri için kullanılmalıdır.';

  @override
  String get useProxy => 'Vekil videolar';

  @override
  String get useProxyDescription =>
      'Sunucudan video akışlarını proxyleyerek, bölgesel blokları atlayabilir veya YouTubeu engelleyen ISSYİ atlayabilirsiniz';

  @override
  String get pressDownToShowSettings =>
      'Ayarları göstermek için aşağı tuşuna basın';

  @override
  String get quality => 'Kalite';

  @override
  String get audio => 'Ses';

  @override
  String get subtitles => 'Altyazılar';

  @override
  String get playbackSpeed => 'Oynatma hızı';

  @override
  String get blackBackground => 'Siyah arka plan';

  @override
  String get blackBackgroundDescription => 'OLED ekranda karanlık tema için';

  @override
  String get search => 'Arama';

  @override
  String get subtitleFontSize => 'Altyazılar yazı tipi boyutu';

  @override
  String get subtitleFontSizeDescription =>
      'Cihazınızda çok küçük veya çok büyükse altyazıların boyutunu değiştirin';

  @override
  String get skipSslVerification => 'SSL sertifikası doğrulamasını atla';

  @override
  String get skipSslVerificationDescription =>
      'Kendinden imzalı bir SSL sertifikası kullanmak veya sunucunuzla SSL ile ilgili sorunlar yaşarken.';

  @override
  String get themeBrightness => 'Tema';

  @override
  String get themeLight => 'Işık';

  @override
  String get themeDark => 'Karanlık';

  @override
  String get followSystem => 'Takip sistemi';

  @override
  String get requiresRestart => 'Uygulamanın yeniden başlatılmasını gerektirir';

  @override
  String get appLanguage => 'Uygulama dili';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString video',
      one: '1 video',
      zero: 'Video yok',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Url http:// ya da https:// ile başlamalıdır';

  @override
  String get returnYoutubeDislikeDescription =>
      'Tarafından sağlanan API\'yi kullanarak tahmini video beğenmediklerini göster returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'Özel RYD instance urlsi';

  @override
  String get rydCustomInstanceDescription =>
      'Farklı bir RYD instance\'ı kullan, varsayılanı kullanmak için boş bırakın';

  @override
  String get autoplayVideoOnLoad => 'Yükte videoyu otomatik olarak oynat';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Yüklendikten sonra videoyu otomatik olarak oynatmaya başlayın';

  @override
  String get searchHistory => 'Arama geçmişi';

  @override
  String get searchHistoryDescription => 'Arama geçmişi ayarları';

  @override
  String get enableSearchHistory => 'Arama geçmişini etkinleştir';

  @override
  String get searchHistoryLimit => 'Arama geçmişi sınırı';

  @override
  String get searchHistoryLimitDescription =>
      'Önerilerde kaç önceki aramanın görüneceğini ayarlama';

  @override
  String get shorts => 'Kısalar';

  @override
  String get searchUploadDate => 'Yükleme tarihi';

  @override
  String get searchUploadDateAny => 'Herhangi bir tarih';

  @override
  String get searchUploadDateHour => 'Son Bir Saat';

  @override
  String get searchUploadDateToday => 'Bugün';

  @override
  String get searchUploadDateWeek => 'Bu hafta';

  @override
  String get searchUploadDateMonth => 'Bu ay';

  @override
  String get searchUploadDateYear => 'Bu yıl';

  @override
  String get searchDuration => 'Süre';

  @override
  String get searchDurationAny => 'Herhangi bir süre';

  @override
  String get searchDurationShort => 'Kısa (<4 dakika)';

  @override
  String get searchDurationLong => 'Uzun (> 20 dakika)';

  @override
  String get searchDurationMedium => 'Orta (4-20 dakika)';

  @override
  String get searchSortBy => 'Sırala';

  @override
  String get searchSortRelevance => 'Alaka';

  @override
  String get searchSortRating => 'Değerlendirme';

  @override
  String get searchSortUploadDate => 'Yükleme Tarihi';

  @override
  String get searchSortViewCount => 'Görüntüleme Sayısı';

  @override
  String get clearSearchHistory => 'Arama geçmişini temizle';

  @override
  String get appLogs => 'Uygulama Günlükleri';

  @override
  String get appLogsDescription =>
      'Uygulamada neler olup bittiğinin günlüklerini alın, sorunları bildirmek için yararlı olabilir';

  @override
  String get copyToClipBoard => 'Panoya kopyala';

  @override
  String get logsCopied => 'Panoya kopyalanan günlükler';

  @override
  String get rememberSubtitleLanguage => 'Altyazı dilini hatırla';

  @override
  String get videoFilters => 'Video filtreleri';

  @override
  String nFilters(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString filtre',
      one: '1 filter',
      zero: 'Video yok',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'Aşağıda tanımlanan filtrelere dayanarak uygulamadaki tüm video akışlarındaki videoları gizleyin veya gizleyin. Bu, örneğin spor spoylerini gizlemenize veya şortları belirli bir kanaldan gizlemenize olanak tanır.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Videoları filtrelemek için kurallar tanımlayın';

  @override
  String get videoFilterAllChannels => 'Tüm kanallar';

  @override
  String get addVideoFilter => 'Filtre oluştur';

  @override
  String get editVideoFilter => 'Filtreyi düzenle';

  @override
  String get videoFilterType => 'Tip';

  @override
  String get videoFilterOperation => 'Operasyon';

  @override
  String get videoFilterValue => 'Değer';

  @override
  String get save => 'Kaydetmek';

  @override
  String get videoFilterEditDescription =>
      'Listelerdeki videoları filtrelemek için isteğe bağlı bir kanal, bir filtre türü, işlem ve bir değer seçin. Örnek, tür: video adı, işlem: içerir, değer: test, adlarında test kelimesi bulunan tüm videoları HARİÇ tutacaktır.';

  @override
  String get optional => 'isteğe bağlı';

  @override
  String get videoFilterHideLabel => 'Saklamak';

  @override
  String get videoFilterFilterLabel => 'Şaşırtmak';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter $type $operation \'$value\' olan videolar.';
  }

  @override
  String get videoFiltered =>
      'Aşağıdaki nedenlerden dolayı filtrelenmiş video:';

  @override
  String get videoFilterTapToReveal => 'Ortaya çıkarmak için dokunun';

  @override
  String get videoFilterHide => 'Filtrelenmiş videoları gizle';

  @override
  String get videoFilterHideDescription =>
      'Varsayılan olarak filtrelenmiş videolar gizlenmez, ancak filtrelenme nedenleriyle gizlenmiş olarak gösterilir. Bu ayar, filtrelenmiş videoları listelerden kaldırır.';

  @override
  String get videoFilterNoFilters =>
      'Video filtresi yok, filtre eklemeye başlamak için aşağıdaki + düğmesine dokunun.';

  @override
  String get videoFilterTypeVideoTitle => 'Video başlığı';

  @override
  String get videoFilterTypeChannelName => 'Kanal adı';

  @override
  String get videoFilterTypeVideoLength => 'Video uzunluğu (saniye)';

  @override
  String get videoFilterOperationContains => 'İçeriyor';

  @override
  String get videoFilterOperationNotContain => 'Içermez';

  @override
  String get videoFilterOperationLowerThan => 'Daha düşük';

  @override
  String get videoFilterOperationHigherThan => 'Daha yüksek';

  @override
  String get channel => 'Kanal';

  @override
  String get videoFilterHideAllFromChannel =>
      'Kanaldaki tüm videoları filtrele';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter kanaldaki tüm videolar';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Varsa altyazıları otomatik olarak seçilen son dile ayarlayın';

  @override
  String get lockFullScreenToLandscape =>
      'Tam ekran yönünü video en boy oranına kilitle';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Video formatına göre tam ekran yönünü, geniş video için manzarayı ve portre videoları için portreyi kilitler';

  @override
  String get fillFullscreen =>
      'Videoyu ekrana sığacak şekilde en üst düzeye çıkarın';

  @override
  String get fillFullscreenDescription =>
      'Videoyu tüm ekranı yatay modda dolduracak şekilde ayarlar';

  @override
  String get rememberPlaybackSpeed => 'Oynatma hızını hatırla';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Oynatma hızını otomatik olarak seçilen son hıza ayarlayın';

  @override
  String get downloads => 'İndirilenler';

  @override
  String get download => 'İndirmek';

  @override
  String get videoAlreadyDownloaded => 'Video zaten indirildi';

  @override
  String get noDownloadedVideos =>
      'İndirilen video yok, göz atın, listedeki bir videoya uzun basın veya indirmek için video ekranındaki indir düğmesine dokunun';

  @override
  String get downloadsPlayAll => 'Hepsini oyna';

  @override
  String get videoDownloadStarted => 'Video indirme başladı';

  @override
  String get videoFailedDownloadRetry =>
      'İndirme başarısız oldu, yeniden denemek için dokunun';

  @override
  String get videoDownloadAudioOnly => 'Yalnızca ses';

  @override
  String get manageSubscriptions => 'Abonelikleri Yönet';

  @override
  String get noSubscriptions =>
      'Abonelik yok, videolara göz atın ve istediğiniz herhangi bir kanala abone olun.';

  @override
  String get youCanSubscribeAgainLater =>
      'Bu kanala daha sonra tekrar abone olabilirsiniz';

  @override
  String get unSubscribeQuestion => 'Abonelikten çıkmak mı?';

  @override
  String get clearHistoryQuestion => 'Geçmişi temizlemek mi?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Bu, kullandığınız İnvidious örneğinde hesabınızın görüntüleme geçmişinizi temizleyecektir. Bu geri alınamaz.';

  @override
  String get noHistory =>
      'Görüntüleme geçmişi yok, bazı videoları izleyin ve burada görünecektir';

  @override
  String get homeLayoutEditor => 'Ev düzenini düzenle';

  @override
  String get layoutEditorAddVideoSource => 'Video kaynağı ekle';

  @override
  String get layoutEditorExplanation =>
      'Ana ekranınızda ne görüntüleyeceğinize karar verebilir, yatay kaydırma ve bir büyük kaynak ile en fazla 2 küçük görünüme sahip olabilirsiniz.';

  @override
  String get home => 'Ev';

  @override
  String get library => 'Kütüphane';

  @override
  String get customizeAppLayout => 'Uygulama bölümlerini özelleştirme';

  @override
  String get customizeAppLayoutExplanation =>
      'Ana uygulama gezinme çubuğunda hangi bölümlerin görünmesini istediğinizi seçin. Uygulama başladığında hangi ekranın gösterileceğini seçmek için giriş simgesine tıklayın. Bölümleri sürükleyerek yeniden sıralayabilirsiniz.';

  @override
  String get navigationBarStyle => 'Gezinme çubuğu stili';

  @override
  String get navigationBarLabelAlwaysShowing => 'Etiket her zaman gösteriliyor';

  @override
  String get navigationBarLabelShowOnSelect => 'Seçili öğede gösterilen etiket';

  @override
  String get navigationBarLabelNeverShow => 'Etiketi asla gösterme';

  @override
  String get distractionFreeMode => 'Dikkat dağıtıcı serbest mod';

  @override
  String get distractionFreeModeDescription =>
      'Video yorumlarını ve önerilerini devre dışı bırak';

  @override
  String get secondsShortForm => 'saniye';

  @override
  String get videoFilterApplyDateToFilter =>
      'Videoları belirli zamanlara göre filtreleyin';

  @override
  String get videoFilterDayOfWeek => 'Filtre uygulamak için günleri seçin';

  @override
  String get videoFilterDayOfWeekDescription =>
      'Haftanın günlerini ve filtrelerin uygulandığı zamanı seçerek seçebilirsiniz, örneğin spor etkinlikleri spoylerinden kaçının.';

  @override
  String get videoFilterStartTime => 'Başlama zamanı';

  @override
  String get videoFilterEndTime => 'Bitiş zamanı';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return '$selectedDays tarihinde uygulandı';
  }

  @override
  String get from => '-den';

  @override
  String get to => '-e doğru';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return '$from ve $to arası';
  }

  @override
  String get notifications => 'Bildirimler';

  @override
  String get notificationsDescription =>
      'Bildirdiklerinizi etkinleştirin ve gözden geçirin';

  @override
  String get enableNotificationDescriptions =>
      'İzlemekte olduğunuz değişiklikleri kontrol etmek ve size bildirmek için ön plan hizmetini çalıştırır';

  @override
  String get subscriptionNotification => 'Abonelik bildirimleri';

  @override
  String get subscriptionNotificationDescription =>
      'Geçerli örneğinizde oturum açtıysanız abonelik akışınızdaki yeni videolardan haberdar olun';

  @override
  String get subscriptionNotificationTitle =>
      'Aboneliklerinizden yeni videolar';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString yeni video',
      one: '1 new video',
      zero: 'yeni video yok',
    );
    return 'Abonelik akışınızda  $_temp0 var';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Pil optimizasyonunu devre dışı bırakmak gerekir';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'Clipious bildirimi göndermek için bir arka plan hizmeti çalıştırmanız gerekir. Sorunsuz çalışması için Clipiousa sınırsız pil kullanımı verilmesi gerekir, tamama dokunmak pil optimizasyon ayarlarını açacaktır.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Bildirimler kapalı';

  @override
  String get askToEnableBackgroundServiceContent =>
      'Bildirim almak için Küçük bildirimlerin etkinleştirilmesi gerekir, etkinleştirmek için Tamam\'a basın.';

  @override
  String get otherNotifications => 'Diğer bildirim kaynakları (zil simgeleri)';

  @override
  String get deleteChannelNotificationTitle => 'Kanal bildirimini sil ?';

  @override
  String get deleteChannelNotificationContent =>
      'Bu kanaldan artık bildirim almayacaksınız.';

  @override
  String get deletePlaylistNotificationTitle =>
      'Çalma listesi bildirimini sil ?';

  @override
  String get deletePlaylistNotificationContent =>
      'Bu çalma listesinden artık bildirim almayacaksınız.';

  @override
  String channelNotificationTitle(String channel) {
    return '$channel \'dan yeni videolar';
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
      other: '$countString yeni video var',
      one: '1 yeni video var',
      zero: 'yeni video yok',
    );
    return '$channel oynatma listesinde $_temp0';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return '$playlist oynatma listesindeki yeni videolar';
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
      other: '$countString yeni video var',
      one: '1 yeni video var',
      zero: 'yeni video yok',
    );
    return '$playlist oynatma listesinde $_temp0';
  }

  @override
  String get foregroundServiceNotificationTitle => 'Video izleme';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'saat başı',
        '24': 'gün',
        'other': 'her $hours saat',
      },
    );
    return 'Yeni videolar için her $_temp0 kontrol edecektir.';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'Abonelikleri kontrol etme...';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'Çalma listelerini kontrol etme...';

  @override
  String get foregroundServiceUpdatingChannels =>
      'Kanalları kontrol ediyorum...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Yeni video kontrol frekansı';

  @override
  String get notificationFrequencySettingsDescription =>
      'Uygulamanın yeni videoları ne sıklıkla kontrol edeceği';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '1g',
        'other': '${hours}s',
      },
    );
    return '$_temp0';
  }

  @override
  String get subtitlesBackground => 'Altyazılar arka plan';

  @override
  String get subtitlesBackgroundDescription =>
      'Altyazıları daha okunabilir hale getirmek için altyazılara siyah bir arka plan ekler';

  @override
  String get history => 'Tarih';

  @override
  String get deArrowSettingDescription =>
      'Tıklama yemi başlıklarını ve küçük resimlerini değiştirin';

  @override
  String get deArrowReplaceThumbnails => 'Küçük resimleri değiştir';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Başlıklara ek olarak video küçük resimlerini değiştirin';

  @override
  String get deArrowWarning =>
      'DeArrow\'u etkinleştirmek, her video için fazladan http istekleri gerekli olduğu için, uygulamanın gezinme hızını önemli bir miktarda azaltabilir';

  @override
  String get copySettingsAsJson => 'Ayarları JSON olarak panoya kopyala';

  @override
  String get copySettingsAsJsonDescription =>
      'Uygulama ile ilgili bir sorunla karşılaşırsanız ve bir sorunu gündeme getirmeye karar verirseniz hata ayıklamaya yardımcı olması için ayarları JSON olarak kopyalayın';

  @override
  String get seeking => 'Arayış';

  @override
  String get skipStep => 'İleri / geri adımı atla';

  @override
  String get skipStepDescription =>
      'İleri / geri eylemleri atlamak için saniye';

  @override
  String get exponentialSkip => 'Üstel ileri / geri atlama';

  @override
  String get exponentialSkipDescription =>
      'Ne kadar ileri atlarsanız, adım o kadar büyük olur.';

  @override
  String get fullscreenOnLandscape => 'Manzarada tam ekran';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Cihaz yatay moda döndürüldüğünde tam ekrana geçin';

  @override
  String get enabled => 'Etkin';

  @override
  String get submitFeedback => 'Geri bildirim gönder';

  @override
  String get submitFeedbackDescription =>
      'Hata mı buldunuz ya da bir öneriniz mi var? Uygulamanın ekran görüntüsünü almak, açıklama eklemek ve geri bildirim göndermek için bu aracı kullanın';

  @override
  String get feedbackDisclaimer =>
      'Geri bildirim göndermek için bir GitHub hesabına ihtiyacınız olacak ve ekran görüntünüz anonim olarak Imgur\'a gönderilecektir.';

  @override
  String get feedbackScreenshotError =>
      'Imgur\'a ekran görüntüsü yüklenirken hata oluştu';

  @override
  String get channelSortByNewest => 'En Yeni';

  @override
  String get channelSortByOldest => 'En Eski';

  @override
  String get channelSortByPopular => 'Popüler';

  @override
  String get invidiousAccount => 'Invidious hesabı';

  @override
  String get onDeviceSubscriptions => 'Cihaz üstünde';

  @override
  String get both => 'İkisi de';

  @override
  String get refresh => 'Yenile';

  @override
  String get addBasicAuth => 'Basit Kimlik Doğrulaması Ekle';

  @override
  String get addBasicAuthExplanation =>
      'Eğer sunucunuz basit HTTP kimlik doğrulaması gerektiriyorsa, detayları aşağıya ekleyiniz. Bunlar Invidious hesap detaylarınız değildir';

  @override
  String get addHeader => 'Üstbilgi ekle';

  @override
  String get advancedConfiguration => 'Gelişmiş Yapılandırma';

  @override
  String get customHeaders => 'Özel üstbilgi';

  @override
  String get customHeadersExplanation =>
      'Üstbilgiyi invidious sunucusuna gönderilecek şekilde ayarla';

  @override
  String get value => 'Değer';

  @override
  String get testAndAddServer => 'Sına ve sunucu ekle';

  @override
  String get alsoTestServerConfig =>
      'Ayrıca sunucu yapılandırmasını sına, küçük resimlerin düzgün görüntülenmesi gibi';

  @override
  String get serverAlreadyExists => 'Sunucu çoktan ayarlarda mevcut';

  @override
  String get wrongThumbnailConfiguration =>
      'Sunucu ulaşılabilir fakat düzgün yapılandırılmamış, video ve kanal küçük resimleri düzgün görüntülenmeyecektir. Eğer bunla sorununuz yoksa sunucu sınama yapılandırmasını devre dışı bırakın, aksi halde sunucunuzu düzeltin';

  @override
  String get openWikiLink => 'Wikiyi yardım için aç';

  @override
  String get serverUnreachable =>
      'Sunucu ulaşılabilir değil, ya da geçerli bir invidious sunucusu değil';

  @override
  String get copyToDownloadFolder => 'İndirme klasörüne kopyala';

  @override
  String get fileCopiedToDownloadFolder => 'Dosya indirme klasörüne kopyalandı';

  @override
  String get videoDeleted => 'Video silindi';

  @override
  String get sleepTimer => 'Uyku zamanlayıcısı';

  @override
  String get stopTheVideo => 'Videoyu durdur';

  @override
  String get stopTheVideoExplanation =>
      'Eğer etkinleştirilmişse, video kapatılacaktır, eğer devre dışı bırakılmışsa, video sadece durdurulacaktır';

  @override
  String get setTimer => 'Zamanlayıcı ayarla';

  @override
  String get cancelSleepTimer => 'Uyku zamanlayıcısını devre dışı bırak';

  @override
  String premieresIn(Object formattedDuration) {
    return '$formattedDuration içinde ilk gösterime girecek';
  }

  @override
  String get screenControls => 'Ekran kontrolleri';

  @override
  String get screenControlsExplanation =>
      'Tam ekranda bir video izlerken, soldan ya da sağdan dikey olarak taşımak, sırasıyla parlaklığı ya da sesi ayarlayacaktır';

  @override
  String get retry => 'Yeniden dene';

  @override
  String get forceTvUi => 'TV arayüzünü zorla';

  @override
  String get forceTvUiExplanation =>
      'Arayüzün TV deneyimi olmasını zorla, leanback sistem yapılandırmasına sahip olmayan bazı cihazlar için kullanışlı olabilir. Uygulamayı yeniden başlatmak gereklidir';

  @override
  String get noPublicServers => 'Hiçbir herkese açık sunucu mevcut değil';

  @override
  String get tapToSeeHow =>
      'Kendi ev sahipliğinizi nasıl yapacağınızı görmek için dokunun';

  @override
  String get referToInvidiousWebsiteForHostingInstructions =>
      'Invidious\'u nasıl barındıracağınıza dair talimatlar için Invidious web sitesine bakın';
}
