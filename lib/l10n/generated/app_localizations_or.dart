// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get subscriptions => 'ସଦସ୍ୟତା';

  @override
  String get playlists => 'ପ୍ଲେଲିଷ୍ଟଗୁଡିକ';

  @override
  String get popular => 'ଲୋକପ୍ରିୟ';

  @override
  String get trending => 'ଟ୍ରେଣ୍ଡିଂ';

  @override
  String get noVideoInPlayList => 'ପ୍ଲେ ଲିଷ୍ଟରେ କୌଣସି ଭିଡିଓ ନାହିଁ';

  @override
  String get removeFromPlayList => 'ପ୍ଲେ ଲିଷ୍ଟରୁ ହଟାନ୍ତୁ';

  @override
  String get deletePlayListQ => 'ପ୍ଲେଲିଷ୍ଟ ବିଲୋପ କରିବେ କି?';

  @override
  String get irreversibleAction => 'ଏହି କ୍ରିୟା ପ୍ରତ୍ୟାବର୍ତ୍ତନ ଅଯୋଗ୍ୟ ଅଟେ';

  @override
  String get addPlayList => 'ପ୍ଲେଲିଷ୍ଟ ଯୋଡନ୍ତୁ';

  @override
  String get playListName => 'ପ୍ଲେଲିଷ୍ଟ ନାମ';

  @override
  String get playlistVisibility => 'ଦୃଶ୍ୟମାନତା';

  @override
  String get publicPlaylist => 'ଜନସାଧାରଣ';

  @override
  String get privatePlaylist => 'ବ୍ୟକ୍ତିଗତ';

  @override
  String get cancel => 'ବାତିଲ୍ କରନ୍ତୁ';

  @override
  String get add => 'ଯୋଡନ୍ତୁ';

  @override
  String get unlistedPlaylist => 'ତାଲିକାଭୁକ୍ତ ନୁହେଁ';

  @override
  String get info => 'ସୂଚନା';

  @override
  String get videos => 'ଭିଡିଓ ଗୁଡିକ';

  @override
  String get streams => 'ସ୍ରୋତ';

  @override
  String get latestVideos => 'ସର୍ବଶେଷ ଭିଡିଓଗୁଡିକ';

  @override
  String get subscribed => 'ସଦସ୍ୟତା ଅଛି';

  @override
  String get subscribe => 'ସବସ୍କ୍ରାଇବ କରନ୍ତୁ';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'କୌଣସି ଗ୍ରାହକ',
        'other': '$count ଗ୍ରାହକ',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Share';

  @override
  String get shareYoutubeLink => 'ୟୁଟ୍ୟୁବ୍ ଲିଙ୍କ୍ ଅଂଶୀଦାର କରନ୍ତୁ';

  @override
  String get shareInvidiousLink => 'ଅଜ୍ଞାତ ଲିଙ୍କ୍ ଅଂଶୀଦାର କରନ୍ତୁ';

  @override
  String get redirectInvidiousLink => 'ଅଶ୍ଳୀଳ ପୁନପ୍ରେରଣ ସଂଯୋଗକୁ ସହଭାଗ କରନ୍ତୁ';

  @override
  String get shareLinkWithTimestamp => 'ଟାଇମଷ୍ଟ୍ୟାମ୍ପ ଯୋଗ କରନ୍ତୁ';

  @override
  String get ok => 'ଠିକ୍ ଅଛି';

  @override
  String get noChannels => 'କୌଣସି ଚ୍ୟାନେଲ ନାହିଁ';

  @override
  String get noPlaylists => 'କୌଣସି ପ୍ଲେଲିଷ୍ଟ ନାହିଁ';

  @override
  String get channels => 'ଚ୍ୟାନେଲ ଗୁଡିକ';

  @override
  String get couldntLoadVideo => 'ଭିଡିଓ ଲୋଡ୍ ହୋଇପାରିଲା ନାହିଁ';

  @override
  String get comments => 'ମନ୍ତବ୍ୟ ଗୁଡିକ';

  @override
  String get recommended => 'ପରାମର୍ଶିତ';

  @override
  String get couldntFetchVideos =>
      'ଭିଡିଓ ଆଣିପାରିଲା ନାହିଁ । ପୁନର୍ବାର ଚେଷ୍ଟା କରିବାକୁ ଟ୍ୟାପ୍ କରନ୍ତୁ ।';

  @override
  String get wizardIntro =>
      'ଏକ ସାର୍ବଜନୀନ ସର୍ଭର ବାଛନ୍ତୁ କିମ୍ବା ଆପଣଙ୍କର ନିଜର ଯୋଗ କରନ୍ତୁ । (ପରେ ସେଟିଂସମୂହରେ ପରିବର୍ତ୍ତନ କରାଯାଇପାରିବ)';

  @override
  String get startUsingClipious => 'କ୍ଲିପିଆସ୍ ବ୍ୟବହାର କରିବା ଆରମ୍ଭ କରନ୍ତୁ';

  @override
  String get videoAddedToPlaylist => 'ଭିଡିଓ ପ୍ଲେଲିଷ୍ଟରେ ଯୋଡା ଯାଇଛି';

  @override
  String get videoAddedToQueue => 'ଧାଡ଼ିରେ ଭିଡ଼ିଓ ଯୋଗ କରାଯାଇଛି';

  @override
  String get errorAddingVideoToPlaylist =>
      'ପ୍ଲେ ଲିଷ୍ଟରେ ଭିଡିଓ ଯୋଡିବାବେଳେ ତ୍ରୁଟି';

  @override
  String get itemlistErrorGeneric => 'ତଥ୍ୟ ପ୍ରାପ୍ତ କରିପାରିଲା ନାହିଁ';

  @override
  String get itemListErrorInvalidScope =>
      'ଏହା ଦେଖିବା ପାଇଁ ଆପଣଙ୍କ ପାଖରେ ଅନୁମତି ନାହିଁ, ଯଦି ଆପଣ ଟୋକନ ପଦ୍ଧତି ବ୍ୟବହାର କରି ଲଗଇନ କରିଛନ୍ତି ତେବେ ଲଗଆଉଟ କରିବା ଏବଂ ପୁନର୍ବାର ଲଗଇନ କରିବା ପାଇଁ ଚେଷ୍ଟା କରନ୍ତୁ';

  @override
  String get selectPlaylist => 'ପ୍ଲେଲିଷ୍ଟ ଚୟନ କରନ୍ତୁ';

  @override
  String get createNewPlaylist => 'ନୂତନ ପ୍ଲେଲିଷ୍ଟ ସୃଷ୍ଟି କରନ୍ତୁ';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ସମୁଦାୟ ଉତ୍ତର ସଂଖ୍ୟା ',
      one: 'ଗୋଟିଏ ଉତ୍ତର',
      zero: 'କୌଣସି ଉତ୍ତର ନାହିଁ ',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'ଅଧିକ ଲୋଡ୍ କରନ୍ତୁ';

  @override
  String get topSorting => 'ଶୀର୍ଷ';

  @override
  String get newSorting => 'ନୂତନ';

  @override
  String get streamIsLive => 'ଲାଇଭ୍';

  @override
  String get sponsorSkipped => 'ପ୍ରଯୋଜକ ଛାଡିଦେଲେ';

  @override
  String get selectBrowsingCountry => 'ବ୍ରାଉଜିଂ ଦେଶ ଚୟନ କରନ୍ତୁ';

  @override
  String get showOnStart => 'ଆପ୍ ଆରମ୍ଭ ହେବାବେଳେ କ’ଣ ଦେଖାଇବାକୁ ବାଛନ୍ତୁ';

  @override
  String get settings => 'ସେଟିଂ ସମୂହ';

  @override
  String get browsing => 'ବ୍ରାଉଜିଂ';

  @override
  String get country => 'ଦେଶ';

  @override
  String get whenAppStartsShow => 'ଯେତେବେଳେ ଆପ୍ ଆରମ୍ଭ ହୁଏ, ଦେଖାନ୍ତୁ…';

  @override
  String get servers => 'ସର୍ଭର ଗୁଡ଼ିକ';

  @override
  String get manageServers => 'ସର୍ଭରଗୁଡିକ ପରିଚାଳନା କରନ୍ତୁ';

  @override
  String currentServer(String current) {
    return 'ସମ୍ପ୍ରତି ବ୍ୟବହୃତ $current';
  }

  @override
  String get useSponsorBlock => 'ପ୍ରଯୋଜକ ବ୍ଲକ୍ ବ୍ୟବହାର କରନ୍ତୁ';

  @override
  String get sponsorBlockDescription =>
      'ସମ୍ପ୍ରଦାୟ ଦ୍ୱାରା ଦାଖଲ ହୋଇଥିବା ପ୍ରାୟୋଜକ ବିଭାଗଗୁଡିକ ଛାଡିଦିଅ';

  @override
  String get about => 'ବିଷୟରେ';

  @override
  String get name => 'ନାମ';

  @override
  String get package => 'ପ୍ୟାକେଜ୍';

  @override
  String get version => 'ସଂସ୍କରଣ';

  @override
  String get build => 'ନିର୍ମାଣ କରନ୍ତୁ';

  @override
  String get addServer => 'ସର୍ଭର ଯୋଡନ୍ତୁ';

  @override
  String get useThisServer => 'ଏହି ସର୍ଭର ବ୍ୟବହାର କରନ୍ତୁ';

  @override
  String get logIn => 'ଭିତରକୁ ଯାଆନ୍ତୁ';

  @override
  String get delete => 'ବିଲୋପ କରନ୍ତୁ';

  @override
  String get invalidInvidiousServer => 'ଅବୈଧ ସର୍ଭର୍';

  @override
  String get yourServers => 'ଆପଣଙ୍କର ସର୍ଭର ଗୁଡ଼ିକ';

  @override
  String get loggedIn => 'ଲଗ୍ ଇନ୍ ହୋଇଛି';

  @override
  String get notLoggedIn => 'ଲଗ୍ ଇନ୍ ହୋଇନାହିଁ';

  @override
  String get addServerHelpText =>
      'ନିଜର ସର୍ଭର ଯୋଡିବା ପାଇଁ କିମ୍ବା ଏକ ସାର୍ବଜନୀନ ସର୍ଭରରେ ଟ୍ୟାପ୍ କରି ଏହାକୁ ଯୋଡିବା ପାଇଁ + ବଟନ୍ ବ୍ୟବହାର କରନ୍ତୁ ।';

  @override
  String get publicServers => 'ଜନସାଧାରଣ ସର୍ଭରଗୁଡ଼ିକ';

  @override
  String get loadingPublicServer => 'ସର୍ବସାଧାରଣ ସର୍ଭରଗୁଡ଼ିକୁ ଧାରଣ କରୁଛି';

  @override
  String get tapToAddServer => 'ଆପଣଙ୍କ ତାଲିକାରେ ସର୍ଭର ଯୋଡିବାକୁ ଟ୍ୟାପ୍ କରନ୍ତୁ';

  @override
  String get publicServersError =>
      'ସର୍ବସାଧାରଣ ସର୍ଭରଗୁଡ଼ିକର ତାଲିକା ଆଣିପାରିଲା ନାହିଁ । ପୁନଃଚେଷ୍ଟା କରିବାକୁ ଟ୍ୟାପ୍ କରନ୍ତୁ ।';

  @override
  String get appearance => 'ଦୃଶ୍ୟ';

  @override
  String get useDynamicTheme => 'ଗତିଶୀଳ ରଙ୍ଗ';

  @override
  String get useDynamicThemeDescription =>
      'ତୁମେ ରଙ୍ଗ ବ୍ୟବହାର କର (କେବଳ ଆଣ୍ଡ୍ରଏଡ୍ 12 ରେ ଉପଲବ୍ଧ)';

  @override
  String get useDash => 'DASH ବ୍ୟବହାର କରନ୍ତୁ';

  @override
  String get useDashDescription =>
      'ୟୁଟ୍ୟୁବ୍ ଏହାକୁ ଥ୍ରଟ କଲାବେଳେ, DASH ଆଡାପ୍ଟିଭ୍ ଷ୍ଟ୍ରିମିଂ ସମସ୍ୟା ସୃଷ୍ଟି କରିପାରେ ।';

  @override
  String get videoPlayer => 'ଭିଡିଓ ପ୍ଲେୟାର';

  @override
  String get videoListed => 'ଜନସାଧାରଣ';

  @override
  String get videoUnlisted => 'ତାଲିକାଭୁକ୍ତ ନୁହେଁ';

  @override
  String get videoIsFamilyFriendly => 'ପରିବାର ବନ୍ଧୁତ୍ୱପୂର୍ଣ୍ଣ';

  @override
  String get tapToManage => 'ପରିଚାଳନା କରିବାକୁ ଟ୍ୟାପ୍ କରନ୍ତୁ';

  @override
  String get authentication => 'ପ୍ରାମାଣିକିକରଣ';

  @override
  String get tokenLogin => 'ଟୋକନ୍ ସହିତ ଲଗ୍ ଇନ୍ କରନ୍ତୁ';

  @override
  String get tokenLoginDescription => 'ଲଗ୍ ଇନ୍ କରିବାକୁ ପରାମର୍ଶିତ ଉପାୟ';

  @override
  String get cookieLogin => 'କୁକି ସହିତ ଲଗ୍ ଇନ୍ କରନ୍ତୁ';

  @override
  String get cookieLoginDescription =>
      'ଯଦି ଆପଣ ଟୋକେନ୍ ପ୍ରାମାଣିକିକରଣ ସହିତ ସମସ୍ୟାର ସମ୍ମୁଖୀନ ହୁଅନ୍ତି ତେବେ ଏହି ପଦ୍ଧତିକୁ ବ୍ୟବହାର କରନ୍ତୁ';

  @override
  String get logout => 'ପ୍ରସ୍ଥାନ କର';

  @override
  String get username => 'ଉପଯୋଗକର୍ତ୍ତା ନାମ';

  @override
  String get password => 'ପାସୱାର୍ଡ';

  @override
  String get wrongUsernamePassword => 'ଭୁଲ ଚାଳକନାମ କିମ୍ବା ପାସୱାର୍ଡ';

  @override
  String get error => 'ତ୍ରୁଟି';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats is not as expected';

  @override
  String get malformedStatsEndpointDescription =>
      'The server stats endpoint did not respond an expected payload, the key \"software.name\" should be equal to \"invidious\".\nResponse from the server:';

  @override
  String get serverIsNotReachable => 'Server is not reachable';

  @override
  String get videoQueue => 'ଭିଡିଓ ଧାଡି';

  @override
  String get addToQueueList => 'ଧାଡିରେ ଯୋଡନ୍ତୁ';

  @override
  String get addToPlaylist => 'ନାଟକ ତାଲିକାରେ ଯୋଗ କରନ୍ତୁ';

  @override
  String get playNext => 'ପରବର୍ତ୍ତୀ ଖେଳନ୍ତୁ';

  @override
  String get playNextAddedToQueue => 'ଭିଡ଼ିଓ ଆଗକୁ ଚାଲିବ';

  @override
  String get addRecommendedToQueue =>
      'ପରବର୍ତ୍ତୀ ସମୟରେ ଅଟୋ-ପ୍ଲେ ସୁପାରିଶ କରାଯାଇଛି';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'କେଉଁ ପ୍ରକାର ବିଭାଗକୁ ଏଡ଼ାଇବାକୁ ବାଛନ୍ତୁ';

  @override
  String get sponsorBlockCategorySponsor => 'ପ୍ରଯୋଜକ';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'ଦେୟଯୁକ୍ତ ପଦୋନ୍ନତି, ଦେୟଯୁକ୍ତ ରେଫରାଲ୍ ଏବଂ ପ୍ରତ୍ୟକ୍ଷ ବିଜ୍ଞାପନ । ଆତ୍ମ-ପଦୋନ୍ନତି କିମ୍ବା କାରଣ/ସୃଷ୍ଟିକର୍ତ୍ତା/ଉତ୍ପାଦ/ ୱେବସାଇଟ୍ ଗୁଡିକ ର ମାଗଣା ସର୍ଟକଟ୍ ପାଇଁ ନୁହେଁ , ଯାହା ସେମାନେ ପସନ୍ଦ କରନ୍ତି ।';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo => 'ଅନାଦେୟ/ଆତ୍ମ ପଦୋନ୍ନତି';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'ଅନାଦେୟ କିମ୍ବା ଆତ୍ମ ପଦୋନ୍ନତି ବ୍ୟତୀତ \"ପ୍ରାୟୋଜକ\" ସହିତ ସମାନ । ବାଣିଜ୍ୟ, ଦାନ, କିମ୍ବା ସେମାନେ କିଏ ସହଯୋଗ କରିଥିଲେ ସେ ସମ୍ବନ୍ଧରେ ସୂଚନା ଏଥିରେ ଅନ୍ତର୍ଭୂକ୍ତ କରେ । ';

  @override
  String get sponsorBlockCategoryInteraction => 'ପାରସ୍ପରିକ ସ୍ମାରକ (ସଦସ୍ୟତା)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'ଯେତେବେଳେ ବିଷୟବସ୍ତୁ ମଧ୍ୟରେ ସେମାନଙ୍କୁ ପସନ୍ଦ, ସବସ୍କ୍ରାଇବ୍ କିମ୍ବା ଅନୁସରଣ କରିବାକୁ ଏକ ସଂକ୍ଷିପ୍ତ ସ୍ମାରକ ଅଛି । ଯଦି ଏହା ଲମ୍ବା କିମ୍ବା କିଛି ନିର୍ଦ୍ଦିଷ୍ଟ ବିଷୟରେ, ଏହା ବଦଳରେ ଆତ୍ମ ପ୍ରୋତ୍ସାହନ ଅଧୀନରେ ରହିବା ଉଚିତ ।';

  @override
  String get sponsorBlockCategoryIntro => 'ଇଣ୍ଟରମିସନ୍ /ଇଣ୍ଟ୍ରୋ ଆନିମେସନ୍';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'ପ୍ରକୃତ ବିଷୟବସ୍ତୁ ବିନା ଏକ ବ୍ୟବଧାନ । ଏକ ବିରାମ, ଷ୍ଟାଟିକ୍ ଫ୍ରେମ୍, ପୁନରାବୃତ୍ତି ଆନିମେସନ୍ ହୋଇପାରେ । ସୂଚନା ଧାରଣ କରିଥିବା ସ୍ଥାନାନ୍ତରଣ ପାଇଁ ଏହା ବ୍ୟବହୃତ ହେବା ଉଚିତ୍ ନୁହେଁ ।';

  @override
  String get sponsorBlockCategoryOutro => 'ଏଣ୍ଡକାର୍ଡ/କ୍ରେଡିଟ୍';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'କ୍ରେଡିଟ୍ କିମ୍ବା ଯେତେବେଳେ ୟୁଟ୍ୟୁବ୍ ଏଣ୍ଡକାର୍ଡ ଦେଖାଯାଏ । ସୂଚନା ସହିତ ସିଦ୍ଧାନ୍ତ ପାଇଁ ନୁହେଁ ।';

  @override
  String get sponsorBlockCategoryPreview => 'ପୂର୍ବାବଲୋକନ';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'କ୍ଲିପଗୁଡିକର ସଂଗ୍ରହ ଯାହାକି ଏହି ଭିଡିଓରେ କିମ୍ବା ଅନ୍ୟ ଏକ ଭିଡିଓରେ କ’ଣ ଆସୁଛି ତାହା ଦର୍ଶାଏ, ଯେଉଁଠାରେ ସମସ୍ତ ସୂଚନା ପରେ ଭିଡିଓରେ ପୁନରାବୃତ୍ତି ଆଉଥରେ ହୁଏ ।';

  @override
  String get sponsorBlockCategoryFiller => 'ଥଟ୍ଟା';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'ଟାଙ୍ଗେସିଆଲ୍ ଦୃଶ୍ୟ କେବଳ ଫିଲର୍ କିମ୍ବା ହାସ୍ୟରସ ପାଇଁ ଯୋଡି ହୋଇଛି ଯାହା ଭିଡିଓର ମୁଖ୍ୟ ବିଷୟବସ୍ତୁ ବୁଝିବା ପାଇଁ ଆବଶ୍ୟକ ନୁହେଁ । ପ୍ରସଙ୍ଗ କିମ୍ବା ପୃଷ୍ଠଭୂମି ବିବରଣୀ ପ୍ରଦାନ କରୁଥିବା ବିଭାଗଗୁଡିକ ଏଥିରେ ଅନ୍ତର୍ଭୂକ୍ତ କରିବା ଉଚିତ୍ ନୁହେଁ । ଯେତେବେଳେ ଆପଣ “ମଜା” ପାଇଁ ମନୋବୃତ୍ତିରେ ନାହାଁନ୍ତି, ସେତେବେଳେ ଏହା ଅତ୍ୟନ୍ତ ଆକ୍ରମଣାତ୍ମକ ବର୍ଗ ଅଟେ ।';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'ସଙ୍ଗୀତ: ଅଣ-ସଙ୍ଗୀତ ବିଭାଗ';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'କେବଳ ମ୍ୟୁଜିକ ଭିଡିଓରେ ବ୍ୟବହାର ପାଇଁ । ଏହା କେବଳ ମ୍ୟୁଜିକ ଭିଡିଓର ସେହି ବିଭାଗଗୁଡ଼ିକ ପାଇଁ ବ୍ୟବହାର କରାଯିବା ଉଚିତ ଯାହାକି ପୂର୍ବରୁ ଅନ୍ୟ ଶ୍ରେଣୀ ଦ୍ୱାରା କଭର ହୋଇନଥିବ ।';

  @override
  String get useProxy => 'ଭିଡିଓଗୁଡିକୁ ପ୍ରକ୍ସି କରନ୍ତୁ';

  @override
  String get useProxyDescription =>
      'ସର୍ଭରରୁ ଭିଡିଓ ଷ୍ଟ୍ରିମ୍ ପ୍ରକ୍ସିଂ କରି, ଆପଣ ଆଞ୍ଚଳିକ ବ୍ଲକଗୁଡିକ କିମ୍ବା ୟୁଟ୍ୟୁବ୍ ଅବରୋଧ କରୁଥିବା ISP ବାଇପାସ୍ କରିପାରିବେ';

  @override
  String get pressDownToShowSettings => 'ସେଟିଙ୍ଗ୍ ଦେଖାଇବାକୁ ତଳକୁ ଦବାନ୍ତୁ';

  @override
  String get quality => 'ଗୁଣବତ୍ତା';

  @override
  String get audio => 'ଅଡିଓ';

  @override
  String get subtitles => 'ଉପପଟ୍ଟ';

  @override
  String get playbackSpeed => 'ପ୍ଲେବେକ୍ ବେଗ';

  @override
  String get blackBackground => 'କଳା ପୃଷ୍ଠଭୂମି';

  @override
  String get blackBackgroundDescription => 'OLED ସ୍କ୍ରିନରେ ଗାଢ ଥିମ୍ ପାଇଁ';

  @override
  String get search => 'ସନ୍ଧାନ କର';

  @override
  String get subtitleFontSize => 'ଉପପଟ୍ଟ ଅକ୍ଷରର ଆକାର';

  @override
  String get subtitleFontSizeDescription =>
      'ଯଦି ଆପଣଙ୍କର ଡିଭାଇସରେ ଏହା ବହୁତ ଛୋଟ କିମ୍ବା ବହୁତ ବଡ ତେବେ ସବ୍ଟାଇଟଲଗୁଡିକର ଆକାର ପରିବର୍ତ୍ତନ କରନ୍ତୁ';

  @override
  String get skipSslVerification => 'SSL ସାର୍ଟିଫିକେଟ୍ ଯାଞ୍ଚକୁ ଏଡ଼ାଇଦିଅ';

  @override
  String get skipSslVerificationDescription =>
      'ଏକ ସ୍ବାକ୍ଷରିତ SSL ସାର୍ଟିଫିକେଟ୍ ବ୍ୟବହାର କରିବା ପାଇଁ, କିମ୍ବା ଯେତେବେଳେ ଆପଣଙ୍କର ସର୍ଭର ସହିତ SSL ସମ୍ବନ୍ଧୀୟ ସମସ୍ୟାଗୁଡିକ ଥାଏ ।';

  @override
  String get themeBrightness => 'ଥିମ୍';

  @override
  String get themeLight => 'ଉଜ୍ଜଳ';

  @override
  String get themeDark => 'ଅନ୍ଧାର';

  @override
  String get followSystem => 'ସିଷ୍ଟମ୍ କୁ ଅନୁସରଣ କରନ୍ତୁ';

  @override
  String get requiresRestart => 'ଆପ୍ ପୁନଃଆରମ୍ଭ ଆବଶ୍ୟକ କରେ';

  @override
  String get appLanguage => 'ଆପ୍ ଭାଷା';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ମୋଟ ଭିଡିଓ ସଂଖ୍ୟା',
      one: 'ଗୋଟିଏ ଭିଡିଓ',
      zero: 'କୌଣସି ଭିଡିଓ ନାହିଁ',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'Url must start with http:// or https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'returnyoutubedislike.com ଦ୍ୱାରା ପ୍ରଦତ୍ତ API ବ୍ୟବହାର କରି ଆନୁମାନିକ ଭିଡିଓ ନାପସନ୍ଦ ଦେଖାନ୍ତୁ';

  @override
  String get rydCustomInstance => 'Custom RYD instance url';

  @override
  String get rydCustomInstanceDescription =>
      'Use a different RYD instance, leave empty to use the default';

  @override
  String get autoplayVideoOnLoad => 'ଲୋଡ୍ ପରେ ସ୍ୱୟଂଚାଳିତ ଭାବରେ ଭିଡିଓ ଚଲାନ୍ତୁ';

  @override
  String get autoplayVideoOnLoadDescription =>
      'ଭିଡିଓ ଲୋଡ୍ ହେବା ପରେ ସ୍ୱୟଂଚାଳିତ ଭାବରେ ଖେଳିବା ଆରମ୍ଭ କରନ୍ତୁ';

  @override
  String get searchHistory => 'ସନ୍ଧାନ ଇତିହାସ';

  @override
  String get searchHistoryDescription => 'ସନ୍ଧାନ ଇତିହାସ ସେଟିଂସମୂହ';

  @override
  String get enableSearchHistory => 'ସନ୍ଧାନ ଇତିହାସ ସକ୍ଷମ କରନ୍ତୁ';

  @override
  String get searchHistoryLimit => 'ସନ୍ଧାନ ଇତିହାସ ସୀମା';

  @override
  String get searchHistoryLimitDescription =>
      'ପରାମର୍ଶରେ କେତେ ପୂର୍ବ ସନ୍ଧାନ ଦେଖାଯିବ ସେଟ୍ କରନ୍ତୁ';

  @override
  String get shorts => 'ସର୍ଟସ୍';

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
  String get searchSortRelevance => 'ପ୍ରାସଙ୍ଗିକତା';

  @override
  String get searchSortRating => 'ମୂଲ୍ୟାୟନ';

  @override
  String get searchSortUploadDate => 'ଅପଲୋଡ୍ ତାରିଖ';

  @override
  String get searchSortViewCount => 'ଦର୍ଶନ ଗଣନା';

  @override
  String get clearSearchHistory => 'ସନ୍ଧାନ ଇତିହାସ ସଫା କରନ୍ତୁ';

  @override
  String get appLogs => 'ପ୍ରୟୋଗ ଲଗଗୁଡ଼ିକ';

  @override
  String get appLogsDescription =>
      'ପ୍ରୟୋଗରେ ଘଟୁଥିବା ଘଟଣାଗୁଡ଼ିକର ଲଗ ପ୍ରାପ୍ତ କରନ୍ତୁ, ସମସ୍ୟାଗୁଡ଼ିକୁ ରିପୋର୍ଟ କରିବା ପାଇଁ ଉପଯୋଗୀ ହୋଇପାରେ';

  @override
  String get copyToClipBoard => 'କ୍ଲିପବୋର୍ଡରେ ନକଲ କରନ୍ତୁ';

  @override
  String get logsCopied => 'ଲଗଗୁଡ଼ିକୁ କ୍ଲିପବୋର୍ଡରେ ନକଲ କରାଯାଇଛି';

  @override
  String get rememberSubtitleLanguage => 'ସବ୍ଟାଇଟ୍ଲ ଭାଷା କୁ ମନେରଖ';

  @override
  String get videoFilters => 'ଭିଡିଓ ଛାଣକଗୁଡ଼ିକ';

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
      'ନିମ୍ନଲିଖିତ ଫିଲ୍ଟରଗୁଡ଼ିକ ଉପରେ ଆଧାର କରି ଆପ୍ଲିକେସନରେ ଥିବା ସମସ୍ତ ଭିଡ଼ିଓ ଫିଡରୁ ଭିଡ଼ିଓଗୁଡ଼ିକୁ ଲୁଚାନ୍ତୁ ଅଥବା ଅପସାରଣ କରନ୍ତୁ । ଏହା ଉଦାହରଣ ସ୍ୱରୂପ ଆପଣଙ୍କୁ କ୍ରୀଡା ସ୍ପୋଇଲର ଲୁଚାଇବା କିମ୍ବା ଏକ ନିର୍ଦ୍ଦିଷ୍ଟ ଚ୍ୟାନେଲରୁ ସର୍ଟ ଲୁଚାଇବା ପାଇଁ ଅନୁମତି ଦେଇଥାଏ ।';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'ଭିଡିଓଗୁଡ଼ିକୁ ଛାଣିବା ପାଇଁ ନିୟମଗୁଡ଼ିକୁ ବ୍ୟାଖ୍ୟା କରନ୍ତୁ';

  @override
  String get videoFilterAllChannels => 'ସମସ୍ତ ଚ୍ୟାନେଲଗୁଡ଼ିକ';

  @override
  String get addVideoFilter => 'ଛାଣକ ନିର୍ମାଣ କରନ୍ତୁ';

  @override
  String get editVideoFilter => 'ଛାଣକ ସମ୍ପାଦନ କରନ୍ତୁ';

  @override
  String get videoFilterType => 'ପ୍ରକାର';

  @override
  String get videoFilterOperation => 'ପ୍ରୟୋଗ';

  @override
  String get videoFilterValue => 'ମୂଲ୍ଯ';

  @override
  String get save => 'ସଂରକ୍ଷଣ କରନ୍ତୁ';

  @override
  String get videoFilterEditDescription =>
      'ତାଲିକାରୁ ଭିଡ଼ିଓଗୁଡ଼ିକୁ ଛାଣିବା ପାଇଁ ଗୋଟିଏ ବୈକଳ୍ପିକ ଚ୍ୟାନେଲ, ଗୋଟିଏ ଫିଲ୍ଟର ପ୍ରକାର, ପ୍ରୟୋଗ ଏବଂ ମୂଲ୍ଯ ବାଛନ୍ତୁ । ଉଦାହରଣ ସ୍ୱରୂପ, ପ୍ରକାର: ଭିଡ଼ିଓ ନାମ, ପ୍ରୟୋଗ: ଧାରଣ କରିଥାଏ, ମୂଲ୍ୟ: ପରୀକ୍ଷଣ ସମସ୍ତ ଭିଡ଼ିଓଗୁଡ଼ିକୁ ସେମାନଙ୍କ ନାମରେ ପରୀକ୍ଷଣ ଶବ୍ଦ ସହିତ ବାଦ୍ ଦେବ ।';

  @override
  String get optional => 'ବୈକଳ୍ପିକ';

  @override
  String get videoFilterHideLabel => 'ଲୁଚାନ୍ତୁ';

  @override
  String get videoFilterFilterLabel => 'ଅସ୍ପଷ୍ଟ କରନ୍ତୁ';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter ଭିଡିଓଗୁଡିକ ଯେଉଁଠାରେ $type $operation \'$value\'।';
  }

  @override
  String get videoFiltered => 'ନିମ୍ନଲିଖିତ କାରଣଗୁଡ଼ିକ ପାଇଁ ଭିଡିଓ ଛାଣାଯାଇଛି:';

  @override
  String get videoFilterTapToReveal => 'ପ୍ରକାଶ କରିବା ପାଇଁ ଟ୍ୟାପ୍ କରନ୍ତୁ';

  @override
  String get videoFilterHide => 'ଛାଣାଯାଇଥିବା ଭିଡିଓଗୁଡ଼ିକୁ ଲୁଚାନ୍ତୁ';

  @override
  String get videoFilterHideDescription =>
      'ପୂର୍ବନିର୍ଦ୍ଧାରିତ ଭାବରେ ଛାଣାଯାଇଥିବା ଭିଡିଓଗୁଡ଼ିକ ଲୁକ୍କାୟିତ ହୋଇନଥାଏ କିନ୍ତୁ ଏହାକୁ ଛାଣାଯାଇଥିବା କାରଣ(ଗୁଡ଼ିକ) ସହିତ ଅପରିଷ୍କାର ଭାବରେ ଦର୍ଶାଯାଇଥାଏ । ଏହି ବିନ୍ୟାସ ତାଲିକାରୁ ଛାଣାଯାଇଥିବା ଭିଡ଼ିଓଗୁଡ଼ିକୁ ଅପସାରଣ କରିଥାଏ ।';

  @override
  String get videoFilterNoFilters =>
      'କୌଣସି ଭିଡିଓ ଫିଲ୍ଟର ନାହିଁ, ଫିଲ୍ଟର ଯୋଗ କରିବା ପାଇଁ ତଳେ + ବଟନକୁ ଟ୍ୟାପ କରନ୍ତୁ ।';

  @override
  String get videoFilterTypeVideoTitle => 'ଭିଡିଓ ଶୀର୍ଷକ';

  @override
  String get videoFilterTypeChannelName => 'ଚ୍ୟାନେଲ ନାମ';

  @override
  String get videoFilterTypeVideoLength => 'ଭିଡ଼ିଓ ଲମ୍ବ (ସେକେଣ୍ଡ)';

  @override
  String get videoFilterOperationContains => 'ଧାରଣ କରିଥାଏ';

  @override
  String get videoFilterOperationNotContain => 'ଧାରଣ କରିନଥାଏ';

  @override
  String get videoFilterOperationLowerThan => 'ଏହାଠାରୁ କମ୍';

  @override
  String get videoFilterOperationHigherThan => 'ଏହାଠାରୁ ଅଧିକ';

  @override
  String get channel => 'ଚ୍ୟାନେଲ';

  @override
  String get videoFilterHideAllFromChannel =>
      'ଚ୍ୟାନେଲରୁ ସମସ୍ତ ଭିଡ଼ିଓଗୁଡ଼ିକୁ ଛାଣନ୍ତୁ';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter ଚ୍ୟାନେଲରୁ ସମସ୍ତ ଭିଡିଓ';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'ଯଦି ଉପଲବ୍ଧ ହୁଏ, ସ୍ୱୟଂଚାଳିତ ଭାବରେ ଶେଷ ଭାଷାକୁ ସବ୍ଟାଇଟ୍ଲ ଭାବେ ସେଟ୍ କରନ୍ତୁ';

  @override
  String get lockFullScreenToLandscape =>
      'ଭିଡିଓ ଦିଗ ଅନୁପାତରେ ସମ୍ପୂର୍ଣ୍ଣ ପରଦା ଆଭିମୁଖ୍ୟକୁ ଅପରିବର୍ତ୍ତନୀୟ କରନ୍ତୁ';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'ଭିଡିଓ ଫର୍ମାଟ, ବିସ୍ତୃତ ଭିଡିଓ ପାଇଁ ଦୃଶ୍ୟ ଏବଂ ପୋଟ୍ରେଟ ଭିଡିଓ ପାଇଁ ପୋଟ୍ରେଟ ଆଧାରରେ ସମ୍ପୂର୍ଣ୍ଣ ପରଦା ଆଭିମୁଖ୍ୟକୁ ଲକ୍ କରିଥାଏ';

  @override
  String get fillFullscreen =>
      'ପରଦା ସହିତ ମେଳ ଖାଇବା ପାଇଁ ଭିଡ଼ିଓକୁ ସର୍ବାଧିକ କରନ୍ତୁ';

  @override
  String get fillFullscreenDescription =>
      'ଦୃଶ୍ୟପଟ୍ଟ ଧାରାରେ ସମ୍ପୂର୍ଣ୍ଣ ପରଦା ପୂରଣ କରିବା ପାଇଁ ଭିଡ଼ିଓକୁ ସଜାଡ଼ନ୍ତୁ';

  @override
  String get rememberPlaybackSpeed => 'ଚଲାବୁଲା ଗତି ମନେରଖନ୍ତୁ';

  @override
  String get rememberPlaybackSpeedDescription =>
      'ସ୍ୱୟଂଚାଳିତ ଭାବରେ ଚୟିତ ଶେଷ ବେଗରେ ଖେଳିବା ବେଗକୁ ସ୍ୱୟଂଚାଳିତ ଭାବରେ ସେଟ କରନ୍ତୁ';

  @override
  String get downloads => 'ଆହରଣଗୁଡ଼ିକ';

  @override
  String get download => 'ଆହରଣ କରନ୍ତୁ';

  @override
  String get videoAlreadyDownloaded => 'ଭିଡିଓ ପୂର୍ବରୁ ଡାଉନଲୋଡ ହୋଇଛି';

  @override
  String get noDownloadedVideos =>
      'କୌଣସି ଆହରଣ ଭିଡ଼ିଓ ନାହିଁ, ବ୍ରାଉଜ କରନ୍ତୁ, ତାଲିକାରେ ଏକ ଭିଡ଼ିଓ ଉପରେ ଲମ୍ବା ଦବାନ୍ତୁ କିମ୍ବା ଡାଉନଲୋଡ କରିବା ପାଇଁ ଭିଡିଓ ସ୍କ୍ରିନରେ ଡାଉନଲୋଡ ବଟନକୁ ଟ୍ୟାପ କରନ୍ତୁ';

  @override
  String get downloadsPlayAll => 'ସମସ୍ତଙ୍କୁ ଚଲାନ୍ତୁ';

  @override
  String get videoDownloadStarted => 'ଭିଡିଓ ଡାଉନଲୋଡ ଆରମ୍ଭ ହୋଇଛି';

  @override
  String get videoFailedDownloadRetry =>
      'ଆହରଣ ବିଫଳ ହୋଇଛି, ପୁଣିଥରେ ଚେଷ୍ଟା କରିବା ପାଇଁ ଟ୍ୟାପ୍ କରନ୍ତୁ';

  @override
  String get videoDownloadAudioOnly => 'କେବଳ ଧ୍ୱନି';

  @override
  String get manageSubscriptions => 'ସବସ୍କ୍ରିପସନଗୁଡ଼ିକୁ ପରିଚାଳନା କରନ୍ତୁ';

  @override
  String get noSubscriptions =>
      'କୌଣସି ସବସ୍କ୍ରିପସନ ନାହିଁ, ଭିଡିଓ ବ୍ରାଉଜ କରନ୍ତୁ ଏବଂ ଆପଣ ପସନ୍ଦ କରୁଥିବା କୌଣସି ଚ୍ୟାନେଲକୁ ସବସ୍କ୍ରାଇବ କରନ୍ତୁ ।';

  @override
  String get youCanSubscribeAgainLater =>
      'ଆପଣ ପରେ ଏହି ଚ୍ୟାନେଲକୁ ପୁଣିଥରେ ସବସ୍କ୍ରାଇବ କରିପାରିବେ';

  @override
  String get unSubscribeQuestion => 'ଆପଣ ସବ୍ସ୍କ୍ରାଇବକୁ ବାତିଲ କରିବେ କି ?';

  @override
  String get clearHistoryQuestion => 'ପୁରୁଣା ତଥ୍ୟକୁ ସଫା କରିବେ କି?';

  @override
  String get clearHistoryQuestionExplanation =>
      'ଏହା ଆପଣ ବ୍ୟବହାର କରୁଥିବା ଅନୁପ୍ରବେଶକାରୀ ଉଦାହରଣରେ ଆପଣଙ୍କ ଖାତାର ଦୃଶ୍ୟ ଇତିହାସକୁ ସଫା କରିବ । ଏହାକୁ ଏଡ଼ାଇ ଦିଆଯାଇପାରିବ ନାହିଁ ।';

  @override
  String get noHistory =>
      'ଇତିହାସ ଦେଖିବା ନାହିଁ, କିଛି ଭିଡିଓ ଦେଖନ୍ତୁ ଏବଂ ଏହା ଏଠାରେ ଦେଖାଯିବ';

  @override
  String get homeLayoutEditor => 'ଘର ବିନ୍ୟାସକୁ ସମ୍ପାଦନ କରନ୍ତୁ';

  @override
  String get layoutEditorAddVideoSource => 'ଭିଡ଼ିଓ ଉତ୍ସ ଯୋଗ କରନ୍ତୁ';

  @override
  String get layoutEditorExplanation =>
      'ଆପଣ ନିଜ ହୋମ ସ୍କ୍ରିନରେ କ \'ଣ ଦେଖିବେ ତାହା ସ୍ଥିର କରିପାରିବେ, ଆପଣ ଆଭ୍ୟନ୍ତରୀଣ ସ୍କ୍ରୋଲିଂ ଏବଂ ଗୋଟିଏ ବଡ଼ ଉତ୍ସ ସହିତ 2 ଟି ଛୋଟ ଦୃଶ୍ୟ ପାଇପାରିବେ ।';

  @override
  String get home => 'ମୂଳସ୍ଥାନ';

  @override
  String get library => 'ଲାଇବ୍ରେରୀ';

  @override
  String get customizeAppLayout => 'ଆପ ବିଭାଗଗୁଡ଼ିକୁ ଇଚ୍ଛାରୂପଣ କରନ୍ତୁ';

  @override
  String get customizeAppLayoutExplanation =>
      'ଆପଣ ମୁଖ୍ୟ ଆପ୍ ‌ ନେଭିଗେସନ୍ ‌ ବାର୍ ‌ ରେ କେଉଁ ବିଭାଗକୁ ଦର୍ଶାଇବାକୁ ଚାହୁଁଛନ୍ତି ତାହା ଚୟନ କରନ୍ତୁ । ପ୍ରୟୋଗ ଆରମ୍ଭ ହେବା ସମୟରେ କେଉଁ ସ୍କ୍ରିନ ଦର୍ଶାଇଥାଏ ତାହା ବାଛିବା ପାଇଁ ହୋମ ଆଇକନ ଉପରେ କ୍ଲିକ କରନ୍ତୁ । ଆପଣ ସେଗୁଡିକୁ ଚାରିପାଖକୁ ଟାଣିବା ଦ୍ୱାରା ସେଗୁଡିକୁ ପୁନଃ ଅର୍ଡର କରିପାରିବେ ।';

  @override
  String get navigationBarStyle => 'ପଥପ୍ରଦର୍ଶନ ପଟି ଶୈଳୀ';

  @override
  String get navigationBarLabelAlwaysShowing => 'ନାମପଟି ସର୍ବଦା ଦର୍ଶାଯାଉଛି';

  @override
  String get navigationBarLabelShowOnSelect =>
      'ବଚ୍ଛିତ ବସ୍ତୁରେ ପ୍ରଦର୍ଶିତ ନାମପଟି';

  @override
  String get navigationBarLabelNeverShow => 'ନାମପଟି କେବେବି ଦେଖାନ୍ତୁ ନାହିଁ';

  @override
  String get distractionFreeMode => 'ବିଚଳିତ ମୁକ୍ତ ଧାରା';

  @override
  String get distractionFreeModeDescription =>
      'ଭିଡ଼ିଓ ମନ୍ତବ୍ୟ ଏବଂ ସୁପାରିଶକୁ ନିଷ୍କ୍ରିୟ କରନ୍ତୁ';

  @override
  String get secondsShortForm => 'ସେକେଣ୍ଡ';

  @override
  String get videoFilterApplyDateToFilter =>
      'ପ୍ରଦତ୍ତ ସମୟରେ ଭିଡିଓଗୁଡ଼ିକୁ ଛାଣନ୍ତୁ';

  @override
  String get videoFilterDayOfWeek => 'ଛାଣକ ପ୍ରୟୋଗ କରିବା ପାଇଁ ଦିନ ବାଛନ୍ତୁ';

  @override
  String get videoFilterDayOfWeekDescription =>
      'ଆପଣ ମନୋନୀତ ଭାବରେ ସପ୍ତାହର ଦିନ ଏବଂ ସମୟକୁ ଚୟନ କରିପାରିବେ ଯେଉଁଠାରେ ଫିଲ୍ଟରଗୁଡିକ ପ୍ରୟୋଗ କରାଯାଏ, ଉଦାହରଣ ସ୍ୱରୂପ, କ୍ରୀଡ଼ା ଇଭେଣ୍ଟଗୁଡ଼ିକୁ ନଷ୍ଟ ନକରିବା ।';

  @override
  String get videoFilterStartTime => 'ପ୍ରାରମ୍ଭିକ ସମୟ';

  @override
  String get videoFilterEndTime => 'ସମାପ୍ତି ସମୟ';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return '$selectedDays ଉପରେ ପ୍ରୟୋଗ';
  }

  @override
  String get from => 'ଠାରୁ';

  @override
  String get to => 'ଏଠାକୁ';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return '$from ଠାରୁ ଏଠାକୁ $to';
  }

  @override
  String get notifications => 'ବିଜ୍ଞପ୍ତି';

  @override
  String get notificationsDescription =>
      'ଆପଣ ଯାହା ବିଷୟରେ ବିଜ୍ଞପିତ ହୋଇଛନ୍ତି ତାହା ସକ୍ରିୟ କରନ୍ତୁ ଏବଂ ସମୀକ୍ଷା କରନ୍ତୁ';

  @override
  String get enableNotificationDescriptions =>
      'ଆପଣ ନିରୀକ୍ଷଣ କରୁଥିବା ପରିବର୍ତ୍ତନଗୁଡ଼ିକୁ ଯାଞ୍ଚ କରିବା ଏବଂ ଆପଣଙ୍କୁ ସୂଚିତ କରିବା ପାଇଁ ଅଗ୍ରଭୂମି ସର୍ଭିସ ଚଲାନ୍ତୁ';

  @override
  String get subscriptionNotification => 'ସଦସ୍ୟତା ବିଜ୍ଞପ୍ତି';

  @override
  String get subscriptionNotificationDescription =>
      'ଆପଣଙ୍କର ସବସ୍କ୍ରିପସନ ଫିଡରୁ ନୂତନ ଭିଡିଓର ବିଜ୍ଞପ୍ତି ପ୍ରାପ୍ତ କରନ୍ତୁ ଯଦି ଆପଣ ଆପଣଙ୍କର ସାମ୍ପ୍ରତିକ ଉଦାହରଣକୁ ଲଗଇନ କରନ୍ତି';

  @override
  String get subscriptionNotificationTitle =>
      'ଆପଣଙ୍କର ସବସ୍କ୍ରିପସନରୁ ନୂତନ ଭିଡିଓ';

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
    return 'ଆପଣଙ୍କ ସଦସ୍ୟତା ଫିଡରେ $_temp0 ଅଛି';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'ବ୍ୟାଟେରୀ ଅପ୍ଟିମାଇଜେସନକୁ ନିଷ୍କ୍ରିୟ କରିବା ଆବଶ୍ୟକ';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'ବିଜ୍ଞପ୍ତି ପଠାଇବା ପାଇଁ Clipious କୁ ଗୋଟିଏ ପୃଷ୍ଠଭୂମି ସର୍ଭିସ ଚଳାଇବା ଆବଶ୍ୟକ । ଏହାକୁ ସୁଗମ ଭାବରେ ଚଲାଇବା ପାଇଁ କ୍ଲିପିଆସକୁ ଅନଲିମିଟେଡ ବ୍ୟାଟେରୀ ବ୍ୟବହାର ଦେବା ଆବଶ୍ୟକ, ଓକେ ଟ୍ୟାପ୍ କରିବା ଦ୍ୱାରା ବ୍ୟାଟେରୀ ଅପ୍ଟିମାଇଜେସନ ସେଟିଙ୍ଗ ଖୋଲିବ ।';

  @override
  String get askToEnableBackgroundServiceTitle =>
      'ବିଜ୍ଞପ୍ତିଗୁଡ଼ିକ ବନ୍ଦ ହୋଇଯାଇଛି';

  @override
  String get askToEnableBackgroundServiceContent =>
      'ବିଜ୍ଞପ୍ତିଗୁଡ଼ିକୁ ପାଇବା ପାଇଁ, କ୍ଲିପୀୟ ବିଜ୍ଞପ୍ତିଗୁଡ଼ିକୁ ସକ୍ରିୟ କରିବା ଆବଶ୍ୟକ, ଏହାକୁ ସକ୍ରିୟ କରିବା ପାଇଁ OK ଦବାନ୍ତୁ ।';

  @override
  String get otherNotifications => 'ଅନ୍ୟ ବିଜ୍ଞପ୍ତି ଉତ୍ସ (ଘଣ୍ଟି ଚିତ୍ରସଂକେତ)';

  @override
  String get deleteChannelNotificationTitle =>
      'ଚ୍ୟାନେଲ ବିଜ୍ଞପ୍ତିକୁ ଅପସାରଣ କରିବେ କି?';

  @override
  String get deleteChannelNotificationContent =>
      'ଆପଣ ଏହି ଚ୍ୟାନେଲରୁ ଆଉ ବିଜ୍ଞପ୍ତି ପାଇବେ ନାହିଁ ।';

  @override
  String get deletePlaylistNotificationTitle =>
      'ପ୍ଲେଲିଷ୍ଟ ବିଜ୍ଞପ୍ତିକୁ ଅପସାରଣ କରିବେ କି?';

  @override
  String get deletePlaylistNotificationContent =>
      'ଆପଣ ଏହି ପ୍ଲେ-ଲିଷ୍ଟରୁ ଆଉ ବିଜ୍ଞପ୍ତି ପାଇବେ ନାହିଁ ।';

  @override
  String channelNotificationTitle(String channel) {
    return '$channel ରୁ ନୂତନ ଭିଡିଓ';
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
    return 'ରୁ$channel ରୁ $_temp0 ଅଛି';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return '$playlist ପ୍ଲେ ତାଲିକାରେ ନୂତନ ଭିଡିଓଗୁଡ଼ିକ';
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
      zero: 'no new video',
    );
    return 'ଏଠାରେ $_temp0ଟି$playlist playlist ଭିଡିଓ ଅଛି';
  }

  @override
  String get foregroundServiceNotificationTitle => 'ଭିଡ଼ିଓ ନିରୀକ୍ଷଣ';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'per hour',
        '24': 'a day',
        'other': 'ପ୍ରତ୍ୟେକ $hours ଘଣ୍ଟା',
      },
    );
    return 'ଥରେ $_temp0ନୂତନ ଭିଡିଓଗୁଡିକ ଯାଞ୍ଚ କରିବେ';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'ସଦସ୍ୟତା ଯାଞ୍ଚ କରୁଛି ..।';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'ପ୍ଲେଲିଷ୍ଟଗୁଡିକ ଯାଞ୍ଚ କରୁଛି ..।';

  @override
  String get foregroundServiceUpdatingChannels =>
      'ଚ୍ୟାନେଲଗୁଡିକ ଯାଞ୍ଚ କରୁଛି ..।';

  @override
  String get notificationFrequencySettingsTitle =>
      'ନୂତନ ଭିଡ଼ିଓ ଯାଞ୍ଚ ଫ୍ରିକ୍ୱେନ୍ସି';

  @override
  String get notificationFrequencySettingsDescription =>
      'ପ୍ରୟୋଗଟି ନୂତନ ଭିଡ଼ିଓଗୁଡ଼ିକ ପାଇଁ କେତେଥର ଯାଞ୍ଚ କରିବ';

  @override
  String notificationFrequencySliderLabel(String hours) {
    return '[ଅଗ୍ରଲେଖ, ଆଧୁନିକ ଓଡ଼ିଆ କଥା ସାହିତ୍ୟ].';
  }

  @override
  String get subtitlesBackground => 'ଉପଶବ୍ଦ ପୃଷ୍ଠଭୂମି';

  @override
  String get subtitlesBackgroundDescription =>
      'ଅଧିକ ପଠନୀୟ କରିବା ପାଇଁ ଉପ ଶୀର୍ଷକଗୁଡ଼ିକରେ ଗୋଟିଏ କଳା ପୃଷ୍ଠଭୂମି ଯୋଗ କରନ୍ତୁ';

  @override
  String get history => 'ଇତିହାସ';

  @override
  String get deArrowSettingDescription =>
      'କ୍ଲିକ ବାଟ ଶୀର୍ଷକ ଏବଂ ବୃହତ ନଖଗୁଡ଼ିକୁ ବଦଳାନ୍ତୁ';

  @override
  String get deArrowReplaceThumbnails => 'ଥମ୍ବନେଲଗୁଡିକ ବଦଳାନ୍ତୁ';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'ଟାଇଟଲ୍ ସହିତ ଭିଡିଓ ଥମ୍ବନେଲଗୁଡିକ ବଦଳାନ୍ତୁ';

  @override
  String get deArrowWarning =>
      'DeArrowକୁ ସକ୍ରିୟ କରନ୍ତୁ ଆପର ବ୍ରାଉଜିଙ୍ଗ ଗତିକୁ ଉଲ୍ଲେଖନୀୟ ଭାବରେ ହ୍ରାସ କରିପାରିବେ କାରଣ ପ୍ରତ୍ୟେକ ଭିଡିଓ ପାଇଁ ଅତିରିକ୍ତ HTTP ଅନୁରୋଧ ଆବଶ୍ୟକ';

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
  String get enabled => 'ସକ୍ରିୟ';

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
