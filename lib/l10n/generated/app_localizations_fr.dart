// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get subscriptions => 'Abonnements';

  @override
  String get playlists => 'Listes de lecture';

  @override
  String get popular => 'Populaires';

  @override
  String get trending => 'Tendances';

  @override
  String get noVideoInPlayList => 'Aucune vidéo dans la liste de lecture';

  @override
  String get removeFromPlayList => 'Retirer de la liste de lecture';

  @override
  String get deletePlayListQ => 'Supprimer la liste de lecture ?';

  @override
  String get irreversibleAction => 'Cette action est irréversible';

  @override
  String get addPlayList => 'Ajouter une liste de lecture';

  @override
  String get playListName => 'Nom de la liste de lecture';

  @override
  String get playlistVisibility => 'Visibilité';

  @override
  String get publicPlaylist => 'Publique';

  @override
  String get privatePlaylist => 'Privée';

  @override
  String get cancel => 'Annuler';

  @override
  String get add => 'Ajouter';

  @override
  String get unlistedPlaylist => 'Non listée';

  @override
  String get info => 'Infos';

  @override
  String get videos => 'Vidéos';

  @override
  String get streams => 'Live';

  @override
  String get latestVideos => 'Dernières vidéos';

  @override
  String get subscribed => 'Abonnés';

  @override
  String get subscribe => 'S’abonner';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Aucun abonné',
        'other': '$count abonnés',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Partager';

  @override
  String get shareYoutubeLink => 'Partager le lien YouTube';

  @override
  String get shareInvidiousLink => 'Partager le lien Invidious';

  @override
  String get redirectInvidiousLink =>
      'Partager le lien de redirection Invidious';

  @override
  String get shareLinkWithTimestamp => 'Ajouter l\'horodatage';

  @override
  String get ok => 'D\'accord';

  @override
  String get noChannels => 'Aucune chaîne';

  @override
  String get noPlaylists => 'Aucune liste de lecture';

  @override
  String get channels => 'Chaînes';

  @override
  String get couldntLoadVideo => 'Impossible de charger la vidéo';

  @override
  String get comments => 'Commentaires';

  @override
  String get recommended => 'Recommandé';

  @override
  String get couldntFetchVideos =>
      'Impossible de récupérer les vidéos. Appuyez pour réessayer.';

  @override
  String get wizardIntro =>
      'Sélectionnez un serveur public ou ajoutez le vôtre. (Peut être modifié plus tard dans les paramètres.)';

  @override
  String get startUsingClipious => 'Commencer à utiliser Clipious';

  @override
  String get videoAddedToPlaylist => 'Vidéo ajoutée à la liste de lecture';

  @override
  String get videoAddedToQueue => 'Vidéo ajoutée à la file';

  @override
  String get errorAddingVideoToPlaylist =>
      'Erreur lors de l’ajout de la vidéo à la liste de lecture';

  @override
  String get itemlistErrorGeneric => 'Impossible d\'obtenir les données';

  @override
  String get itemListErrorInvalidScope =>
      'Vous n\'avez pas l\'autorisation de voir ceci, si vous vous êtes connecté·e en utilisant la méthode du jeton, essayez de vous déconnecter et de vous reconnecter';

  @override
  String get selectPlaylist => 'Sélectionner la liste de lecture';

  @override
  String get createNewPlaylist => 'Créer une nouvelle liste de lecture';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString réponses',
      one: '1 réponse',
      zero: 'Aucune réponse',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Charger plus';

  @override
  String get topSorting => 'Palmarès';

  @override
  String get newSorting => 'Nouveau';

  @override
  String get streamIsLive => 'En direct';

  @override
  String get sponsorSkipped => 'Sponsor ignoré';

  @override
  String get selectBrowsingCountry => 'Sélectionnez le pays de navigation';

  @override
  String get showOnStart =>
      'Sélectionnez ce qui doit être affiché au démarrage de l’application';

  @override
  String get settings => 'Paramètres';

  @override
  String get browsing => 'Navigation';

  @override
  String get country => 'Pays';

  @override
  String get whenAppStartsShow => 'Quand l’application démarre, afficher…';

  @override
  String get servers => 'Serveurs';

  @override
  String get manageServers => 'Gérer les serveurs';

  @override
  String currentServer(String current) {
    return 'Utilisation actuelle : $current';
  }

  @override
  String get useSponsorBlock => 'Utiliser SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'Sauter les segments des sponsors soumis par la communauté';

  @override
  String get about => 'À propos';

  @override
  String get name => 'Nom';

  @override
  String get package => 'Package';

  @override
  String get version => 'Version';

  @override
  String get build => 'Compilation';

  @override
  String get addServer => 'Ajouter un serveur';

  @override
  String get useThisServer => 'Utiliser ce serveur';

  @override
  String get logIn => 'Se connecter';

  @override
  String get delete => 'Supprimer';

  @override
  String get invalidInvidiousServer => 'Serveur Invidious invalide';

  @override
  String get yourServers => 'Vos serveurs';

  @override
  String get loggedIn => 'Connecté·e';

  @override
  String get notLoggedIn => 'Non connecté·e';

  @override
  String get addServerHelpText =>
      'Utilisez le bouton + pour ajouter vos propres serveurs ou appuyez sur un serveur public pour l’ajouter.';

  @override
  String get publicServers => 'Serveurs publics';

  @override
  String get loadingPublicServer => 'Chargement des serveurs publics';

  @override
  String get tapToAddServer => 'Appuyez pour ajouter un serveur à votre liste';

  @override
  String get publicServersError =>
      'Impossible de récupérer la liste des serveurs publics. Appuyez pour réessayer.';

  @override
  String get appearance => 'Apparence';

  @override
  String get useDynamicTheme => 'Couleurs dynamiques';

  @override
  String get useDynamicThemeDescription =>
      'Utilisez les couleurs de Material You (disponible uniquement sur Android 12+)';

  @override
  String get useDash => 'Utiliser DASH';

  @override
  String get useDashDescription =>
      'La diffusion en flux adaptative DASH peut parfois être problématique, YouTube peut en limiter la vitesse.';

  @override
  String get videoPlayer => 'Lecteur vidéo';

  @override
  String get videoListed => 'Publique';

  @override
  String get videoUnlisted => 'Non listée';

  @override
  String get videoIsFamilyFriendly => 'Adaptée aux familles';

  @override
  String get tapToManage => 'Appuyez pour gérer';

  @override
  String get authentication => 'Authentification';

  @override
  String get tokenLogin => 'Se connecter avec un jeton';

  @override
  String get tokenLoginDescription => 'Méthode recommandée pour se connecter';

  @override
  String get cookieLogin => 'Se connecter avec un cookie';

  @override
  String get cookieLoginDescription =>
      'Utilisez cette méthode si vous rencontrez des problèmes avec l\'authentification par jeton';

  @override
  String get logout => 'Se déconnecter';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get password => 'Mot de passe';

  @override
  String get wrongUsernamePassword =>
      'Nom d\'utilisateur ou mot de passe incorrect';

  @override
  String get error => 'Erreur';

  @override
  String get malformedStatsEndpoint =>
      '/api/v1/stats ne répond pas correctement';

  @override
  String get malformedStatsEndpointDescription =>
      'La récupération de stats du serveur a retourné une valeur incorrecte, la clé « software.name » devrait être égale à « invidious ».\nRéponse du serveur :';

  @override
  String get serverIsNotReachable => 'Le serveur est injoignable';

  @override
  String get videoQueue => 'File d\'attente';

  @override
  String get addToQueueList => 'Ajouter à la file d\'attente';

  @override
  String get addToPlaylist => 'Ajouter à la liste de lecture';

  @override
  String get playNext => 'Suivant';

  @override
  String get playNextAddedToQueue => 'La vidéo sera lue juste après';

  @override
  String get addRecommendedToQueue =>
      'Lecture automatique du contenu recommandé';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Sélectionnez les types de segments à passer';

  @override
  String get sponsorBlockCategorySponsor => 'Sponsor';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Promotion rémunérée, parrainage rémunéré et publicité directe. Ne concerne pas l\'autopromotion ou le partage gratuit de causes, créateurices, sites web ou produits appréciés.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo =>
      'Non rémunéré/autopromotion';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Semblable aux « sponsor », excepté pour la promotion non rémunérée ou l\'autopromotion. Cela inclut les marchandises, les dons et les informations sur leurs collaborateurs. ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Rappel d\'interaction (abonnement)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Bref rappel d\'aimer la vidéo ou de s\'abonner à la chaîne au milieu de la vidéo. Si le message est long ou porte sur quelque chose de précis, classez plutôt le segment comme autopromotion.';

  @override
  String get sponsorBlockCategoryIntro => 'Entracte/Animation d\'introduction';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Un intervalle sans réel contenu, par exemple une pause, une image statique ou une animation répétitive. N\'utilisez pas cette catégorie pour les transitions contenant de l\'information.';

  @override
  String get sponsorBlockCategoryOutro => 'Écrans de fin/Crédits';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Crédits ou écran de fin YouTube. Pas pour les conclusions contenant des informations.';

  @override
  String get sponsorBlockCategoryPreview => 'Aperçu/Résumé';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Collection de clips qui montrent ce qui se passe dans cette vidéo ou d\'autres vidéos d\'une série où toutes les informations sont répétées plus tard dans la vidéo.';

  @override
  String get sponsorBlockCategoryFiller => 'Digressions/Blagues';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Digressions ajoutées uniquement dans un but de remplissage ou de l\'humour non requis pour comprendre le sujet principal de la vidéo. Ne dois pas inclure des segments fournissant du contexte ou des détails de fond. Il s\'agit d\'une catégorie très agressive destinée aux moments qui ne sont pas « pour le fun ».';

  @override
  String get sponsorBlockCategoryMusicOffTopic =>
      'Musique : Segment non musical';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'À utiliser seulement dans les vidéos de musique. Il doit être uniquement utilisé pour les sections qui ne sont pas couvertes par une autre catégorie plus spécifique.';

  @override
  String get useProxy => 'Utiliser le serveur comme proxy';

  @override
  String get useProxyDescription =>
      'En utilisant le serveur comme proxy, vous pouvez contourner les blocages régionaux ou les FAI bloquant YouTube';

  @override
  String get pressDownToShowSettings =>
      'Appuyez vers le bas pour afficher les paramètres';

  @override
  String get quality => 'Qualité';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Sous-titres';

  @override
  String get playbackSpeed => 'Vitesse de lecture';

  @override
  String get blackBackground => 'Fond noir pur';

  @override
  String get blackBackgroundDescription => 'Pour thème sombre sur écran OLED';

  @override
  String get search => 'Recherche';

  @override
  String get subtitleFontSize => 'Taille des sous-titres';

  @override
  String get subtitleFontSizeDescription =>
      'Modifie la taille des sous-titres si elle est trop petite ou trop grande sur votre appareil';

  @override
  String get skipSslVerification => 'Ignorer la vérification du certificat SSL';

  @override
  String get skipSslVerificationDescription =>
      'Pour utiliser un certificat SSL autosigné ou en cas d\'erreur serveur liée à SSL.';

  @override
  String get themeBrightness => 'Thème';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get followSystem => 'Système';

  @override
  String get requiresRestart => 'Nécessite un redémarrage';

  @override
  String get appLanguage => 'Langue';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString vidéos',
      one: '1 vidéo',
      zero: 'Aucune vidéo',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'L\'URL doit commencer par http:// ou https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Afficher les « Je n\'aime pas » estimés à l\'aide de l\'API fournie par returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'URL d\'une instance RYD personalisée';

  @override
  String get rydCustomInstanceDescription =>
      'Utiliser une instance de RYD différente, laissez vide pour utiliser l\'instance par défaut';

  @override
  String get autoplayVideoOnLoad =>
      'Lire automatiquement la vidéo au chargement';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Commencer la lecture automatique de la vidéo après chargement';

  @override
  String get searchHistory => 'Historique de recherche';

  @override
  String get searchHistoryDescription =>
      'Réglages de l\'historique de recherche';

  @override
  String get enableSearchHistory => 'Activer l\'historique de recherches';

  @override
  String get searchHistoryLimit => 'Limite de l\'historique de recherches';

  @override
  String get searchHistoryLimitDescription =>
      'Définir combien de recherches précédentes doivent être incluses dans les suggestions';

  @override
  String get shorts => 'Shorts';

  @override
  String get searchUploadDate => 'Date de mise en ligne';

  @override
  String get searchUploadDateAny => 'N\'importe quand';

  @override
  String get searchUploadDateHour => 'Dernière heure';

  @override
  String get searchUploadDateToday => 'Aujourd\'hui';

  @override
  String get searchUploadDateWeek => 'Cette semaine';

  @override
  String get searchUploadDateMonth => 'Ce mois-ci';

  @override
  String get searchUploadDateYear => 'Cette année';

  @override
  String get searchDuration => 'Durée';

  @override
  String get searchDurationAny => 'Toute durée';

  @override
  String get searchDurationShort => 'Courtes (<4 minutes)';

  @override
  String get searchDurationLong => 'Longues (>20 minutes)';

  @override
  String get searchDurationMedium => 'Moyennes (4-20 minutes)';

  @override
  String get searchSortBy => 'Trier par';

  @override
  String get searchSortRelevance => 'Pertinence';

  @override
  String get searchSortRating => 'Avis';

  @override
  String get searchSortUploadDate => 'Date de mise en ligne';

  @override
  String get searchSortViewCount => 'Nombre de vues';

  @override
  String get clearSearchHistory => 'Effacer l\'historique de recherche';

  @override
  String get appLogs => 'Journaux d\'application';

  @override
  String get appLogsDescription =>
      'Obtenir les registres de ce qui se passe dans l\'application, peut être utile pour signaler les problèmes';

  @override
  String get copyToClipBoard => 'Copier dans le presse-papier';

  @override
  String get logsCopied => 'Registres copiés dans le presse-papier';

  @override
  String get rememberSubtitleLanguage => 'Mémoriser la langue des sous-titres';

  @override
  String get videoFilters => 'Filtres de vidéo';

  @override
  String nFilters(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString filtres',
      one: '1 filtre',
      zero: 'Aucune vidéo',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'Masquer ou flouter les contenus de tous les flux vidéo de l\'application en fonction des filtres définis ci-dessous. Cela vous permet par exemple de masquer des résultats sportifs ou les shorts d\'une certaine chaîne.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Définir des règles pour filtrer les vidéos';

  @override
  String get videoFilterAllChannels => 'Toutes les chaînes';

  @override
  String get addVideoFilter => 'Créer un filtre';

  @override
  String get editVideoFilter => 'Modifier le filtre';

  @override
  String get videoFilterType => 'Type';

  @override
  String get videoFilterOperation => 'Opération';

  @override
  String get videoFilterValue => 'Valeur';

  @override
  String get save => 'Sauvegarder';

  @override
  String get videoFilterEditDescription =>
      'Sélectionnez une chaîne optionnelle, un type de filtre, une opération et une valeur pour filtrer les vidéos des listes. Exemple : \"type : nom de la vidéo, opération : contient, valeur : test\" va EXCLURE toutes les vidéos avec le mot « test » dans leur nom.';

  @override
  String get optional => 'Optionnel';

  @override
  String get videoFilterHideLabel => 'Cacher';

  @override
  String get videoFilterFilterLabel => 'Flouter';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter les vidéos où $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered =>
      'Vidéo filtrée pour la/les raison(s) suivante(s) :';

  @override
  String get videoFilterTapToReveal => 'Appuyez pour révéler';

  @override
  String get videoFilterHide => 'Cacher les vidéos filtrées';

  @override
  String get videoFilterHideDescription =>
      'Par défaut, les vidéos filtrées ne sont pas masquées mais floutées avec la ou les raisons pour lesquelles elles ont été filtrées. Ce paramètre supprime les vidéos filtrées des listes.';

  @override
  String get videoFilterNoFilters =>
      'Pas de filtres vidéo, appuyez sur le bouton \'+\' ci-dessous pour ajouter des filtres.';

  @override
  String get videoFilterTypeVideoTitle => 'Titre de la vidéo';

  @override
  String get videoFilterTypeChannelName => 'Nom de la chaîne';

  @override
  String get videoFilterTypeVideoLength => 'Longueur de la vidéo (secondes)';

  @override
  String get videoFilterOperationContains => 'Contient';

  @override
  String get videoFilterOperationNotContain => 'Ne contient pas';

  @override
  String get videoFilterOperationLowerThan => 'Plus petit que';

  @override
  String get videoFilterOperationHigherThan => 'Plus grand que';

  @override
  String get channel => 'Chaîne';

  @override
  String get videoFilterHideAllFromChannel =>
      'Filtrer toutes les vidéos de la chaîne';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter toutes les vidéos de la chaîne';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Définir automatiquement les sous-titres sur la dernière langue séléctionée, si disponible';

  @override
  String get lockFullScreenToLandscape =>
      'Verrouiller l\'orientation plein écran sur le rapport hauteur/largeur de la vidéo';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Verrouille l\'orientation plein écran en fonction du format vidéo, paysage pour les vidéos larges et portrait pour les vidéos portrait';

  @override
  String get fillFullscreen =>
      'Maximiser la vidéo pour la grandeur de l\'écran';

  @override
  String get fillFullscreenDescription =>
      'Ajuste la vidéo pour remplir tout l\'écran en mode paysage';

  @override
  String get rememberPlaybackSpeed => 'Mémoriser la vitesse de lecture';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Régler automatiquement la vitesse de lecture sur la dernière vitesse sélectionnée';

  @override
  String get downloads => 'Téléchargements';

  @override
  String get download => 'Téléchargement';

  @override
  String get videoAlreadyDownloaded => 'Vidéo déjà téléchargée';

  @override
  String get noDownloadedVideos =>
      'Aucune vidéo téléchargée, naviguez, appuyez sur une vidéo dans une liste ou appuyez sur le bouton de téléchargement sur un écran vidéo pour télécharger';

  @override
  String get downloadsPlayAll => 'Tout lire';

  @override
  String get videoDownloadStarted => 'Le téléchargement de la vidéo a commencé';

  @override
  String get videoFailedDownloadRetry =>
      'Le téléchargement a échoué, appuyez pour réessayer';

  @override
  String get videoDownloadAudioOnly => 'Audio seulement';

  @override
  String get manageSubscriptions => 'Gérer les abonnements';

  @override
  String get noSubscriptions =>
      'Aucun abonnement, parcourez les vidéos et abonnez-vous à la chaîne de votre choix.';

  @override
  String get youCanSubscribeAgainLater =>
      'Vous pouvez vous réabonner à cette chaîne plus tard';

  @override
  String get unSubscribeQuestion => 'Se désabonner ?';

  @override
  String get clearHistoryQuestion => 'Effacer l\'historique ?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Cette opération effacera l\'historique de consultation de votre compte sur l\'instance Invidious que vous utilisez. Cette opération ne peut pas être annulée.';

  @override
  String get noHistory =>
      'Aucun historique de visionnage, regardez quelques vidéos et il apparaîtra ici';

  @override
  String get homeLayoutEditor => 'Modifier la disposition de l\'accueil';

  @override
  String get layoutEditorAddVideoSource => 'Ajouter une source de vidéos';

  @override
  String get layoutEditorExplanation =>
      'Vous pouvez décider ce qui s\'affiche sur la page principale, vous pouvez avoir jusqu\'à 2 petits aperçus avec défilement horizontal et 1 grand aperçu.';

  @override
  String get home => 'Accueil';

  @override
  String get library => 'Bibliothèque';

  @override
  String get customizeAppLayout => 'Personnaliser les sections de l\'appli';

  @override
  String get customizeAppLayoutExplanation =>
      'Sélectionnez quels icônes apparaissent dans la barre de navigation. Cliquez sur le bouton « Accueil » pour sélectionner quel page s\'ouvre quand l\'application démarre. Vous pouvez réordonné les section par glisser-déposer.';

  @override
  String get navigationBarStyle => 'Style de la barre de navigation';

  @override
  String get navigationBarLabelAlwaysShowing => 'Toujours afficher les labels';

  @override
  String get navigationBarLabelShowOnSelect =>
      'Afficher le label sur l\'élément sélectionné';

  @override
  String get navigationBarLabelNeverShow => 'Ne jamais afficher le label';

  @override
  String get distractionFreeMode => 'Mode sans distraction';

  @override
  String get distractionFreeModeDescription =>
      'Désactiver les commentaires et les recommandations de vidéos';

  @override
  String get secondsShortForm => 's';

  @override
  String get videoFilterApplyDateToFilter =>
      'Filtrer les vidéos sur les temps donnés';

  @override
  String get videoFilterDayOfWeek =>
      'Sélectionnez les jours pour appliquer les filtres';

  @override
  String get videoFilterDayOfWeekDescription =>
      'Vous pouvez choisir sélectivement les jours de la semaine et le temps auquel les filtres sappliquent, par exemple, éviter les divulgâchis dévènements sportifs.';

  @override
  String get videoFilterStartTime => 'Heure de début';

  @override
  String get videoFilterEndTime => 'Heure de fin';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Appliqué au(x) $selectedDays';
  }

  @override
  String get from => 'De';

  @override
  String get to => 'À';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'De $from à $to';
  }

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsDescription =>
      'Activer et examiner les notifications';

  @override
  String get enableNotificationDescriptions =>
      'Exécute le service en premier plan pour vérifier et vous informer des changements que vous surveillez';

  @override
  String get subscriptionNotification => 'Notifications d\'abonnement';

  @override
  String get subscriptionNotificationDescription =>
      'Soyez informé·e des nouvelles vidéos de votre flux d\'abonnement si vous êtes connecté·e à votre instance actuelle';

  @override
  String get subscriptionNotificationTitle =>
      'Nouvelles vidéos de vos abonnements';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'y a $countString nouvelles vidéos',
      one: 'y a 1 nouvelle vidéo',
      zero: 'n\'y a aucune nouvelle vidéo',
    );
    return 'Il $_temp0 dans votre flux d\'abonnement';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'La désactivation de l\'optimisation de la batterie est requise';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'Pour pouvoir envoyer des notifications, Clipious doit exécuter un service en arrière-plan. Pour être exécuté sans problème, il est requis pour Clipious d\'avoir accés a l\'utilisation de la batterie sans restriction. Appuyer sur ok va ouvrir les paramètres d\'optimisation de la batterie.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Notifications désactivées';

  @override
  String get askToEnableBackgroundServiceContent =>
      'Pour avoir les notifications, les notifications Clipious doivent être activées, appuyez sur OK pour les activer.';

  @override
  String get otherNotifications =>
      'Autres sources de notifications (icônes de la cloche)';

  @override
  String get deleteChannelNotificationTitle =>
      'Supprimer les notifications de la chaîne ?';

  @override
  String get deleteChannelNotificationContent =>
      'Vous ne recevrez plus de notifications depuis cette chaîne.';

  @override
  String get deletePlaylistNotificationTitle =>
      'Supprimer les notifications de la liste de lecture ?';

  @override
  String get deletePlaylistNotificationContent =>
      'Vous ne receverez plus de notifications de cette liste de lecture.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Nouvelles vidéos de $channel';
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
      other: 'y a $countString nouvelles vidéos',
      one: 'y a 1 nouvelle vidéo',
      zero: 'n\'y a aucune nouvelle vidéo',
    );
    return 'Il $_temp0 de $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'Nouvelles vidéos dans la liste de lecture $playlist';
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
      other: '$countString nouvelles vidéos',
      one: 'y a 1 nouvelle vidéo',
      zero: 'n\'y a aucune nouvelle vidéo',
    );
    return 'Il $_temp0 sur la liste de lecture $playlist';
  }

  @override
  String get foregroundServiceNotificationTitle => 'Suivi des vidéos';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'par heure',
        '24': 'par jour',
        'other': 'chaque $hours heures',
      },
    );
    return 'Va vérifier pour une nouvelle vidéo une fois $_temp0';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'Vérification des abonnements...';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'Vérification des listes de lecture...';

  @override
  String get foregroundServiceUpdatingChannels => 'Vérification des chaînes...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Fréquence de vérification de nouvelle vidéo';

  @override
  String get notificationFrequencySettingsDescription =>
      'Avec quelle récurrence l\'application cherchera de nouvelles vidéos';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '1j',
        'other': '${hours}h',
      },
    );
    return '$_temp0';
  }

  @override
  String get subtitlesBackground => 'Arrière plan des sous-titres';

  @override
  String get subtitlesBackgroundDescription =>
      'Ajoute un arrière-plan noir aux sous-titres pour les rendre plus lisibles';

  @override
  String get history => 'Historique';

  @override
  String get deArrowSettingDescription =>
      'Remplacer les titres et les vignettes pièges à clics';

  @override
  String get deArrowReplaceThumbnails => 'Remplacer les vignettes';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Remplacer les vignettes des vidéos, ainsi que les titres';

  @override
  String get deArrowWarning =>
      'Activer DeArrow peut réduire significativement la vitesse de navigation de l\'application car des requêtes http supplémentaires sont nécessaires pour chaque vidéo';

  @override
  String get copySettingsAsJson =>
      'Copier les paramètres en JSON au presse-papiers';

  @override
  String get copySettingsAsJsonDescription =>
      'Copier les paramètres en JSON pour aider à débugger si vous rencontrez un problème avec l\'application et décider de soulever un problème';

  @override
  String get seeking => 'Chercher';

  @override
  String get skipStep => 'Pas d\'avancement/de recul';

  @override
  String get skipStepDescription =>
      'Secondes à sauter lors d\'une action d\'avancement/de recul';

  @override
  String get exponentialSkip => 'Avancer/Reculer exponentiellement';

  @override
  String get exponentialSkipDescription =>
      'Plus vous sautez en avant, plus le saut est important.';

  @override
  String get fullscreenOnLandscape => 'Plein écran en mode paysage';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Basculez en plein écran quand l\'appareil est tourné à l\'horizontal';

  @override
  String get enabled => 'Autorisé';

  @override
  String get submitFeedback => 'Envoyer un retour';

  @override
  String get submitFeedbackDescription =>
      'Vous avez trouvé un bug ou avez une suggestion ? Utilisez cet outil pour prendre une capture d\'écran de l\'application, l\'annoter, et envoyer un retour';

  @override
  String get feedbackDisclaimer =>
      'Pour envoyer un retour, vous aurez besoin d\'un compte GitHub et votre capture d\'écran sera envoyé par Imgur anonymement.';

  @override
  String get feedbackScreenshotError =>
      'Erreur lors du chargement de la capture d\'écran vers Imgur';

  @override
  String get channelSortByNewest => 'Les plus récentes';

  @override
  String get channelSortByOldest => 'Les plus anciennes';

  @override
  String get channelSortByPopular => 'Populaire';

  @override
  String get invidiousAccount => 'Compte Invidious';

  @override
  String get onDeviceSubscriptions => 'Sur l\'appareil';

  @override
  String get both => 'Les deux';

  @override
  String get refresh => 'Actualiser';

  @override
  String get addBasicAuth => 'ajouter une méthode d\'autentification basique';

  @override
  String get addBasicAuthExplanation =>
      'Si votre serveur nécessite une connexion basique en HTTP, ajoutez les détailles ci-dessous. Ces derniers ne sont pas vos identifications de connexion Invidious';

  @override
  String get addHeader => 'Ajouter un header';

  @override
  String get advancedConfiguration => 'Configuration Avancée';

  @override
  String get customHeaders => 'Header personnalisé';

  @override
  String get customHeadersExplanation =>
      'modifiez les Headers qui seront envoyées au serveur Invidious';

  @override
  String get value => 'Valeur';

  @override
  String get testAndAddServer => 'vérifier et ajouter le serveur';

  @override
  String get alsoTestServerConfig =>
      'Tester la configuration du serveur. Exemple si les miniatures seront chargé proprement';

  @override
  String get serverAlreadyExists =>
      'Ce serveur existe déjà dans les paramètres';

  @override
  String get wrongThumbnailConfiguration =>
      'Le serveur est joignable mais mal configurée, les vidéos ainsi que les photo de profile des chaînes risquent de ne pas apparaitre proprement. Désactivez le test de la configuration si cela vous convient, sinon réglez le serveur';

  @override
  String get openWikiLink => 'Ouvrir le Wiki pour avoir de l\'aide';

  @override
  String get serverUnreachable =>
      'Le serveur nest pas joignable, ou ceci nest pas un serveur invidious valide';

  @override
  String get copyToDownloadFolder =>
      'Copier vers le dossier des Téléchargement';

  @override
  String get fileCopiedToDownloadFolder =>
      'Fichier a bien été copier vers le dossier de téléchargement';

  @override
  String get videoDeleted => 'La vidéo a été supprimer';

  @override
  String get sleepTimer => 'Minuteur';

  @override
  String get stopTheVideo => 'Arrêter la vidéo';

  @override
  String get stopTheVideoExplanation =>
      'Si ceci est activée, la vidéo sera fermée, si ceci est désactivée, la vidéo sera simplement interrompue';

  @override
  String get setTimer => 'Définir un minuteur';

  @override
  String get cancelSleepTimer => 'Annuler le minuteur';

  @override
  String premieresIn(Object formattedDuration) {
    return 'Première dans $formattedDuration';
  }

  @override
  String get screenControls => 'Contrôles de l\'écran';

  @override
  String get screenControlsExplanation =>
      'En regardant une vidéo en plein écran, glisser verticalement de la gauche ou de la droite ajustera la luminosité ou le volume respectivement';

  @override
  String get retry => 'Réessayer';

  @override
  String get forceTvUi => 'Forcer l\'interface TV';

  @override
  String get forceTvUiExplanation =>
      'Forcer l\'interface pour être l\'expérience TV, peut être utile pour certains appareils qui n\'ont pas la configuration du système. Nécessite un redémarrage de l\'appli';

  @override
  String get noPublicServers => 'Aucun serveur public n\'est disponible';

  @override
  String get tapToSeeHow => 'Appuyez pour voir comment héberger le vôtre';

  @override
  String get referToInvidiousWebsiteForHostingInstructions =>
      'Consultez le site Invidious pour obtenir des instructions sur la façon d\'héberger Invidious';
}
