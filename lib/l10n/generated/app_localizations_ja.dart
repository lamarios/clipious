// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get subscriptions => '登録チャンネル';

  @override
  String get playlists => '再生リスト';

  @override
  String get popular => '人気';

  @override
  String get trending => '急上昇';

  @override
  String get noVideoInPlayList => '再生リストに動画がありません';

  @override
  String get removeFromPlayList => '再生リストから削除';

  @override
  String get deletePlayListQ => '再生リストを削除しますか？';

  @override
  String get irreversibleAction => 'この操作は元に戻せません';

  @override
  String get addPlayList => '再生リストを追加';

  @override
  String get playListName => '再生リスト名';

  @override
  String get playlistVisibility => '公開範囲';

  @override
  String get publicPlaylist => '公開';

  @override
  String get privatePlaylist => '非公開';

  @override
  String get cancel => 'キャンセル';

  @override
  String get add => '追加';

  @override
  String get unlistedPlaylist => '限定公開';

  @override
  String get info => '情報';

  @override
  String get videos => '動画';

  @override
  String get streams => '配信';

  @override
  String get latestVideos => '最新の動画';

  @override
  String get subscribed => '登録済み';

  @override
  String get subscribe => 'チャンネル登録';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': '登録者なし',
        'other': '登録者 $count 人',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => '共有';

  @override
  String get shareYoutubeLink => 'YouTube リンクを共有';

  @override
  String get shareInvidiousLink => 'Invidious リンクを共有';

  @override
  String get redirectInvidiousLink => 'Invidious 転送リンクを共有';

  @override
  String get shareLinkWithTimestamp => '再生位置を指定';

  @override
  String get ok => 'OK';

  @override
  String get noChannels => 'チャンネルなし';

  @override
  String get noPlaylists => '再生リストなし';

  @override
  String get channels => 'チャンネル';

  @override
  String get couldntLoadVideo => '動画を読み込めませんでした';

  @override
  String get comments => 'コメント';

  @override
  String get recommended => 'おすすめ';

  @override
  String get couldntFetchVideos => '動画を取得できません。タップして再試行。';

  @override
  String get wizardIntro => '公開サーバーから選ぶか、独自のものを追加します。(設定からも変更可能)';

  @override
  String get startUsingClipious => 'Clipious の使用を開始';

  @override
  String get videoAddedToPlaylist => '動画を再生リストに追加しました';

  @override
  String get videoAddedToQueue => '動画をキューに追加しました';

  @override
  String get errorAddingVideoToPlaylist => '再生リストに動画追加中にエラー';

  @override
  String get itemlistErrorGeneric => 'データを取得できませんでした';

  @override
  String get itemListErrorInvalidScope =>
      '表示する権限なし。トークンでログイン中なら、ログアウトし再度ログインしてみてください';

  @override
  String get selectPlaylist => '再生リストを選択';

  @override
  String get createNewPlaylist => '新しい再生リスト';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 件の返信',
      one: '1 件の返信',
      zero: '返信なし',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'さらに読み込む';

  @override
  String get topSorting => '高評価';

  @override
  String get newSorting => '新しい順';

  @override
  String get streamIsLive => 'ライブ';

  @override
  String get sponsorSkipped => '不要シーンを飛ばしました';

  @override
  String get selectBrowsingCountry => '閲覧したい国を選択';

  @override
  String get showOnStart => 'アプリの起動時に表示する内容を選択';

  @override
  String get settings => '設定';

  @override
  String get browsing => '閲覧';

  @override
  String get country => '国';

  @override
  String get whenAppStartsShow => 'アプリ起動時の表示…';

  @override
  String get servers => 'サーバー';

  @override
  String get manageServers => 'サーバーの管理';

  @override
  String currentServer(String current) {
    return '使用中 $current';
  }

  @override
  String get useSponsorBlock => 'SponsorBlock を使用';

  @override
  String get sponsorBlockDescription => 'みんなが登録した広告シーンを飛ばします';

  @override
  String get about => '情報';

  @override
  String get name => '名前';

  @override
  String get package => 'パッケージ';

  @override
  String get version => 'バージョン';

  @override
  String get build => 'ビルド';

  @override
  String get addServer => 'サーバーを追加';

  @override
  String get useThisServer => 'このサーバーを使用';

  @override
  String get logIn => 'ログイン';

  @override
  String get delete => '削除';

  @override
  String get invalidInvidiousServer => '無効な Invidious サーバー';

  @override
  String get yourServers => '使用するサーバー';

  @override
  String get loggedIn => 'ログイン中';

  @override
  String get notLoggedIn => 'ログインしていません';

  @override
  String get addServerHelpText => '公開サーバーから選ぶか、+ ボタンからサーバーを追加します。';

  @override
  String get publicServers => '公開サーバー';

  @override
  String get loadingPublicServer => '公開サーバーを読み込み中';

  @override
  String get tapToAddServer => 'タップでサーバーを一覧に追加';

  @override
  String get publicServersError => '公開サーバーの一覧を取得できませんでした。タップで再試行。';

  @override
  String get appearance => '外観';

  @override
  String get useDynamicTheme => 'ダイナミックカラー';

  @override
  String get useDynamicThemeDescription =>
      'Material You の配色を使用 (Android 12 以上で利用可能)';

  @override
  String get useDash => 'DASHを使用';

  @override
  String get useDashDescription =>
      'DASHの適応的なストリーミングはたまに問題を起こすので、Youtubeが帯域制限を行っていることがあります。';

  @override
  String get videoPlayer => '動画プレイヤー';

  @override
  String get videoListed => '公開';

  @override
  String get videoUnlisted => '限定公開';

  @override
  String get videoIsFamilyFriendly => '家族向け';

  @override
  String get tapToManage => 'タップで設定';

  @override
  String get authentication => '認証';

  @override
  String get tokenLogin => 'トークンでログイン';

  @override
  String get tokenLoginDescription => '推奨するログイン方法です';

  @override
  String get cookieLogin => 'クッキーでログイン';

  @override
  String get cookieLoginDescription => 'トークン認証に問題がある際にお試しください';

  @override
  String get logout => 'ログアウト';

  @override
  String get username => 'ユーザー名';

  @override
  String get password => 'パスワード';

  @override
  String get wrongUsernamePassword => 'ユーザー名かパスワードが間違っています';

  @override
  String get error => 'エラー';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats は予想通りではありません';

  @override
  String get malformedStatsEndpointDescription =>
      'サーバーのデータの終点は期待されたペイロードで応答しませんでした。キー software.name は invidious であるべきです。\nサーバーからの応答:';

  @override
  String get serverIsNotReachable => 'サーバーに到達できません';

  @override
  String get videoQueue => '動画再生待ち';

  @override
  String get addToQueueList => '再生待ちに追加';

  @override
  String get addToPlaylist => '再生リストに追加';

  @override
  String get playNext => '次に再生';

  @override
  String get playNextAddedToQueue => '動画は次に再生されます';

  @override
  String get addRecommendedToQueue => '次のおすすめ自動再生';

  @override
  String get sponsorBlockSettingsQuickDescription => '飛ばしたいシーンの種類を選択';

  @override
  String get sponsorBlockCategorySponsor => '協賛';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      '報酬のある販売促進、紹介、直接広告です。自己宣伝、また好きな動機/製作者/サイト/製品への無償の賞賛ではありません。';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => '無報酬/自己宣伝';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      '無報酬または自己宣伝ということを除き「協賛」に似ています。商品、寄付、協力者に関する情報を含みます。 ';

  @override
  String get sponsorBlockCategoryInteraction => '操作の依頼 (いいね・登録など)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'コンテンツの途中で「いいね」「登録」「フォロー」の簡単な依頼がある。長かったり、何か具体的な事に関するものであれば、代わりに自己宣伝に分類されます。';

  @override
  String get sponsorBlockCategoryIntro => '合間 / 導入アニメ';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      '中身のあるコンテンツがない合間のシーン。一時停止、静止画、アニメの繰り返しなど。情報を含む遷移シーンではありません。';

  @override
  String get sponsorBlockCategoryOutro => '終了画面/クレジット';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'クレジットやYouTubeの終了画面です。情報を含む結論のシーンではありません。';

  @override
  String get sponsorBlockCategoryPreview => '予告/あらすじ';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'この動画や他の一連の動画で起こるシーンを集めたもので、すべての情報が動画の続きで繰り返されます。';

  @override
  String get sponsorBlockCategoryFiller => '無関係の談話/冗談';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      '動画の主な内容を理解するのに不要な、つなぎやユーモアとして追加された脱線したシーンです。文脈や背景の詳細を提供するシーンは含まれません。または楽しめないシーンの非常に強引な分類です。';

  @override
  String get sponsorBlockCategoryMusicOffTopic => '音楽: 非音楽シーン';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'ミュージックビデオが対象です。他のカテゴリーに分類できないミュージックビデオのシーンにのみ使用されます。';

  @override
  String get useProxy => '動画視聴にプロキシを経由';

  @override
  String get useProxyDescription =>
      'プロキシを介してサーバーから動画ストリームを受信。YouTubeによる地域やISPの制限を回避します';

  @override
  String get pressDownToShowSettings => '下を押して、設定を表示';

  @override
  String get quality => '画質';

  @override
  String get audio => '音声';

  @override
  String get subtitles => '字幕';

  @override
  String get playbackSpeed => '再生速度';

  @override
  String get blackBackground => '真っ黒な背景';

  @override
  String get blackBackgroundDescription => 'ダークテーマをOLED ディスプレイで使うのに最適';

  @override
  String get search => '検索';

  @override
  String get subtitleFontSize => '字幕の文字の大きさ';

  @override
  String get subtitleFontSizeDescription => 'この端末上で字幕の文字が大きい・小さい場合に変更できます';

  @override
  String get skipSslVerification => 'SSL認証を省略';

  @override
  String get skipSslVerificationDescription =>
      '自己署名のSSL証明書を使うか、使うサーバーのSSLに問題があれば。';

  @override
  String get themeBrightness => 'テーマ';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get followSystem => 'システムの設定に従う';

  @override
  String get requiresRestart => 'アプリの再起動が必要';

  @override
  String get appLanguage => 'アプリの表示言語';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 件の動画',
      one: '1 件の動画',
      zero: '動画なし',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation => 'URLは http:// か https:// から始めてください';

  @override
  String get returnYoutubeDislikeDescription =>
      'API を介し動画の低評価の数を推測: API 提供元 returnyoutubedislike.com';

  @override
  String get rydCustomInstance => '独自RYDインスタンスのURL';

  @override
  String get rydCustomInstanceDescription => '別のRYDインスタンスを使用。空なら初期設定を使用';

  @override
  String get autoplayVideoOnLoad => '読み込んだ動画を自動再生';

  @override
  String get autoplayVideoOnLoadDescription => '動画の読み込み後に自動的に再生を開始します';

  @override
  String get searchHistory => '検索履歴';

  @override
  String get searchHistoryDescription => '検索履歴の設定';

  @override
  String get enableSearchHistory => '検索履歴を有効化';

  @override
  String get searchHistoryLimit => '検索履歴の上限';

  @override
  String get searchHistoryLimitDescription => '候補に表示する過去の検索語句の数';

  @override
  String get shorts => 'ショート';

  @override
  String get searchUploadDate => 'アップロード日';

  @override
  String get searchUploadDateAny => 'すべて';

  @override
  String get searchUploadDateHour => '1時間以内';

  @override
  String get searchUploadDateToday => '今日';

  @override
  String get searchUploadDateWeek => '今週';

  @override
  String get searchUploadDateMonth => '今月';

  @override
  String get searchUploadDateYear => '今年';

  @override
  String get searchDuration => '時間';

  @override
  String get searchDurationAny => 'すべて';

  @override
  String get searchDurationShort => '短 (4分未満)';

  @override
  String get searchDurationLong => '長 (20分以上)';

  @override
  String get searchDurationMedium => '中 (4～20分)';

  @override
  String get searchSortBy => '並び替え';

  @override
  String get searchSortRelevance => '関連度';

  @override
  String get searchSortRating => '評価';

  @override
  String get searchSortUploadDate => 'アップロード日';

  @override
  String get searchSortViewCount => '視聴回数';

  @override
  String get clearSearchHistory => '検索履歴を消去';

  @override
  String get appLogs => 'アプリのログ';

  @override
  String get appLogsDescription => 'アプリに起きたことのログを取得。問題の報告に役立ちます';

  @override
  String get copyToClipBoard => 'クリップボードにコピー';

  @override
  String get logsCopied => 'ログをクリップボードにコピー';

  @override
  String get rememberSubtitleLanguage => '字幕の言語を記憶';

  @override
  String get videoFilters => '動画フィルター';

  @override
  String nFilters(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString個のフィルター',
      one: '1個のフィルター',
      zero: '動画なし',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'フィルタを定義し、アプリ内のすべての動画一覧から、特定の動画を非表示または不明確にします。例えば、スポーツのネタバレ、特定のチャンネルのショート動画を隠します。';

  @override
  String get videoFiltersSettingTileDescriptions => '動画のフィルタリング規則を定義';

  @override
  String get videoFilterAllChannels => 'すべてのチャンネル';

  @override
  String get addVideoFilter => 'フィルターを作成';

  @override
  String get editVideoFilter => 'フィルターの編集';

  @override
  String get videoFilterType => '種類';

  @override
  String get videoFilterOperation => '比較';

  @override
  String get videoFilterValue => '値';

  @override
  String get save => '保存';

  @override
  String get videoFilterEditDescription =>
      '一覧から動画をフィルタリングするために、任意でチャンネルと、フィルターの種類、比較、値を指定します。例「種類: 動画の題名、比較: 含む、値: テスト」は、題名に「テスト」を含むすべての動画を除外します。';

  @override
  String get optional => '任意';

  @override
  String get videoFilterHideLabel => '非表示';

  @override
  String get videoFilterFilterLabel => '不明確に';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$type \'$value\' $operation動画を$hideOrFilter。';
  }

  @override
  String get videoFiltered => '次の理由で動画をフィルター済み:';

  @override
  String get videoFilterTapToReveal => 'タップで表示';

  @override
  String get videoFilterHide => 'フィルタリングされた動画を非表示';

  @override
  String get videoFilterHideDescription =>
      '動画を一覧に表示しません。標準では、フィルターされた動画は非表示ではなく、理由と共に不明確に表示されます。';

  @override
  String get videoFilterNoFilters => '動画フィルターなし。+ をタップし、フィルター追加。';

  @override
  String get videoFilterTypeVideoTitle => '動画の題名';

  @override
  String get videoFilterTypeChannelName => 'チャンネル名';

  @override
  String get videoFilterTypeVideoLength => '動画の長さ (秒)';

  @override
  String get videoFilterOperationContains => '含む';

  @override
  String get videoFilterOperationNotContain => '含まない';

  @override
  String get videoFilterOperationLowerThan => 'より少ない';

  @override
  String get videoFilterOperationHigherThan => 'より多い';

  @override
  String get channel => 'チャンネル';

  @override
  String get videoFilterHideAllFromChannel => 'チャンネルのすべての動画をフィルタリング';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter このチャンネルの全動画';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      '字幕が利用可能なら、最後に選択した言語を自動で設定します';

  @override
  String get lockFullScreenToLandscape => 'アスペクト比に従い全画面の向きをロック';

  @override
  String get lockFullScreenToLandscapeDescription =>
      '幅広映像は横向き、自撮り映像は縦向きと、動画形式よって全画面の向きロック';

  @override
  String get fillFullscreen => '画面に合わせ映像を最大化';

  @override
  String get fillFullscreenDescription => '横向き表示では画面全体に映像が広がるよう調整';

  @override
  String get rememberPlaybackSpeed => '再生速度を記憶';

  @override
  String get rememberPlaybackSpeedDescription => '最後に選択した再生速度を自動で設定';

  @override
  String get downloads => 'ダウンロード';

  @override
  String get download => 'ダウンロード';

  @override
  String get videoAlreadyDownloaded => 'ダウンロード済みの動画です';

  @override
  String get noDownloadedVideos =>
      'ダウンロードした動画なし。ダウンロードするには、一覧で動画を長押し、または動画の画面にあるダウンロードを押します';

  @override
  String get downloadsPlayAll => 'すべて再生';

  @override
  String get videoDownloadStarted => '動画のダウンロード開始';

  @override
  String get videoFailedDownloadRetry => 'ダウンロード失敗。タップで再試行';

  @override
  String get videoDownloadAudioOnly => '音声のみ';

  @override
  String get manageSubscriptions => '登録チャンネルの管理';

  @override
  String get noSubscriptions => '登録チャンネルなし。動画を探し、好きなチャンネルを登録できます。';

  @override
  String get youCanSubscribeAgainLater => 'いつでも再びチャンネル登録できます';

  @override
  String get unSubscribeQuestion => '登録を解除しますか？';

  @override
  String get clearHistoryQuestion => '履歴を消去しますか？';

  @override
  String get clearHistoryQuestionExplanation =>
      '使用している Invidious のインスタンス上のアカウントの視聴履歴が消去されます。元に戻せません。';

  @override
  String get noHistory => '視聴履歴なし。動画を視聴すると表示されます';

  @override
  String get homeLayoutEditor => 'ホームの配置を編集';

  @override
  String get layoutEditorAddVideoSource => '動画の表示を追加';

  @override
  String get layoutEditorExplanation =>
      'ホームの表示を変更。横スクロールの小さな表示部分が2つまで、大きな表示部分が1つです。';

  @override
  String get home => 'ホーム';

  @override
  String get library => 'ライブラリ';

  @override
  String get customizeAppLayout => '表示ボタンを変更';

  @override
  String get customizeAppLayoutExplanation =>
      'アプリのメインのナビゲーションバーに表示したいボタンを選択します。家型のアイコンをクリックすると、アプリ起動時に表示される画面を選択できます。ドラッグで並び替えることもできます。';

  @override
  String get navigationBarStyle => 'ナビゲーションバーのスタイル';

  @override
  String get navigationBarLabelAlwaysShowing => '常にラベルの文字を表示';

  @override
  String get navigationBarLabelShowOnSelect => '選択時にラベルの文字を表示';

  @override
  String get navigationBarLabelNeverShow => 'ラベルの文字を表示しない';

  @override
  String get distractionFreeMode => '集中モード';

  @override
  String get distractionFreeModeDescription => '動画のコメントとおすすめを非表示にします';

  @override
  String get secondsShortForm => '秒';

  @override
  String get videoFilterApplyDateToFilter => '指定日時に動画をフィルター';

  @override
  String get videoFilterDayOfWeek => '絞り込む時間帯を選択';

  @override
  String get videoFilterDayOfWeekDescription =>
      '絞り込む曜日と時間を選択できます。スポーツの結果のネタバレを避けたりできます。';

  @override
  String get videoFilterStartTime => '開始時間';

  @override
  String get videoFilterEndTime => '終了時間';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return '$selectedDaysに適用';
  }

  @override
  String get from => '開始';

  @override
  String get to => '終了';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return '開始 $from 終了 $to';
  }

  @override
  String get notifications => '通知';

  @override
  String get notificationsDescription => '通知したいものを設定できます';

  @override
  String get enableNotificationDescriptions => 'フォアグラウンドサービスを実行し監視対象の更新を通知します';

  @override
  String get subscriptionNotification => '登録チャンネルの通知';

  @override
  String get subscriptionNotificationDescription =>
      '現在のインスタンスにログインしていれば、登録チャンネルのフィードからの新着動画を通知';

  @override
  String get subscriptionNotificationTitle => '登録チャンネルの新着動画';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString本の新着動画',
      zero: '新着なし',
    );
    return '登録チャンネルに$_temp0';
  }

  @override
  String get askForDisableBatteryOptimizationTitle => '電池の最適化を無効にしてください';

  @override
  String get askForDisableBatteryOptimizationContent =>
      '通知を送信するには、Clipiousがバックグラウンドサービスを実行する必要があります。円滑な動作のためには、電池の使用を制限しないでください。OKで電池の最適化の設定を開きます。';

  @override
  String get askToEnableBackgroundServiceTitle => '通知は無効になっています';

  @override
  String get askToEnableBackgroundServiceContent =>
      '通知を利用するにはClipious の通知を有効化する必要があります。OKで有効化にします。';

  @override
  String get otherNotifications => 'ほかの通知対象 (鐘のアイコン)';

  @override
  String get deleteChannelNotificationTitle => 'チャンネルの通知を削除しますか ?';

  @override
  String get deleteChannelNotificationContent => 'このチャンネルからの通知を停止します。';

  @override
  String get deletePlaylistNotificationTitle => '再生リストの通知を削除しますか ?';

  @override
  String get deletePlaylistNotificationContent => 'この再生リストからの通知を停止します。';

  @override
  String channelNotificationTitle(String channel) {
    return '$channel の新着動画';
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
      other: '$countString本の新着動画',
      zero: '新着なし',
    );
    return '$channel に$_temp0';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return '再生リスト $playlist に新着動画';
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
      other: '$countString本の新着動画',
      zero: '新着なし',
    );
    return '再生リスト $playlist に$_temp0';
  }

  @override
  String get foregroundServiceNotificationTitle => '動画の監視';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': '1時間',
        '24': '1日',
        'other': '$hours時間',
      },
    );
    return '新着動画を$_temp0ごとに確認中';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions => '登録チャンネルを確認中...';

  @override
  String get foregroundServiceUpdatingPlaylist => '再生リストを確認中...';

  @override
  String get foregroundServiceUpdatingChannels => 'チャンネルを確認中...';

  @override
  String get notificationFrequencySettingsTitle => '新着動画の確認頻度';

  @override
  String get notificationFrequencySettingsDescription => 'アプリが新しい動画を確認する頻度';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '1日',
        'other': '$hours時間',
      },
    );
    return '$_temp0';
  }

  @override
  String get subtitlesBackground => '字幕の背景';

  @override
  String get subtitlesBackgroundDescription => '字幕に黒の背景を追加して読みやすくします';

  @override
  String get history => '履歴';

  @override
  String get deArrowSettingDescription => '誇張された題名とサムネイルを置換します';

  @override
  String get deArrowReplaceThumbnails => 'サムネイルを置換';

  @override
  String get deArrowReplaceThumbnailsDescription => '動画の題名に加えサムネイルも置換する';

  @override
  String get deArrowWarning =>
      'DeArrow が有効であれば、個々の動画に追加の HTTP リクエストを行うためアプリの閲覧速度は大きく低下します';

  @override
  String get copySettingsAsJson => '設定を JSON としてコピー';

  @override
  String get copySettingsAsJsonDescription =>
      '発生したアプリの問題を報告する際に、バグ改善を助ける設定情報を JSON としてコピー';

  @override
  String get seeking => 'シーク';

  @override
  String get skipStep => '前/後に移動する単位';

  @override
  String get skipStepDescription => '前へ進む/後ろに戻る秒数';

  @override
  String get exponentialSkip => '飛躍的な前後移動';

  @override
  String get exponentialSkipDescription => '移動幅が大きいほど移動する単位が増加します。';

  @override
  String get fullscreenOnLandscape => '横向きで全画面';

  @override
  String get fullscreenOnLandscapeDescription => '端末を横向きに回転すると全画面にします';

  @override
  String get enabled => '有効';

  @override
  String get submitFeedback => '意見を送る';

  @override
  String get submitFeedbackDescription =>
      'バグ報告や提案ですか？このツールでアプリのスクリーンショットを撮り説明し送信';

  @override
  String get feedbackDisclaimer =>
      '意見を送るにはGitHubのアカウントが必要です。スクリーンショットは匿名でImgurに送信されます。';

  @override
  String get feedbackScreenshotError => 'スクリーンショットをImgurにアップロード中にエラー';

  @override
  String get channelSortByNewest => '新しい順';

  @override
  String get channelSortByOldest => '古い順';

  @override
  String get channelSortByPopular => '人気';

  @override
  String get invidiousAccount => 'Invidious アカウント';

  @override
  String get onDeviceSubscriptions => '端末上';

  @override
  String get both => '両方';

  @override
  String get refresh => '更新';

  @override
  String get addBasicAuth => 'ベーシック認証を追加';

  @override
  String get addBasicAuthExplanation =>
      'サーバーにベーシック認証が必要なら、以下に設定を追加します。これらはInvidiousアカウントのものではありません';

  @override
  String get addHeader => 'ヘッダーを追加';

  @override
  String get advancedConfiguration => '詳細設定';

  @override
  String get customHeaders => 'ヘッダーの指定';

  @override
  String get customHeadersExplanation => 'invidious サーバーに送信するヘッダーを指定';

  @override
  String get value => '値';

  @override
  String get testAndAddServer => 'テストとサーバの追加';

  @override
  String get alsoTestServerConfig => 'サムネイルが適切に表示されるかなど、サーバーの設定をテスト';

  @override
  String get serverAlreadyExists => 'このサーバーは設定に既にあります';

  @override
  String get wrongThumbnailConfiguration =>
      'サーバーには到達していますが、設定が正しくないため、動画とチャンネルのサムネイルが正しく表示されません。問題がなければサーバーテストを無効にし、そうでなければサーバーを修正してください';

  @override
  String get openWikiLink => 'ヘルプ用Wikiを開く';

  @override
  String get serverUnreachable => 'サーバーに到達できない、もしくは無効な Invidious サーバーです';

  @override
  String get copyToDownloadFolder => 'ダウンロードフォルダへコピー';

  @override
  String get fileCopiedToDownloadFolder => 'ダウンロードフォルダにコピーしました';

  @override
  String get videoDeleted => '動画を削除しました';

  @override
  String get sleepTimer => 'スリープタイマー';

  @override
  String get stopTheVideo => '動画を閉じる';

  @override
  String get stopTheVideoExplanation => '有効なら、動画を閉じ、無効なら、動画を単に一時停止します';

  @override
  String get setTimer => 'タイマーを設定';

  @override
  String get cancelSleepTimer => 'スリープタイマーをキャンセル';

  @override
  String premieresIn(Object formattedDuration) {
    return '$formattedDuration 後に公開';
  }

  @override
  String get screenControls => '画面から制御';

  @override
  String get screenControlsExplanation =>
      '全画面で動画を視聴時に、左や右で縦方向にドラッグすると、明るさや音量を調整します';

  @override
  String get retry => '再試行';

  @override
  String get forceTvUi => '強制的にテレビ向けの表示';

  @override
  String get forceTvUiExplanation =>
      '表示を強制的にテレビ用にすることで、リーンバックシステム設定がない一部の端末でも役立ちます。アプリの再起動が必要';

  @override
  String get noPublicServers => '利用可能な公開サーバーなし';

  @override
  String get tapToSeeHow => 'タップで、自分でホストする方法を表示';

  @override
  String get referToInvidiousWebsiteForHostingInstructions =>
      'Invidiousサーバーをホストする方法は、Invidiousのサイトをご覧ください';
}
