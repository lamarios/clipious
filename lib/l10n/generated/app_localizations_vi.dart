// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get subscriptions => 'Đăng ký';

  @override
  String get playlists => 'Danh sách phát';

  @override
  String get popular => 'Phổ biến';

  @override
  String get trending => 'Xu hướng';

  @override
  String get noVideoInPlayList => 'Không có video trong danh sách phát';

  @override
  String get removeFromPlayList => 'Xóa khỏi danh sách phát';

  @override
  String get deletePlayListQ => 'Xóa danh sách phát?';

  @override
  String get irreversibleAction => 'Hành động không thể khôi phục';

  @override
  String get addPlayList => 'Thêm danh sách phát';

  @override
  String get playListName => 'Tên danh sách phát';

  @override
  String get playlistVisibility => 'Hiển thị';

  @override
  String get publicPlaylist => 'Công cộng';

  @override
  String get privatePlaylist => 'Riêng tư';

  @override
  String get cancel => 'Hủy';

  @override
  String get add => 'Thêm';

  @override
  String get unlistedPlaylist => 'Chưa liệt kê';

  @override
  String get info => 'Thông tin';

  @override
  String get videos => 'Phim';

  @override
  String get streams => 'Truyền';

  @override
  String get latestVideos => 'Video mới nhất';

  @override
  String get subscribed => 'Đã đăng ký';

  @override
  String get subscribe => 'Đăng ký';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Không có người đăng ký',
        'other': '$count người đăng ký',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Chia sẻ';

  @override
  String get shareYoutubeLink => 'Chia sẽ liên kết Youtube';

  @override
  String get shareInvidiousLink => 'Chia sẽ liên kết gây khó chịu';

  @override
  String get redirectInvidiousLink =>
      'Chia sẻ liên kết chuyển hướng gây khó chịu';

  @override
  String get shareLinkWithTimestamp => 'Thêm dấu thời gian';

  @override
  String get ok => 'Đồng ý';

  @override
  String get noChannels => 'Không có kênh';

  @override
  String get noPlaylists => 'Không có danh sách phát';

  @override
  String get channels => 'Các kênh';

  @override
  String get couldntLoadVideo => 'Không tải được video';

  @override
  String get comments => 'Bình luận';

  @override
  String get recommended => 'Đề xuất';

  @override
  String get couldntFetchVideos => 'Không thể tải video, nhấn để thử lại.';

  @override
  String get wizardIntro =>
      'Chọn một máy chủ công cộng hoặc thêm máy chủ của riêng bạn. (Có thể thay đổi sau trong cài đặt)';

  @override
  String get startUsingClipious => 'Bắt đầu sử dụng Clipious';

  @override
  String get videoAddedToPlaylist => 'Đã thêm video vào danh sách';

  @override
  String get videoAddedToQueue => 'Đã thêm video vào hàng đợi';

  @override
  String get errorAddingVideoToPlaylist =>
      'Có lỗi khi thêm video vào danh sách';

  @override
  String get itemlistErrorGeneric => 'Không thể tải dữ liệu';

  @override
  String get itemListErrorInvalidScope =>
      'Bạn không có quyền xem nội dung này, nếu bạn đăng nhập bằng phương thức mã thông báo, hãy thử đăng xuất và đăng nhập lại';

  @override
  String get selectPlaylist => 'Chọn danh sách phát';

  @override
  String get createNewPlaylist => 'Tạo danh sách phát mới';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString trả lời',
      one: '1 trả lời',
      zero: 'Không trả lời',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Tải thêm';

  @override
  String get topSorting => 'Trên cùng';

  @override
  String get newSorting => 'Mới';

  @override
  String get streamIsLive => 'Trực tiếp';

  @override
  String get sponsorSkipped => 'Nhà tài trợ đã bỏ qua';

  @override
  String get selectBrowsingCountry => 'Chọn quốc gia duyệt';

  @override
  String get showOnStart => 'Chọn nội dung sẽ hiển thị khi ứng dụng khởi động';

  @override
  String get settings => 'Cài đặt';

  @override
  String get browsing => 'Duyệt';

  @override
  String get country => 'Quốc gia';

  @override
  String get whenAppStartsShow => 'Khi mở ứng dụng, hiển thị…';

  @override
  String get servers => 'Máy chủ';

  @override
  String get manageServers => 'Quản lý máy chủ';

  @override
  String currentServer(String current) {
    return 'Đang dùng server $current';
  }

  @override
  String get useSponsorBlock => 'Dùng chặn tài trợ';

  @override
  String get sponsorBlockDescription =>
      'Bỏ qua các phân đoạn tài trợ do cộng đồng gửi';

  @override
  String get about => 'Thông tin';

  @override
  String get name => 'Tên';

  @override
  String get package => 'Gói';

  @override
  String get version => 'Phiên bản';

  @override
  String get build => 'Xây';

  @override
  String get addServer => 'Thêm máy chủ';

  @override
  String get useThisServer => 'Dùng máy chủ này';

  @override
  String get logIn => 'Đăng nhập';

  @override
  String get delete => 'Xoá';

  @override
  String get invalidInvidiousServer => 'Máy chủ không hợp lệ';

  @override
  String get yourServers => 'Máy chủ';

  @override
  String get loggedIn => 'Đã đăng nhập';

  @override
  String get notLoggedIn => 'Chưa đăng nhập';

  @override
  String get addServerHelpText =>
      'Sử dụng nút + để thêm máy chủ của riêng bạn hoặc nhấn vào máy chủ công cộng và thêm nó.';

  @override
  String get publicServers => 'Máy chủ công cộng';

  @override
  String get loadingPublicServer => 'Đang tải máy chủ công cộng';

  @override
  String get tapToAddServer => 'Nhấn để thêm máy chủ vào danh sách của bạn';

  @override
  String get publicServersError =>
      'Không thể tìm nạp danh sách máy chủ công cộng. Chạm để thử lại.';

  @override
  String get appearance => 'Vẻ bề ngoài';

  @override
  String get useDynamicTheme => 'Màu sắc tự động';

  @override
  String get useDynamicThemeDescription =>
      'Sử dụng màu Material You (chỉ khả dụng trên Android 12+)';

  @override
  String get useDash => 'Sử dụng DASH';

  @override
  String get useDashDescription =>
      'Phát trực tuyến thích ứng DASH đôi khi có thể gặp sự cố, Youtube có thể điều tiết nó.';

  @override
  String get videoPlayer => 'Trình phát video';

  @override
  String get videoListed => 'Công cộng';

  @override
  String get videoUnlisted => 'Chưa liệt kê';

  @override
  String get videoIsFamilyFriendly => 'Thân thiện với gia đình';

  @override
  String get tapToManage => 'Nhấn để quản lý';

  @override
  String get authentication => 'Xác thực';

  @override
  String get tokenLogin => 'Đăng nhập bằng mã thông báo';

  @override
  String get tokenLoginDescription => 'Cách đăng nhập được đề xuất';

  @override
  String get cookieLogin => 'Đăng nhập bằng cookie';

  @override
  String get cookieLoginDescription =>
      'Sử dụng phương pháp này nếu bạn gặp vấn đề với xác thực mã thông báo';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get username => 'Tên tài khoản';

  @override
  String get password => 'Mật khẩu';

  @override
  String get wrongUsernamePassword => 'Tên người dùng hoặc mật khẩu sai';

  @override
  String get error => 'Lỗi';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats không như mong đợi';

  @override
  String get malformedStatsEndpointDescription =>
      'Điểm cuối thống kê máy chủ không phản hồi tải trọng dự kiến, khóa \"software.name\" phải bằng \"invidious\". \nPhản hồi từ máy chủ:';

  @override
  String get serverIsNotReachable => 'Máy chủ không thể truy cập được';

  @override
  String get videoQueue => 'Hàng đợi video';

  @override
  String get addToQueueList => 'Thêm vào hàng';

  @override
  String get addToPlaylist => 'Thêm vào danh sách phát';

  @override
  String get playNext => 'Phát kế tiếp';

  @override
  String get playNextAddedToQueue => 'Video sẽ phát tiếp theo';

  @override
  String get addRecommendedToQueue => 'Tự động phát được đề xuất tiếp theo';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Chọn loại phân đoạn cần bỏ qua';

  @override
  String get sponsorBlockCategorySponsor => 'Nhà tài trợ';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Quảng cáo trả phí, giới thiệu trả phí và quảng cáo trực tiếp. Không phải để tự quảng cáo hoặc gửi lời cảm ơn miễn phí tới các mục đích/người sáng tạo/trang web/sản phẩm mà họ thích.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo =>
      'Không trả tiền/Tự quảng cáo';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Tương tự như \"nhà tài trợ\" ngoại trừ việc không trả tiền hoặc tự quảng cáo. Điều này bao gồm các phần về hàng hóa, quyên góp hoặc thông tin về những người họ đã cộng tác ';

  @override
  String get sponsorBlockCategoryInteraction => 'Nhắc nhở tương tác (Đăng ký)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Khi có lời nhắc ngắn thích, đăng ký hoặc theo dõi họ ở giữa nội dung. Nếu nó dài hoặc về một cái gì đó cụ thể, thay vào đó nó nên được tự quảng cáo.';

  @override
  String get sponsorBlockCategoryIntro => 'Hoạt ảnh tạm dừng/giới thiệu';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Một khoảng thời gian không có nội dung thực tế. Có thể là tạm dừng, khung tĩnh, hoạt ảnh lặp lại. Điều này không nên được sử dụng cho các chuyển tiếp có chứa thông tin.';

  @override
  String get sponsorBlockCategoryOutro => 'Thẻ kết thúc/Tín dụng';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Tín dụng hoặc khi thẻ cuối YouTube xuất hiện. Không phải để kết luận với thông tin.';

  @override
  String get sponsorBlockCategoryPreview => 'Xem trước/Tóm tắt';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Bộ sưu tập các clip hiển thị nội dung sắp diễn ra trong video này hoặc các video khác trong chuỗi trong đó tất cả thông tin được lặp lại ở phần sau của video.';

  @override
  String get sponsorBlockCategoryFiller => 'Tiếp tuyến phụ/Truyện cười';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Những cảnh tiếp tuyến chỉ được thêm vào để bổ sung hoặc mang tính chất hài hước, không bắt buộc phải hiểu nội dung chính của video. Điều này không được bao gồm các phân đoạn cung cấp bối cảnh hoặc chi tiết cơ bản. Đây là một danh mục rất hung hãn dành cho những lúc bạn không có tâm trạng \"vui vẻ\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'Âm nhạc: Phần phi âm nhạc';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Chỉ sử dụng trong video âm nhạc. Điều này chỉ nên được sử dụng cho các phần của video nhạc chưa thuộc danh mục khác.';

  @override
  String get useProxy => 'Video ủy quyền';

  @override
  String get useProxyDescription =>
      'Bằng cách ủy quyền các luồng video từ máy chủ, bạn có thể bỏ qua các khối khu vực hoặc ISP chặn YouTube';

  @override
  String get pressDownToShowSettings => 'Nhấn xuống để hiển thị cài đặt';

  @override
  String get quality => 'Chất lượng';

  @override
  String get audio => 'Âm thanh';

  @override
  String get subtitles => 'Phụ đề';

  @override
  String get playbackSpeed => 'Tốc độ phát';

  @override
  String get blackBackground => 'Nền đen';

  @override
  String get blackBackgroundDescription =>
      'Đối với chủ đề tối trên màn hình OLED';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get subtitleFontSize => 'Cỡ chữ phụ đề';

  @override
  String get subtitleFontSizeDescription =>
      'Thay đổi kích thước phụ đề nếu nó quá nhỏ hoặc quá lớn trên thiết bị của bạn';

  @override
  String get skipSslVerification => 'Bỏ qua xác minh chứng chỉ SSL';

  @override
  String get skipSslVerificationDescription =>
      'Để sử dụng chứng chỉ SSL tự ký hoặc khi gặp sự cố liên quan đến SSL với máy chủ của bạn.';

  @override
  String get themeBrightness => 'Chủ đề';

  @override
  String get themeLight => 'Sáng';

  @override
  String get themeDark => 'Tối';

  @override
  String get followSystem => 'Theo hệ thống';

  @override
  String get requiresRestart => 'Yêu cầu khởi động lại ứng dụng';

  @override
  String get appLanguage => 'Ngôn ngữ ứng dụng';

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
      zero: 'Không có videos',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Địa chỉ buộc phải bắt đầu với http:// hoặc https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Hiển thị số lượt không thích video ước tính bằng API do returnyoutubedislike.com cung cấp';

  @override
  String get rydCustomInstance => 'Địa chỉ phiên bản RYD tùy chỉnh';

  @override
  String get rydCustomInstanceDescription =>
      'Sử dụng một phiên bản RYD khác, để trống để sử dụng mặc định';

  @override
  String get autoplayVideoOnLoad => 'Tự động phát video khi tải';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Tự động bắt đầu phát video sau khi tải xong';

  @override
  String get searchHistory => 'Lịch sử tìm kiếm';

  @override
  String get searchHistoryDescription => 'Cài đặt lịch sử tìm kiếm';

  @override
  String get enableSearchHistory => 'Bật lịch sử tìm kiếm';

  @override
  String get searchHistoryLimit => 'Giới hạn lịch sử tìm kiếm';

  @override
  String get searchHistoryLimitDescription =>
      'Cài đặt số lượng tìm kiếm gần đây được hiển thị trong đề xuất';

  @override
  String get shorts => 'Ngắn';

  @override
  String get searchUploadDate => 'Ngày tải lên';

  @override
  String get searchUploadDateAny => 'Bất kỳ ngày nào';

  @override
  String get searchUploadDateHour => 'Giờ trước';

  @override
  String get searchUploadDateToday => 'Hôm nay';

  @override
  String get searchUploadDateWeek => 'Tuần này';

  @override
  String get searchUploadDateMonth => 'Tháng này';

  @override
  String get searchUploadDateYear => 'Năm này';

  @override
  String get searchDuration => 'Giai đoạn';

  @override
  String get searchDurationAny => 'Bất kỳ giải đoạn nào';

  @override
  String get searchDurationShort => 'Ngắn (<4 phút)';

  @override
  String get searchDurationLong => 'Dài (>20 phút)';

  @override
  String get searchDurationMedium => 'Trung bình (4-20 phút)';

  @override
  String get searchSortBy => 'Sắp xếp theo';

  @override
  String get searchSortRelevance => 'Mức độ liên quan';

  @override
  String get searchSortRating => 'Xếp hạng';

  @override
  String get searchSortUploadDate => 'Ngày tải lên';

  @override
  String get searchSortViewCount => 'Lượng xem';

  @override
  String get clearSearchHistory => 'Xóa lịch sử tìm kiếm';

  @override
  String get appLogs => 'Nhật ký ứng dụng';

  @override
  String get appLogsDescription =>
      'Nhận nhật ký về những gì đang xảy ra trong ứng dụng, có thể hữu ích để báo cáo sự cố';

  @override
  String get copyToClipBoard => 'Sao chép vào bộ nhớ tạm';

  @override
  String get logsCopied => 'Nhật ký được sao chép vào bộ nhớ tạm';

  @override
  String get rememberSubtitleLanguage => 'Ghi nhớ ngôn ngữ phụ đề';

  @override
  String get videoFilters => 'Bộ lọc video';

  @override
  String nFilters(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString video tìm thấy',
      one: '1 video tìm thấy',
      zero: 'Không có videos',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'Ẩn hoặc Làm xáo trộn video khỏi tất cả nguồn cấp dữ liệu video trong ứng dụng dựa trên các bộ lọc được xác định bên dưới. Điều này cho phép bạn ẩn các nội dung thể thao hoặc ẩn quần short khỏi một kênh nhất định.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Xác định quy tắc để lọc video';

  @override
  String get videoFilterAllChannels => 'Tất cả các kênh';

  @override
  String get addVideoFilter => 'Tạo bộ lọc';

  @override
  String get editVideoFilter => 'Chỉnh sửa bộ lọc';

  @override
  String get videoFilterType => 'Kiểu';

  @override
  String get videoFilterOperation => 'Hoạt động';

  @override
  String get videoFilterValue => 'Giá trị';

  @override
  String get save => 'Lưu';

  @override
  String get videoFilterEditDescription =>
      'Chọn kênh tùy chọn, loại bộ lọc, thao tác và giá trị để lọc video OUT từ danh sách. Ví dụ: loại: tên video, thao tác: chứa, giá trị: test sẽ LOẠI TRỪ tất cả các video có từ test trong tên của chúng.';

  @override
  String get optional => 'không bắt buộc';

  @override
  String get videoFilterHideLabel => 'Ẩn';

  @override
  String get videoFilterFilterLabel => 'làm xáo trộn';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter videos nếu $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered => 'Video được lọc vì (các) lý do sau:';

  @override
  String get videoFilterTapToReveal => 'Nhấn để tiết lộ';

  @override
  String get videoFilterHide => 'Ẩn video đã lọc';

  @override
  String get videoFilterHideDescription =>
      'Theo mặc định, các video đã lọc không bị ẩn nhưng được hiển thị ở dạng khó hiểu kèm theo (các) lý do khiến video đó bị lọc. Cài đặt này xóa video đã lọc khỏi danh sách.';

  @override
  String get videoFilterNoFilters =>
      'Không có bộ lọc video, hãy nhấn vào nút + bên dưới để bắt đầu thêm bộ lọc.';

  @override
  String get videoFilterTypeVideoTitle => 'Tiêu đề video';

  @override
  String get videoFilterTypeChannelName => 'Tên kênh';

  @override
  String get videoFilterTypeVideoLength => 'Thời lượng video (giây)';

  @override
  String get videoFilterOperationContains => 'Chứa';

  @override
  String get videoFilterOperationNotContain => 'Không chứa';

  @override
  String get videoFilterOperationLowerThan => 'Thấp hơn';

  @override
  String get videoFilterOperationHigherThan => 'Cao hơn';

  @override
  String get channel => 'Kênh';

  @override
  String get videoFilterHideAllFromChannel => 'Lọc tất cả video từ kênh';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter tất cả video từ kênh';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Tự động đặt phụ đề cho ngôn ngữ được chọn cuối cùng, nếu có';

  @override
  String get lockFullScreenToLandscape =>
      'Khóa hướng toàn màn hình theo tỷ lệ khung hình video';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Khóa hướng toàn màn hình dựa trên định dạng video, ngang cho video rộng và dọc cho video dọc';

  @override
  String get fillFullscreen => 'Phóng to video cho vừa với màn hình';

  @override
  String get fillFullscreenDescription =>
      'Điều chỉnh video để lấp đầy toàn bộ màn hình ở chế độ ngang';

  @override
  String get rememberPlaybackSpeed => 'Ghi nhớ tốc độ phát lại';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Tự động đặt tốc độ phát lại về tốc độ đã chọn cuối cùng';

  @override
  String get downloads => 'Tải xuống';

  @override
  String get download => 'Tải xuống';

  @override
  String get videoAlreadyDownloaded => 'Video đã được tải xuống';

  @override
  String get noDownloadedVideos =>
      'Không có video đã tải xuống, hãy duyệt, nhấn và giữ video trong danh sách hoặc nhấn vào nút tải xuống trên màn hình video để tải xuống';

  @override
  String get downloadsPlayAll => 'Chơi tất cả';

  @override
  String get videoDownloadStarted => 'Đã bắt đầu tải xuống video';

  @override
  String get videoFailedDownloadRetry =>
      'Tải xuống không thành công, nhấn để thử lại';

  @override
  String get videoDownloadAudioOnly => 'Chỉ có âm thanh';

  @override
  String get manageSubscriptions => 'Quản lý các mục đăng kí';

  @override
  String get noSubscriptions =>
      'Không đăng ký, duyệt video và đăng ký bất kỳ kênh nào bạn thích.';

  @override
  String get youCanSubscribeAgainLater => 'Bạn có thể đăng ký lại kênh này sau';

  @override
  String get unSubscribeQuestion => 'Hủy đăng ký?';

  @override
  String get clearHistoryQuestion => 'Xóa lịch sử ?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Thao tác này sẽ xóa lịch sử xem tài khoản của bạn trên phiên bản Invidious mà bạn sử dụng. Điều này không thể được hoàn tác.';

  @override
  String get noHistory =>
      'Không có lịch sử xem, xem vài video nó sẽ hiện ra ở đây';

  @override
  String get homeLayoutEditor => 'Chỉnh sửa bố cục nhà';

  @override
  String get layoutEditorAddVideoSource => 'Thêm nguồn video';

  @override
  String get layoutEditorExplanation =>
      'Bạn có thể quyết định những gì sẽ hiển thị trên màn hình chính của mình, bạn có thể có tối đa 2 chế độ xem nhỏ với cuộn ngang và một nguồn lớn.';

  @override
  String get home => 'Trang chủ';

  @override
  String get library => 'Thư viện';

  @override
  String get customizeAppLayout => 'Tùy chỉnh các phần ứng dụng';

  @override
  String get customizeAppLayoutExplanation =>
      'Chọn phần bạn muốn xuất hiện trong thanh điều hướng ứng dụng chính. Bấm vào biểu tượng trang chủ để chọn màn hình nào hiển thị khi ứng dụng khởi động. Bạn có thể sắp xếp lại các phần bằng cách kéo chúng xung quanh.';

  @override
  String get navigationBarStyle => 'Kiểu thanh điều hướng';

  @override
  String get navigationBarLabelAlwaysShowing => 'Nhãn luôn hiển thị';

  @override
  String get navigationBarLabelShowOnSelect => 'Nhãn hiển thị trên mục đã chọn';

  @override
  String get navigationBarLabelNeverShow => 'Không bao giờ hiển thị nhãn';

  @override
  String get distractionFreeMode => 'Chế độ không bị phân tâm';

  @override
  String get distractionFreeModeDescription => 'Tắt nhận xét và đề xuất video';

  @override
  String get secondsShortForm => 'giây';

  @override
  String get videoFilterApplyDateToFilter =>
      'Lọc video vào những thời điểm nhất định';

  @override
  String get videoFilterDayOfWeek => 'Chọn ngày để áp dụng bộ lọc';

  @override
  String get videoFilterDayOfWeekDescription =>
      'Bạn có thể chọn lọc các ngày trong tuần và thời gian áp dụng bộ lọc, chẳng hạn như tránh tiết lộ thông tin về các sự kiện thể thao.';

  @override
  String get videoFilterStartTime => 'Thời gian bắt đầu';

  @override
  String get videoFilterEndTime => 'Thời gian kết thúc';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Áp dụng vào $selectedDays';
  }

  @override
  String get from => 'Từ';

  @override
  String get to => 'Đến';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'Từ $from đến $to';
  }

  @override
  String get notifications => 'Thông báo';

  @override
  String get notificationsDescription =>
      'Kích hoạt và xem lại những gì bạn được thông báo';

  @override
  String get enableNotificationDescriptions =>
      'Chạy dịch vụ nền trước để kiểm tra và thông báo cho bạn về những thay đổi bạn đang theo dõi';

  @override
  String get subscriptionNotification => 'Thông báo đăng ký';

  @override
  String get subscriptionNotificationDescription =>
      'Nhận thông báo về video mới từ nguồn cấp dữ liệu đăng ký của bạn nếu bạn đăng nhập vào phiên bản hiện tại của mình';

  @override
  String get subscriptionNotificationTitle => 'Video mới từ đăng ký của bạn';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString videos mới',
      one: '1 video mới',
      zero: ' 0 video mới',
    );
    return 'Có $_temp0 trong kênh đăng ký của bạn';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Cần phải tắt tính năng tối ưu hóa pin';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'Để gửi thông báo, Clipious cần chạy dịch vụ nền. Để ứng dụng chạy trơn tru, Clipious cần được cung cấp mức sử dụng pin không hạn chế, nhấn ok sẽ mở cài đặt tối ưu hóa pin.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Đã tắt thông báo';

  @override
  String get askToEnableBackgroundServiceContent =>
      'Để nhận thông báo, bạn cần bật thông báo Clipious, nhấn OK để bật.';

  @override
  String get otherNotifications =>
      'Các nguồn thông báo khác (biểu tượng chuông)';

  @override
  String get deleteChannelNotificationTitle => 'Xóa thông báo kênh?';

  @override
  String get deleteChannelNotificationContent =>
      'Bạn sẽ không nhận được thông báo nào nữa từ kênh này.';

  @override
  String get deletePlaylistNotificationTitle => 'Xóa thông báo danh sách phát?';

  @override
  String get deletePlaylistNotificationContent =>
      'Bạn sẽ không nhận được thông báo nào nữa từ danh sách phát này.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Video mới từ $channel';
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
      other: '$countString videos mới',
      one: '1 video mới',
      zero: ' 0 video mới',
    );
    return 'Có $_temp0 từ $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'Video mới trong danh sách phát $playlist';
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
      other: '$countString videos mới',
      one: '1 video mới',
      zero: ' 0 video mới',
    );
    return 'Có $_temp0 trong danh sách phát $playlist';
  }

  @override
  String get foregroundServiceNotificationTitle => 'Video giám sát';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'hàng giờ',
        '24': 'mỗi ngày',
        'other': 'mỗi $hours hours',
      },
    );
    return 'Sẽ kiểm tra video mới $_temp0';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'Đang kiểm tra đăng ký...';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'Đang kiểm tra danh sách phát...';

  @override
  String get foregroundServiceUpdatingChannels => 'Đang kiểm tra kênh...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Tần suất kiểm tra video mới';

  @override
  String get notificationFrequencySettingsDescription =>
      'Tần suất ứng dụng sẽ kiểm tra video mới';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '1ngày',
        'other': '${hours}h',
      },
    );
    return '$_temp0';
  }

  @override
  String get subtitlesBackground => 'Nền phụ đề';

  @override
  String get subtitlesBackgroundDescription =>
      'Thêm nền đen vào phụ đề để dễ đọc hơn';

  @override
  String get history => 'Lịch sử';

  @override
  String get deArrowSettingDescription =>
      'Thay thế tiêu đề và hình thu nhỏ của mồi nhấp chuột';

  @override
  String get deArrowReplaceThumbnails => 'Thay thế hình thu nhỏ';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Thay thế hình thu nhỏ của video ngoài tiêu đề';

  @override
  String get deArrowWarning =>
      'Bật DeArrow có thể giảm đáng kể tốc độ duyệt web của ứng dụng vì cần thêm yêu cầu http cho mỗi video';

  @override
  String get copySettingsAsJson =>
      'Sao chép cài đặt dưới dạng JSON vào clipboard';

  @override
  String get copySettingsAsJsonDescription =>
      'Sao chép cài đặt dưới dạng JSON để giúp gỡ lỗi nếu bạn gặp sự cố với ứng dụng và quyết định nêu vấn đề';

  @override
  String get seeking => 'Đang tìm kiếm';

  @override
  String get skipStep => 'Bỏ qua bước tiến/lùi';

  @override
  String get skipStepDescription => 'Số giây để bỏ qua hành động tiến/lùi';

  @override
  String get exponentialSkip => 'Bỏ qua theo cấp số nhân về phía trước/lùi';

  @override
  String get exponentialSkipDescription =>
      'Bạn càng bỏ qua về phía trước, bước càng lớn.';

  @override
  String get fullscreenOnLandscape => 'Toàn màn hình ở chế độ ngang';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Chuyển sang chế độ toàn màn hình khi xoay thiết bị sang chế độ ngang';

  @override
  String get enabled => 'Đã bật';

  @override
  String get submitFeedback => 'Gửi phản hồi';

  @override
  String get submitFeedbackDescription =>
      'Tìm thấy một lỗi hoặc có một gợi ý? Sử dụng công cụ này để chụp ảnh màn hình ứng dụng, chú thích và gửi phản hồi';

  @override
  String get feedbackDisclaimer =>
      'Để gửi phản hồi, bạn sẽ cần có tài khoản GitHub và ảnh chụp màn hình của bạn sẽ được gửi ẩn danh tới Imgur.';

  @override
  String get feedbackScreenshotError =>
      'Lỗi khi tải ảnh chụp màn hình lên Imgur';

  @override
  String get channelSortByNewest => 'Mới nhất';

  @override
  String get channelSortByOldest => 'Cũ nhất';

  @override
  String get channelSortByPopular => 'Phổ biến';

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
