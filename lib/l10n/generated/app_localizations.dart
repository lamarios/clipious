import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_az.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_ia.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('az'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('hi'),
    Locale('hu'),
    Locale('ia'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('ml'),
    Locale('nb'),
    Locale('nl'),
    Locale('or'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sl'),
    Locale('sv'),
    Locale('ta'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
  ];

  /// User subscriptions
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get subscriptions;

  /// User playlists
  ///
  /// In en, this message translates to:
  /// **'Playlists'**
  String get playlists;

  /// Popular videos title
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get popular;

  /// Trending videos title
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// When no videos in the playlist
  ///
  /// In en, this message translates to:
  /// **'No video in playlist'**
  String get noVideoInPlayList;

  /// Menu item description to show remove a video from a playlist
  ///
  /// In en, this message translates to:
  /// **'Remove from playlist'**
  String get removeFromPlayList;

  /// Ask user to delete a playlist
  ///
  /// In en, this message translates to:
  /// **'Delete Playlist?'**
  String get deletePlayListQ;

  /// Tell the user that the action cannot be undone
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible'**
  String get irreversibleAction;

  /// Title for add playlist dialog
  ///
  /// In en, this message translates to:
  /// **'Add Playlist'**
  String get addPlayList;

  /// Place holder for new playlist name text field
  ///
  /// In en, this message translates to:
  /// **'Playlist name'**
  String get playListName;

  /// Dropdown label for playlist visibility
  ///
  /// In en, this message translates to:
  /// **'Visibility'**
  String get playlistVisibility;

  /// Public playlist
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get publicPlaylist;

  /// Private playlist
  ///
  /// In en, this message translates to:
  /// **'Private'**
  String get privatePlaylist;

  /// Cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Add button abel
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Unlisted playlist
  ///
  /// In en, this message translates to:
  /// **'Unlisted'**
  String get unlistedPlaylist;

  /// Info label
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// Videos label
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// Streams label
  ///
  /// In en, this message translates to:
  /// **'Streams'**
  String get streams;

  /// Latest channel videos
  ///
  /// In en, this message translates to:
  /// **'Latest Videos'**
  String get latestVideos;

  /// When the user is subscribed to a channel
  ///
  /// In en, this message translates to:
  /// **'Subscribed'**
  String get subscribed;

  /// Label for user to subscribe to a channel
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribe;

  /// number of subscribers
  ///
  /// In en, this message translates to:
  /// **'{count, select, no{No subscribers} other{{count} subscribers}}'**
  String nSubscribers(String count);

  /// asking user if to share
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// asking user to share youtube link
  ///
  /// In en, this message translates to:
  /// **'Share YouTube link'**
  String get shareYoutubeLink;

  /// asking user to share invidious link
  ///
  /// In en, this message translates to:
  /// **'Share Invidious link'**
  String get shareInvidiousLink;

  /// asking user to share redirecting invidious link
  ///
  /// In en, this message translates to:
  /// **'Share Invidious Redirect link'**
  String get redirectInvidiousLink;

  /// asking user to share link along with timestamp
  ///
  /// In en, this message translates to:
  /// **'Add timestamp'**
  String get shareLinkWithTimestamp;

  /// Ok
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// when there are no channels to display
  ///
  /// In en, this message translates to:
  /// **'No channels'**
  String get noChannels;

  /// when there are no playlists to display
  ///
  /// In en, this message translates to:
  /// **'No playlists'**
  String get noPlaylists;

  /// Channels label
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get channels;

  /// Message to display when a video can't be loaded
  ///
  /// In en, this message translates to:
  /// **'Could not load the video'**
  String get couldntLoadVideo;

  /// Comments label
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// Recommended label
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// Can't load bunch of videos, asking  user to try again
  ///
  /// In en, this message translates to:
  /// **'Could not fetch videos. Tap to try again.'**
  String get couldntFetchVideos;

  /// Welcome message on frst time use
  ///
  /// In en, this message translates to:
  /// **'Select a public server or add your own. (Can be changed later in the settings)'**
  String get wizardIntro;

  /// button label to start using the app
  ///
  /// In en, this message translates to:
  /// **'Start using Clipious'**
  String get startUsingClipious;

  /// Pop up message when a video was added to a playlist
  ///
  /// In en, this message translates to:
  /// **'Video added to playlist'**
  String get videoAddedToPlaylist;

  /// Pop up message when a video was added at the end of the video queue
  ///
  /// In en, this message translates to:
  /// **'Video added to queue'**
  String get videoAddedToQueue;

  /// Error while adding video to playlist
  ///
  /// In en, this message translates to:
  /// **'Error while adding video to playlist'**
  String get errorAddingVideoToPlaylist;

  /// Error showing when the data can't be fetch
  ///
  /// In en, this message translates to:
  /// **'Could not fetch data'**
  String get itemlistErrorGeneric;

  /// Error when the user doesn't have the proper scope to its current token
  ///
  /// In en, this message translates to:
  /// **'You don\'\'t have the permission to see this, if you logged in using the token method try to log out and in again'**
  String get itemListErrorInvalidScope;

  /// Title when users wants to add a video to a playlist
  ///
  /// In en, this message translates to:
  /// **'Select playlist'**
  String get selectPlaylist;

  /// Button label to create a new playlist when the user wants to add a video to a playlist
  ///
  /// In en, this message translates to:
  /// **'Create new playlist'**
  String get createNewPlaylist;

  /// number of replies to a comment
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No replies} =1{1 reply} other{{count} replies}}'**
  String nReplies(num count);

  /// CTA to load more
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get loadMore;

  /// Content sorting: top
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get topSorting;

  /// Content sorting: new
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newSorting;

  /// Label when a video is a live stream
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get streamIsLive;

  /// When a sponsor segment is skipped thanks to sponsor block
  ///
  /// In en, this message translates to:
  /// **'Sponsor skipped'**
  String get sponsorSkipped;

  /// Select country for trending content
  ///
  /// In en, this message translates to:
  /// **'Select browsing country'**
  String get selectBrowsingCountry;

  /// Title of dialog asking which screen the users prefers to see
  ///
  /// In en, this message translates to:
  /// **'Select what to show when the app starts'**
  String get showOnStart;

  /// Settings title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// video browsing preferences
  ///
  /// In en, this message translates to:
  /// **'Browsing'**
  String get browsing;

  /// Country label
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// Setting title for selecting the screen to show on start
  ///
  /// In en, this message translates to:
  /// **'When the app starts, show…'**
  String get whenAppStartsShow;

  /// Server management settings category
  ///
  /// In en, this message translates to:
  /// **'Servers'**
  String get servers;

  /// Settings to manage servers
  ///
  /// In en, this message translates to:
  /// **'Manage servers'**
  String get manageServers;

  /// Which server the user is currently using
  ///
  /// In en, this message translates to:
  /// **'Currently using {current}'**
  String currentServer(String current);

  /// label for sponsorblock checkbox
  ///
  /// In en, this message translates to:
  /// **'Use SponsorBlock'**
  String get useSponsorBlock;

  /// Sponsorblock setting description
  ///
  /// In en, this message translates to:
  /// **'Skip sponsor segments submitted by the community'**
  String get sponsorBlockDescription;

  /// About
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// NAme label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// package label
  ///
  /// In en, this message translates to:
  /// **'Package'**
  String get package;

  /// version label
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// build label
  ///
  /// In en, this message translates to:
  /// **'Build'**
  String get build;

  /// Add server label
  ///
  /// In en, this message translates to:
  /// **'Add server'**
  String get addServer;

  /// Use this server label
  ///
  /// In en, this message translates to:
  /// **'Use this server'**
  String get useThisServer;

  /// CTA to log in to server
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get logIn;

  /// Delete label
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Error when the user tries to add a server that is not a proper or reachable invidious server
  ///
  /// In en, this message translates to:
  /// **'Invalid Invidious server'**
  String get invalidInvidiousServer;

  /// Your servers label
  ///
  /// In en, this message translates to:
  /// **'Your servers'**
  String get yourServers;

  /// Label to tell the user that he is logged in to the server
  ///
  /// In en, this message translates to:
  /// **'Logged in'**
  String get loggedIn;

  /// Label when the user is not logged in to the server
  ///
  /// In en, this message translates to:
  /// **'Not logged in'**
  String get notLoggedIn;

  /// label for when the user hasn't chosen a server yet
  ///
  /// In en, this message translates to:
  /// **'Use the + button to add your own servers or tap on a public server and add it.'**
  String get addServerHelpText;

  /// Public servers label
  ///
  /// In en, this message translates to:
  /// **'Public servers'**
  String get publicServers;

  /// Message telling users the app is loading the list of public servers
  ///
  /// In en, this message translates to:
  /// **'Loading public servers'**
  String get loadingPublicServer;

  /// public server description
  ///
  /// In en, this message translates to:
  /// **'Tap to add server to your list'**
  String get tapToAddServer;

  /// Error message when trying to get public servers but it failed
  ///
  /// In en, this message translates to:
  /// **'Could not fetch list of public servers. Tap to retry.'**
  String get publicServersError;

  /// Settings category title
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  ///
  ///
  /// In en, this message translates to:
  /// **'Dynamic colors'**
  String get useDynamicTheme;

  ///
  ///
  /// In en, this message translates to:
  /// **'Use Material You colors (only available on Android 12+)'**
  String get useDynamicThemeDescription;

  /// Label on video options if a user wants to switch to dash urls instead of the regular quality selection
  ///
  /// In en, this message translates to:
  /// **'Use DASH'**
  String get useDash;

  /// Description for dash in the settings screen
  ///
  /// In en, this message translates to:
  /// **'DASH adaptive streaming can sometimes be problematic, Youtube can throttle it.'**
  String get useDashDescription;

  /// Title for video player related options
  ///
  /// In en, this message translates to:
  /// **'Video player'**
  String get videoPlayer;

  /// Status of a publicly available video
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get videoListed;

  /// Status of a video that is only accessible by link
  ///
  /// In en, this message translates to:
  /// **'Unlisted'**
  String get videoUnlisted;

  /// Displayed only when a video is family friendly
  ///
  /// In en, this message translates to:
  /// **'Family friendly'**
  String get videoIsFamilyFriendly;

  /// Text shown below a server in the 'Your servers' list
  ///
  /// In en, this message translates to:
  /// **'Tap to manage'**
  String get tapToManage;

  /// Label for server settings related to authentications
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get authentication;

  /// Textto login to a server using the recommended way
  ///
  /// In en, this message translates to:
  /// **'Log in with token'**
  String get tokenLogin;

  /// Recommended way to log in
  ///
  /// In en, this message translates to:
  /// **'Recommended way to log in'**
  String get tokenLoginDescription;

  /// Text to login to a server using the cookie jar method
  ///
  /// In en, this message translates to:
  /// **'Log in with cookie'**
  String get cookieLogin;

  /// Cookie log in description
  ///
  /// In en, this message translates to:
  /// **'Use this method if you face issues with the token authentication'**
  String get cookieLoginDescription;

  /// CTA to logout of a server
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// Username label for login to a server
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Password label for login to a server
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Error message when authentication fails
  ///
  /// In en, this message translates to:
  /// **'Wrong username or password'**
  String get wrongUsernamePassword;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Title for dialog when adding a server that isn't validated as it should
  ///
  /// In en, this message translates to:
  /// **'/api/v1/stats is not as expected'**
  String get malformedStatsEndpoint;

  /// Description of the possible issue for an invalid stats endpoints
  ///
  /// In en, this message translates to:
  /// **'The server stats endpoint did not respond an expected payload, the key \"software.name\" should be equal to \"invidious\".\nResponse from the server:'**
  String get malformedStatsEndpointDescription;

  /// Title for dialog when adding a server that is not reachable
  ///
  /// In en, this message translates to:
  /// **'Server is not reachable'**
  String get serverIsNotReachable;

  /// Label for button to display the video queue
  ///
  /// In en, this message translates to:
  /// **'Video queue'**
  String get videoQueue;

  /// Label on button to add a video to the queue list
  ///
  /// In en, this message translates to:
  /// **'Add to queue'**
  String get addToQueueList;

  /// Label to add a video to a playlist
  ///
  /// In en, this message translates to:
  /// **'Add to playlist'**
  String get addToPlaylist;

  /// Label to play the video after the current one.
  ///
  /// In en, this message translates to:
  /// **'Play next'**
  String get playNext;

  /// Pop up message to confirm that the video has been properly set to play next
  ///
  /// In en, this message translates to:
  /// **'Video will play next'**
  String get playNextAddedToQueue;

  /// Switch when playing a video to automatically add the recommended videos to the video queue
  ///
  /// In en, this message translates to:
  /// **'Auto-play recommended next'**
  String get addRecommendedToQueue;

  /// Small description of what the sponsor block settings do
  ///
  /// In en, this message translates to:
  /// **'Select which type of segments to skip'**
  String get sponsorBlockSettingsQuickDescription;

  /// Sponsor block 'Sponsor' Category
  ///
  /// In en, this message translates to:
  /// **'Sponsor'**
  String get sponsorBlockCategorySponsor;

  /// Sponsor block 'Sponsor' Category description
  ///
  /// In en, this message translates to:
  /// **'Paid promotion, paid referrals and direct advertisements. Not for self-promotion or free shoutouts to causes/creators/websites/products they like.'**
  String get sponsorBlockCategorySponsorDescription;

  /// Sponsor block 'Unpaid/Self promotion' Category
  ///
  /// In en, this message translates to:
  /// **'Unpaid/Self Promotion'**
  String get sponsorBlockCategoryUnpaidSelfPromo;

  /// Sponsor block 'Unpaid/Self promotion' Category description
  ///
  /// In en, this message translates to:
  /// **'Similar to \"sponsor\" except for unpaid or self promotion. This includes sections about merchandise, donations, or information about who they collaborated '**
  String get sponsorBlockCategoryUnpaidSelfPromoDescription;

  /// Sponsor block 'Interaction' Category
  ///
  /// In en, this message translates to:
  /// **'Interaction Reminder (Subscribe)'**
  String get sponsorBlockCategoryInteraction;

  /// Sponsor block 'Interaction' Category description
  ///
  /// In en, this message translates to:
  /// **'When there is a short reminder to like, subscribe or follow them in the middle of content. If it is long or about something specific, it should be under self promotion instead.'**
  String get sponsorBlockCategoryInteractionDescription;

  /// Sponsorblock 'Intro' Category
  ///
  /// In en, this message translates to:
  /// **'Intermission/Intro Animation'**
  String get sponsorBlockCategoryIntro;

  /// Sponsorblock 'Intro' Category description
  ///
  /// In en, this message translates to:
  /// **'An interval without actual content. Could be a pause, static frame, repeating animation. This should not be used for transitions containing information.'**
  String get sponsorBlockCategoryIntroDescription;

  /// Outro block 'Outro' Category
  ///
  /// In en, this message translates to:
  /// **'Endcards/Credits'**
  String get sponsorBlockCategoryOutro;

  /// Outro block 'Outro' Category description
  ///
  /// In en, this message translates to:
  /// **'Credits or when the YouTube endcards appear. Not for conclusions with information.'**
  String get sponsorBlockCategoryOutroDescription;

  /// Sponsorblock 'Preview' Category
  ///
  /// In en, this message translates to:
  /// **'Preview/Recap'**
  String get sponsorBlockCategoryPreview;

  /// Sponsorblock 'Preview' Category description
  ///
  /// In en, this message translates to:
  /// **'Collection of clips that show what is coming up in in this video or other videos in a series where all information is repeated later in the video.'**
  String get sponsorBlockCategoryPreviewDescription;

  /// Sponsorblock 'Filler' Category
  ///
  /// In en, this message translates to:
  /// **'Filler Tangent/Jokes'**
  String get sponsorBlockCategoryFiller;

  /// Sponsorblock 'Filler' Category description
  ///
  /// In en, this message translates to:
  /// **'Tangential scenes added only for filler or humor that are not required to understand the main content of the video. This should not include segments providing context or background details. This is a very aggressive category meant for when you aren\'\'t in the mood for \"fun\".'**
  String get sponsorBlockCategoryFillerDescription;

  /// Sponsorblock 'MusicOffTopic' Category
  ///
  /// In en, this message translates to:
  /// **'Music: Non-Music Section'**
  String get sponsorBlockCategoryMusicOffTopic;

  /// Only for use in music videos. This only should be used for sections of music videos that aren't already covered by another category.
  ///
  /// In en, this message translates to:
  /// **'Only for use in music videos. This only should be used for sections of music videos that aren\'\'t already covered by another category.'**
  String get sponsorBlockCategoryMusicOffTopicDescription;

  /// label for settings switch to proxy videos from server
  ///
  /// In en, this message translates to:
  /// **'Proxy videos'**
  String get useProxy;

  /// Description for the use proxy settings
  ///
  /// In en, this message translates to:
  /// **'By proxying video streams from the server, you can bypass regional blocks or ISP blocking YouTube'**
  String get useProxyDescription;

  /// Instruction on how to show video settings when playing a video on TV
  ///
  /// In en, this message translates to:
  /// **'Press down to show settings'**
  String get pressDownToShowSettings;

  /// Name of TV ui video settings
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get quality;

  /// Name TV ui audio settings
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audio;

  /// Name of TV ui subtitles settings
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get subtitles;

  /// Name of TV ui Playback speed
  ///
  /// In en, this message translates to:
  /// **'Playback speed'**
  String get playbackSpeed;

  /// Settings name for black background
  ///
  /// In en, this message translates to:
  /// **'Black background'**
  String get blackBackground;

  /// Description for dark background setting
  ///
  /// In en, this message translates to:
  /// **'For dark theme on OLED screen'**
  String get blackBackgroundDescription;

  /// search title
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Settings label for the size of the subtitles
  ///
  /// In en, this message translates to:
  /// **'Subtitles font size'**
  String get subtitleFontSize;

  /// Settings description for subtitle size
  ///
  /// In en, this message translates to:
  /// **'Change the size of the subtitles if it is too small or too big on your device'**
  String get subtitleFontSizeDescription;

  /// Setting label to skip ssl certification verification
  ///
  /// In en, this message translates to:
  /// **'Skip SSL certificate verification'**
  String get skipSslVerification;

  /// Setting description for the skip ssl certification verification
  ///
  /// In en, this message translates to:
  /// **'For using a self-signed SSL certificate, or when having SSL related issues with your server.'**
  String get skipSslVerificationDescription;

  /// Ask the user to user dark / light / system theme
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeBrightness;

  /// Light theme
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// Dark theme
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// Follow system label
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get followSystem;

  /// Requires app restart label
  ///
  /// In en, this message translates to:
  /// **'Requires app restart'**
  String get requiresRestart;

  /// Select app language
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get appLanguage;

  /// One or more videos
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No videos} =1{1 video} other{{count} videos}}'**
  String nVideos(num count);

  /// error message for invalid custom url for return to youtube
  ///
  /// In en, this message translates to:
  /// **'Url must start with http:// or https://'**
  String get returnYoutubeUrlValidation;

  /// ReturnYoutubeDislike setting description
  ///
  /// In en, this message translates to:
  /// **'Show estimated video dislikes using API provided by returnyoutubedislike.com'**
  String get returnYoutubeDislikeDescription;

  /// title for setting to set a custom ryd instance
  ///
  /// In en, this message translates to:
  /// **'Custom RYD instance url'**
  String get rydCustomInstance;

  /// description for custom ryd instancr setting
  ///
  /// In en, this message translates to:
  /// **'Use a different RYD instance, leave empty to use the default'**
  String get rydCustomInstanceDescription;

  /// Label for settings to enable autoplay when a video loads
  ///
  /// In en, this message translates to:
  /// **'Automatically play video on load'**
  String get autoplayVideoOnLoad;

  /// Description for the autoplay video on load setting
  ///
  /// In en, this message translates to:
  /// **'Automatically start playing the video after it has loaded'**
  String get autoplayVideoOnLoadDescription;

  /// Settings label for search history
  ///
  /// In en, this message translates to:
  /// **'Search history'**
  String get searchHistory;

  /// Description for search history settings
  ///
  /// In en, this message translates to:
  /// **'Search history settings'**
  String get searchHistoryDescription;

  /// Settings label for enabling search history
  ///
  /// In en, this message translates to:
  /// **'Enable search history'**
  String get enableSearchHistory;

  /// Settings label for search history limit
  ///
  /// In en, this message translates to:
  /// **'Search history limit'**
  String get searchHistoryLimit;

  /// Settings label for search history limit description
  ///
  /// In en, this message translates to:
  /// **'Set how many previous searches will show up in suggestions'**
  String get searchHistoryLimitDescription;

  /// Youtube shorts
  ///
  /// In en, this message translates to:
  /// **'Shorts'**
  String get shorts;

  /// Filter search result by upload date
  ///
  /// In en, this message translates to:
  /// **'Upload date'**
  String get searchUploadDate;

  /// Do not filter search result by upload date
  ///
  /// In en, this message translates to:
  /// **'Any date'**
  String get searchUploadDateAny;

  /// Search for uploaded in last hour
  ///
  /// In en, this message translates to:
  /// **'Last Hour'**
  String get searchUploadDateHour;

  /// Search for uploaded today
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get searchUploadDateToday;

  /// Search for uploaded this week
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get searchUploadDateWeek;

  /// Search for uploaded this month
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get searchUploadDateMonth;

  /// Search for uploaded this year
  ///
  /// In en, this message translates to:
  /// **'This year'**
  String get searchUploadDateYear;

  /// Filter search result by duration
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get searchDuration;

  /// Do not filter search result by duration
  ///
  /// In en, this message translates to:
  /// **'Any duration'**
  String get searchDurationAny;

  /// Search for short videos only
  ///
  /// In en, this message translates to:
  /// **'Short (<4 minutes)'**
  String get searchDurationShort;

  /// Search for long videos only
  ///
  /// In en, this message translates to:
  /// **'Long (>20 minutes)'**
  String get searchDurationLong;

  /// Search for medium videos only
  ///
  /// In en, this message translates to:
  /// **'Medium (4-20 minutes)'**
  String get searchDurationMedium;

  /// Search sorting option
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get searchSortBy;

  /// Sort search by relevance
  ///
  /// In en, this message translates to:
  /// **'Relevance'**
  String get searchSortRelevance;

  /// Sort search by rating
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get searchSortRating;

  /// Sort search by upload date
  ///
  /// In en, this message translates to:
  /// **'Upload Date'**
  String get searchSortUploadDate;

  /// Sort search by view count
  ///
  /// In en, this message translates to:
  /// **'View Count'**
  String get searchSortViewCount;

  /// Settings label for clearing search history
  ///
  /// In en, this message translates to:
  /// **'Clear search history'**
  String get clearSearchHistory;

  /// Title for settings that leads to application logs
  ///
  /// In en, this message translates to:
  /// **'Application Logs'**
  String get appLogs;

  /// Description of the app log settings
  ///
  /// In en, this message translates to:
  /// **'Get logs of what is happening in the application, can be useful to report issues'**
  String get appLogsDescription;

  /// Text to copy something to clipboard
  ///
  /// In en, this message translates to:
  /// **'Copy to clipboard'**
  String get copyToClipBoard;

  /// Message to tell user that logs have been copied to the clipboard
  ///
  /// In en, this message translates to:
  /// **'Logs copied to clipboard'**
  String get logsCopied;

  /// Settings label for remembering subtitle language
  ///
  /// In en, this message translates to:
  /// **'Remember subtitles language'**
  String get rememberSubtitleLanguage;

  /// Title for video filter settings
  ///
  /// In en, this message translates to:
  /// **'Video filters'**
  String get videoFilters;

  /// One or more video filters
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No videos} =1{1 filter} other{{count} filters}}'**
  String nFilters(num count);

  /// Description on how filter work
  ///
  /// In en, this message translates to:
  /// **'Hide or Obfuscate videos from all the video feeds in the application based on the filters defined below. This allow you for example to hide sports spoilers or hide shorts from a certain channel.'**
  String get videoFiltersExplanation;

  /// Description for the main settings page
  ///
  /// In en, this message translates to:
  /// **'Define rules to filter out videos'**
  String get videoFiltersSettingTileDescriptions;

  /// Title for the sections that applies to all channels
  ///
  /// In en, this message translates to:
  /// **'All channels'**
  String get videoFilterAllChannels;

  /// Title when creating a new filter
  ///
  /// In en, this message translates to:
  /// **'Create filter'**
  String get addVideoFilter;

  /// Title when editting a filter
  ///
  /// In en, this message translates to:
  /// **'Edit filter'**
  String get editVideoFilter;

  /// Label for filter type
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get videoFilterType;

  /// Label for filter operation
  ///
  /// In en, this message translates to:
  /// **'Operation'**
  String get videoFilterOperation;

  /// Label for filter value
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get videoFilterValue;

  /// Text for save action
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Descriptive test for video filter set up
  ///
  /// In en, this message translates to:
  /// **'Select an optional channel, a filter type, operation and a value to filter OUT videos from lists. Example, type: video name, operation: contains, value: test will EXCLUDE all the videos with the word \'test\' in their name.'**
  String get videoFilterEditDescription;

  /// Optional label
  ///
  /// In en, this message translates to:
  /// **'optional'**
  String get optional;

  /// Label to hide videos
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get videoFilterHideLabel;

  /// Label to filter videos
  ///
  /// In en, this message translates to:
  /// **'Obfuscate'**
  String get videoFilterFilterLabel;

  /// Human readable description of a video filter, in this case is it for string comparison, example: Hide videos where the name of the video does not contain the following string 'test' (Do not translate text between { })
  ///
  /// In en, this message translates to:
  /// **'{hideOrFilter} videos where {type} {operation} \'\'{value}\'\'.'**
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value);

  /// Label shown on video list when it is filtered out
  ///
  /// In en, this message translates to:
  /// **'Video filtered for the following reason(s):'**
  String get videoFiltered;

  /// Label to tell user to tap to show a filtered video
  ///
  /// In en, this message translates to:
  /// **'Tap to reveal'**
  String get videoFilterTapToReveal;

  /// Label for settings to hide filtered videos
  ///
  /// In en, this message translates to:
  /// **'Hide filtered videos'**
  String get videoFilterHide;

  ///
  ///
  /// In en, this message translates to:
  /// **'By default filtered videos are not hidden but shown as obfuscated with the reason(s) why it has been filtered. This setting remove the filtered videos from lists.'**
  String get videoFilterHideDescription;

  /// Label when there are no video filters
  ///
  /// In en, this message translates to:
  /// **'No video filters, tap the \'+\' button below to start adding filters.'**
  String get videoFilterNoFilters;

  /// Label for video filter video title
  ///
  /// In en, this message translates to:
  /// **'Video title'**
  String get videoFilterTypeVideoTitle;

  /// Label for video filter channel name
  ///
  /// In en, this message translates to:
  /// **'Channel name'**
  String get videoFilterTypeChannelName;

  /// Label for video filter video length
  ///
  /// In en, this message translates to:
  /// **'Video length (seconds)'**
  String get videoFilterTypeVideoLength;

  /// Label for video filter operation Contains
  ///
  /// In en, this message translates to:
  /// **'Contains'**
  String get videoFilterOperationContains;

  /// Label for video filter operation Does not contain
  ///
  /// In en, this message translates to:
  /// **'Does not contain'**
  String get videoFilterOperationNotContain;

  /// Label for video filter operation Lower than
  ///
  /// In en, this message translates to:
  /// **'Lower than'**
  String get videoFilterOperationLowerThan;

  /// Label for video filter operation Higher than
  ///
  /// In en, this message translates to:
  /// **'Higher than'**
  String get videoFilterOperationHigherThan;

  /// A single channel
  ///
  /// In en, this message translates to:
  /// **'Channel'**
  String get channel;

  /// Label for video filter switch to allow to hide all videos from a channel
  ///
  /// In en, this message translates to:
  /// **'Filter all videos from channel'**
  String get videoFilterHideAllFromChannel;

  /// Label for whole channel filtering
  ///
  /// In en, this message translates to:
  /// **'{hideOrFilter} all videos from channel'**
  String videoFilterWholeChannel(String hideOrFilter);

  /// Settings description for remembering subtitle language
  ///
  /// In en, this message translates to:
  /// **'Automatically set subtitles to last language selected, if available'**
  String get rememberSubtitleLanguageDescription;

  /// Title to force full screen to landscape
  ///
  /// In en, this message translates to:
  /// **'Lock full screen orientation to video aspect ratio'**
  String get lockFullScreenToLandscape;

  /// Setting description for forcing video to landscape when in full screen
  ///
  /// In en, this message translates to:
  /// **'Locks the full screen orientation based on video format, landscape for wide video and portrait for portrait videos'**
  String get lockFullScreenToLandscapeDescription;

  /// Title to maximize video to fit screen
  ///
  /// In en, this message translates to:
  /// **'Maximize video to fit screen'**
  String get fillFullscreen;

  /// Setting description for filling video to screen in landscape
  ///
  /// In en, this message translates to:
  /// **'Adjusts the video to fill the entire screen in landscape mode'**
  String get fillFullscreenDescription;

  /// Setting label for remembering playback speed
  ///
  /// In en, this message translates to:
  /// **'Remember playback speed'**
  String get rememberPlaybackSpeed;

  /// Settings description for remembering playback speed
  ///
  /// In en, this message translates to:
  /// **'Automatically set playback speed to the last speed selected'**
  String get rememberPlaybackSpeedDescription;

  /// Downloads
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloads;

  /// A single download or CTA for downloading a video
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// Message when a user tries to download a video he already has
  ///
  /// In en, this message translates to:
  /// **'Video already downloaded'**
  String get videoAlreadyDownloaded;

  /// Message showing when the user goes to the download screen but there are no offline videos.
  ///
  /// In en, this message translates to:
  /// **'No downloaded videos, browse, long press on a video in a list or tap the download button on a video screen to download'**
  String get noDownloadedVideos;

  /// Button to play all downloaded videos
  ///
  /// In en, this message translates to:
  /// **'Play all'**
  String get downloadsPlayAll;

  /// Message when a video starts being downloaded
  ///
  /// In en, this message translates to:
  /// **'Video download started'**
  String get videoDownloadStarted;

  /// Shown on download manager when a download fails and prompt the user to retry
  ///
  /// In en, this message translates to:
  /// **'Download failed, tap to retry'**
  String get videoFailedDownloadRetry;

  /// Label for toggle to download audio only
  ///
  /// In en, this message translates to:
  /// **'Audio only'**
  String get videoDownloadAudioOnly;

  /// Title of manage subscriptions page
  ///
  /// In en, this message translates to:
  /// **'Manage Subscriptions'**
  String get manageSubscriptions;

  /// Message when the user has no subs
  ///
  /// In en, this message translates to:
  /// **'No subscriptions, browse videos and subscribe to any channel you like.'**
  String get noSubscriptions;

  /// Text for the unscubscribe confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'You can subscribe to this channel again later'**
  String get youCanSubscribeAgainLater;

  /// Title for dialog if a user wants to unsubscribe in the subscribtion management screen
  ///
  /// In en, this message translates to:
  /// **'Unsubscribe ?'**
  String get unSubscribeQuestion;

  /// No description provided for @clearHistoryQuestion.
  ///
  /// In en, this message translates to:
  /// **'Clear history ?'**
  String get clearHistoryQuestion;

  /// Message for dialog before clearing full viewing history
  ///
  /// In en, this message translates to:
  /// **'This will clear your viewing history of your account on the Invidious instance you use. This cannot be undone.'**
  String get clearHistoryQuestionExplanation;

  /// Message when the user visits the history tab but it's empty
  ///
  /// In en, this message translates to:
  /// **'No viewing history, watch some videos and it will appear here'**
  String get noHistory;

  /// Title of layout editor screen
  ///
  /// In en, this message translates to:
  /// **'Edit home layout'**
  String get homeLayoutEditor;

  /// Label for button to allow user to add more video sources to the home screen
  ///
  /// In en, this message translates to:
  /// **'Add video source'**
  String get layoutEditorAddVideoSource;

  /// text to explain the home layout editor
  ///
  /// In en, this message translates to:
  /// **'You can decide what to display on your home screen, you can have up to 2 small view with horizontal scrolling and one big source.'**
  String get layoutEditorExplanation;

  /// Label for Home browsing tab
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Name for user library
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// Settings label for the settings to allow the user to set up the app sections themselves
  ///
  /// In en, this message translates to:
  /// **'Customize app sections'**
  String get customizeAppLayout;

  ///
  ///
  /// In en, this message translates to:
  /// **'Select which sections you want to appear in the main app navigation bar. Click on the home icon to select which screen shows when the application starts. You can reorder the sections by dragging them around.'**
  String get customizeAppLayoutExplanation;

  /// Label for settings on customizing navigation bar style
  ///
  /// In en, this message translates to:
  /// **'Navigation bar style'**
  String get navigationBarStyle;

  /// Label always showing option for navigation bar
  ///
  /// In en, this message translates to:
  /// **'Label always showing'**
  String get navigationBarLabelAlwaysShowing;

  /// Label only showing when selected option for navigation bar
  ///
  /// In en, this message translates to:
  /// **'Label shown on selected item'**
  String get navigationBarLabelShowOnSelect;

  /// Never show label option for navigation bar
  ///
  /// In en, this message translates to:
  /// **'Never show label'**
  String get navigationBarLabelNeverShow;

  /// title for distraction free mode settings
  ///
  /// In en, this message translates to:
  /// **'Distraction free mode'**
  String get distractionFreeMode;

  /// Description for distraction free mode
  ///
  /// In en, this message translates to:
  /// **'Disable video comments and recommendations'**
  String get distractionFreeModeDescription;

  /// Short form for the word seconds
  ///
  /// In en, this message translates to:
  /// **'secs'**
  String get secondsShortForm;

  /// Label for switch to allow user to customize video filter and set days of week and time to them
  ///
  /// In en, this message translates to:
  /// **'Filter videos on given times'**
  String get videoFilterApplyDateToFilter;

  /// Title for day selection for the filter
  ///
  /// In en, this message translates to:
  /// **'Select days to apply filters'**
  String get videoFilterDayOfWeek;

  ///
  ///
  /// In en, this message translates to:
  /// **'You can selectively choose days of the week and time to which the filters apply to, for example, avoid sport events spoilers.'**
  String get videoFilterDayOfWeekDescription;

  /// Title for filter start time
  ///
  /// In en, this message translates to:
  /// **'Start time'**
  String get videoFilterStartTime;

  /// Title for filter end time
  ///
  /// In en, this message translates to:
  /// **'End time'**
  String get videoFilterEndTime;

  /// Readable text on when the filter should apply
  ///
  /// In en, this message translates to:
  /// **'Applied on {selectedDays}'**
  String videoFilterAppliedOn(String selectedDays);

  /// From word (as in 'From xx To xx')
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// To word as in 'From xx To xx')
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// Time of day range
  ///
  /// In en, this message translates to:
  /// **'From {from} to {to}'**
  String videoFilterTimeOfDayFromTo(String from, String to);

  /// Notification settings title
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Setting description for notifications
  ///
  /// In en, this message translates to:
  /// **'Enable and review what you are notified about'**
  String get notificationsDescription;

  ///
  ///
  /// In en, this message translates to:
  /// **'Runs foreground service to check and notify you on the changes you are monitoring'**
  String get enableNotificationDescriptions;

  /// Title for subscriptions notifications
  ///
  /// In en, this message translates to:
  /// **'Subscription notifications'**
  String get subscriptionNotification;

  /// Description for subscription notifications
  ///
  /// In en, this message translates to:
  /// **'Get notified of new videos from your subscription feed if you are logged in to your current instance'**
  String get subscriptionNotificationDescription;

  /// Title for the notification showing that there are new videos from the subscription feed
  ///
  /// In en, this message translates to:
  /// **'New videos from your subscriptions'**
  String get subscriptionNotificationTitle;

  /// Content for subscription notification
  ///
  /// In en, this message translates to:
  /// **'There are  {count, plural, =0{no new videos} =1{1 new video} other{{count} new videos}} in your subscription feed'**
  String subscriptionNotificationContent(num count);

  /// Title for the dialog asking the user to turn off disabling battery optimization when turning on notifications
  ///
  /// In en, this message translates to:
  /// **'Disabling battery optimization required'**
  String get askForDisableBatteryOptimizationTitle;

  /// Content for the dialog asking the user to turn off disabling battery optimization when turning on notifications
  ///
  /// In en, this message translates to:
  /// **'In order to send notification Clipious needs to run a background service. For it to run smoothly it is required that Clipious is given unrestricted battery usage, tapping ok will open the battery optimization settings.'**
  String get askForDisableBatteryOptimizationContent;

  /// If the users tries to turn on notifications for a channel but hasn't enable notifications in the app we need to turn it on for them
  ///
  /// In en, this message translates to:
  /// **'Notifications turned off'**
  String get askToEnableBackgroundServiceTitle;

  /// If the users tries to turn on notifications for a channel but hasn't enable notifications in the app we need to turn it on for them
  ///
  /// In en, this message translates to:
  /// **'To get notifications, Clipious notifications need to be enabled, press OK to enable it.'**
  String get askToEnableBackgroundServiceContent;

  /// Title for settings section in the notification settings
  ///
  /// In en, this message translates to:
  /// **'Other notifications sources (bell icons)'**
  String get otherNotifications;

  /// Title for dialog to confirm whether to delete channel notifications
  ///
  /// In en, this message translates to:
  /// **'Delete channel notification ?'**
  String get deleteChannelNotificationTitle;

  /// Title for dialog to confirm whether to delete channel notifications
  ///
  /// In en, this message translates to:
  /// **'You won\'\'t receive anymore notifications from this channel.'**
  String get deleteChannelNotificationContent;

  /// Title for dialog to confirm whether to delete playlist notifications
  ///
  /// In en, this message translates to:
  /// **'Delete playlist notification ?'**
  String get deletePlaylistNotificationTitle;

  /// Title for dialog to confirm whether to delete playlist notifications
  ///
  /// In en, this message translates to:
  /// **'You won\'\'t receive anymore notifications from this playlist.'**
  String get deletePlaylistNotificationContent;

  /// Title for the channel notifications when there are new videos
  ///
  /// In en, this message translates to:
  /// **'New videos from {channel}'**
  String channelNotificationTitle(String channel);

  /// Content for channel notification when there are new videos
  ///
  /// In en, this message translates to:
  /// **'There are {count, plural, =0{no new videos} =1{1 new video} other{{count} new videos}} from {channel}'**
  String channelNotificationContent(String channel, num count);

  /// Title for the playlist notifications when there are new videos
  ///
  /// In en, this message translates to:
  /// **'New videos in {playlist} playlist'**
  String playlistNotificationTitle(String playlist);

  /// Content for playlist notification when there are new videos
  ///
  /// In en, this message translates to:
  /// **'There are {count, plural, =0{no new videos} =1{1 new video} other{{count} new videos}} in the {playlist} playlist'**
  String playlistNotificationContent(String playlist, num count);

  /// Title for the foreground service running notification when the user wants to receive notifications
  ///
  /// In en, this message translates to:
  /// **'Video monitoring'**
  String get foregroundServiceNotificationTitle;

  /// Content for the foreground service running notification when the user wants to receive notifications
  ///
  /// In en, this message translates to:
  /// **'Will check for new videos once {hours, select, 1{per hour} 24{a day} other{every {hours} hours}}'**
  String foregroundServiceNotificationContent(String hours);

  /// Foreground service notification text when checking for new subscription videos
  ///
  /// In en, this message translates to:
  /// **'Checking subscriptions...'**
  String get foregroundServiceUpdatingSubscriptions;

  /// Foreground service notification text when checking for new playlist videos
  ///
  /// In en, this message translates to:
  /// **'Checking playlists...'**
  String get foregroundServiceUpdatingPlaylist;

  /// Foreground service notification text when checking for new channel videos
  ///
  /// In en, this message translates to:
  /// **'Checking channels...'**
  String get foregroundServiceUpdatingChannels;

  /// Title for frequency settings
  ///
  /// In en, this message translates to:
  /// **'New video check frequency'**
  String get notificationFrequencySettingsTitle;

  /// Description for frequency settings
  ///
  /// In en, this message translates to:
  /// **'How often the application will check for new videos'**
  String get notificationFrequencySettingsDescription;

  /// Short form for a number of hours going up to 1 day
  ///
  /// In en, this message translates to:
  /// **'{hours, select,  24{1d} other{{hours}h}}'**
  String notificationFrequencySliderLabel(String hours);

  /// Title for settings to set black background  for subtitles
  ///
  /// In en, this message translates to:
  /// **'Subtitles background'**
  String get subtitlesBackground;

  /// Description for settings to set black background  for subtitles
  ///
  /// In en, this message translates to:
  /// **'Adds a black background to subtitles to make them more readable'**
  String get subtitlesBackgroundDescription;

  /// User view history label
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// Description for dearrow
  ///
  /// In en, this message translates to:
  /// **'Replace click bait titles and thumbnails'**
  String get deArrowSettingDescription;

  /// Settings title for checkbox on whether the thumbnail should be replaced as well
  ///
  /// In en, this message translates to:
  /// **'Replace thumbnails'**
  String get deArrowReplaceThumbnails;

  /// Description for DeArrow setting switch
  ///
  /// In en, this message translates to:
  /// **'Replace video thumbnails in addition of the titles'**
  String get deArrowReplaceThumbnailsDescription;

  /// Warning message when the user enables DeArrow
  ///
  /// In en, this message translates to:
  /// **'Enabling DeArrow can significantly reduce the browsing speed of the app as extra http requests are needed for every single video'**
  String get deArrowWarning;

  /// title for settings sections to allow users to copy their settings as json to make debugging easier
  ///
  /// In en, this message translates to:
  /// **'Copy settings as JSON to clipboard'**
  String get copySettingsAsJson;

  ///
  ///
  /// In en, this message translates to:
  /// **'Copy the settings as JSON to help debugging if you encounter an issue with the app and decide to raise an issue'**
  String get copySettingsAsJsonDescription;

  /// category for settings related to seeking in a video
  ///
  /// In en, this message translates to:
  /// **'Seeking'**
  String get seeking;

  /// Title for the settings to set the skipping step
  ///
  /// In en, this message translates to:
  /// **'Skip forward/backward step'**
  String get skipStep;

  /// Title for the settings to set the skipping step
  ///
  /// In en, this message translates to:
  /// **'Seconds to skip on forward/backward actions'**
  String get skipStepDescription;

  /// Title for the setting to enable the exponential skipping
  ///
  /// In en, this message translates to:
  /// **'Exponential skip forward/backward'**
  String get exponentialSkip;

  /// Title for the setting to enable the exponential skipping
  ///
  /// In en, this message translates to:
  /// **'The more you skip forward, the bigger the step is.'**
  String get exponentialSkipDescription;

  /// Setting title to enable full screen on landscape orientation
  ///
  /// In en, this message translates to:
  /// **'Full screen on landscape'**
  String get fullscreenOnLandscape;

  /// Setting to enable full screen on landscape orientation
  ///
  /// In en, this message translates to:
  /// **'Switch to full screen when the device is rotated to landscape mode'**
  String get fullscreenOnLandscapeDescription;

  /// Text to show something is enabled
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// Title for settings to submit feed back through the app
  ///
  /// In en, this message translates to:
  /// **'Submit feedback'**
  String get submitFeedback;

  /// Setting tile descriptions for feedback submission
  ///
  /// In en, this message translates to:
  /// **'Found a bug or have a suggestion? Use this tool to take screenshot of the app, annotate and submit feedback'**
  String get submitFeedbackDescription;

  /// Content of dialog shown before submitting feedback to make sure the user is ok whith where the data is going
  ///
  /// In en, this message translates to:
  /// **'To submit feedback you will need a GitHub account and your screenshot will be submitted to Imgur anonymously.'**
  String get feedbackDisclaimer;

  /// Title for dialog if something goes wrong while uploading feedback screenshot
  ///
  /// In en, this message translates to:
  /// **'Error while uploading screenshot to Imgur'**
  String get feedbackScreenshotError;

  /// Sort channel videos from newest to oldest
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get channelSortByNewest;

  /// Sort channel videos from oldest to newest
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get channelSortByOldest;

  /// Sort channel videos by popularity
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get channelSortByPopular;

  /// Text when the user choose where to subscribe to a channel
  ///
  /// In en, this message translates to:
  /// **'Invidious account'**
  String get invidiousAccount;

  /// Text when the user chooses where to subscribe to a channel
  ///
  /// In en, this message translates to:
  /// **'On device'**
  String get onDeviceSubscriptions;

  /// No description provided for @both.
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get both;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @addBasicAuth.
  ///
  /// In en, this message translates to:
  /// **'Add Basic Authentication'**
  String get addBasicAuth;

  /// No description provided for @addBasicAuthExplanation.
  ///
  /// In en, this message translates to:
  /// **'If your server requires basic HTTP authentication, add the details below. These are not your invidious account details'**
  String get addBasicAuthExplanation;

  /// No description provided for @addHeader.
  ///
  /// In en, this message translates to:
  /// **'Add header'**
  String get addHeader;

  /// No description provided for @advancedConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Advanced Configuration'**
  String get advancedConfiguration;

  /// No description provided for @customHeaders.
  ///
  /// In en, this message translates to:
  /// **'Custom headers'**
  String get customHeaders;

  /// No description provided for @customHeadersExplanation.
  ///
  /// In en, this message translates to:
  /// **'Set custom headers to be sent to the invidious server'**
  String get customHeadersExplanation;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @testAndAddServer.
  ///
  /// In en, this message translates to:
  /// **'Test and add server'**
  String get testAndAddServer;

  /// No description provided for @alsoTestServerConfig.
  ///
  /// In en, this message translates to:
  /// **'Also test server configuration, like if thumbnails would display properly'**
  String get alsoTestServerConfig;

  /// No description provided for @serverAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Server already exists in settings'**
  String get serverAlreadyExists;

  /// No description provided for @wrongThumbnailConfiguration.
  ///
  /// In en, this message translates to:
  /// **'The server is reachable but is not configured properly, the video and channel thumbnails will not be displayed properly. Disable the server test configuration if you are OK with this, fix your server otherwise'**
  String get wrongThumbnailConfiguration;

  /// No description provided for @openWikiLink.
  ///
  /// In en, this message translates to:
  /// **'Open wiki for help'**
  String get openWikiLink;

  /// No description provided for @serverUnreachable.
  ///
  /// In en, this message translates to:
  /// **'Server is unreachable, or is not a valid invidious server'**
  String get serverUnreachable;

  /// No description provided for @copyToDownloadFolder.
  ///
  /// In en, this message translates to:
  /// **'Copy to download folder'**
  String get copyToDownloadFolder;

  /// No description provided for @fileCopiedToDownloadFolder.
  ///
  /// In en, this message translates to:
  /// **'File copied to download folder'**
  String get fileCopiedToDownloadFolder;

  /// No description provided for @videoDeleted.
  ///
  /// In en, this message translates to:
  /// **'Video deleted'**
  String get videoDeleted;

  /// No description provided for @sleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Sleep timer'**
  String get sleepTimer;

  /// No description provided for @stopTheVideo.
  ///
  /// In en, this message translates to:
  /// **'Stop the video'**
  String get stopTheVideo;

  /// No description provided for @stopTheVideoExplanation.
  ///
  /// In en, this message translates to:
  /// **'If enabled, the video will be closed, if disabled the video will be simply paused'**
  String get stopTheVideoExplanation;

  /// No description provided for @setTimer.
  ///
  /// In en, this message translates to:
  /// **'Set timer'**
  String get setTimer;

  /// No description provided for @cancelSleepTimer.
  ///
  /// In en, this message translates to:
  /// **'Cancel sleep timer'**
  String get cancelSleepTimer;

  /// No description provided for @premieresIn.
  ///
  /// In en, this message translates to:
  /// **'Premieres in {formattedDuration}'**
  String premieresIn(Object formattedDuration);

  /// No description provided for @screenControls.
  ///
  /// In en, this message translates to:
  /// **'Screen controls'**
  String get screenControls;

  /// No description provided for @screenControlsExplanation.
  ///
  /// In en, this message translates to:
  /// **'When watching a video in full screen, Vertically dragging from the left or the right will adjust the brightness or volume respectively'**
  String get screenControlsExplanation;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @forceTvUi.
  ///
  /// In en, this message translates to:
  /// **'Force TV interface'**
  String get forceTvUi;

  /// No description provided for @forceTvUiExplanation.
  ///
  /// In en, this message translates to:
  /// **'Force the interface to be the TV experience, can be useful for some devices that do not have the leanback system config. App restart required'**
  String get forceTvUiExplanation;

  /// No description provided for @noPublicServers.
  ///
  /// In en, this message translates to:
  /// **'No public servers are available'**
  String get noPublicServers;

  /// No description provided for @tapToSeeHow.
  ///
  /// In en, this message translates to:
  /// **'Tap to see how to host your own'**
  String get tapToSeeHow;

  /// No description provided for @referToInvidiousWebsiteForHostingInstructions.
  ///
  /// In en, this message translates to:
  /// **'Refer to Invidious website for instructions on how to host invidious'**
  String get referToInvidiousWebsiteForHostingInstructions;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'az',
        'bn',
        'ca',
        'cs',
        'de',
        'en',
        'es',
        'fa',
        'fi',
        'fr',
        'hi',
        'hu',
        'ia',
        'it',
        'ja',
        'ko',
        'ml',
        'nb',
        'nl',
        'or',
        'pa',
        'pl',
        'pt',
        'ro',
        'ru',
        'sl',
        'sv',
        'ta',
        'tr',
        'uk',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'az':
      return AppLocalizationsAz();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'hu':
      return AppLocalizationsHu();
    case 'ia':
      return AppLocalizationsIa();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ml':
      return AppLocalizationsMl();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'or':
      return AppLocalizationsOr();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sl':
      return AppLocalizationsSl();
    case 'sv':
      return AppLocalizationsSv();
    case 'ta':
      return AppLocalizationsTa();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
