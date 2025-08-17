// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get subscriptions => 'Suscripciones';

  @override
  String get playlists => 'Listas de reproducción';

  @override
  String get popular => 'Populares';

  @override
  String get trending => 'Tendencias';

  @override
  String get noVideoInPlayList => 'No hay video en la lista de reproducción';

  @override
  String get removeFromPlayList => 'Eliminar de la lista de reproducción';

  @override
  String get deletePlayListQ => '¿Eliminar lista de reproducción?';

  @override
  String get irreversibleAction => 'Esta acción es irreversible';

  @override
  String get addPlayList => 'Agregar lista de reproducción';

  @override
  String get playListName => 'Nombre de la lista de reproducción';

  @override
  String get playlistVisibility => 'Visibilidad';

  @override
  String get publicPlaylist => 'Público';

  @override
  String get privatePlaylist => 'Privado';

  @override
  String get cancel => 'Cancelar';

  @override
  String get add => 'Añadir';

  @override
  String get unlistedPlaylist => 'No incluido en listado';

  @override
  String get info => 'Información';

  @override
  String get videos => 'Vídeos';

  @override
  String get streams => 'Flujos';

  @override
  String get latestVideos => 'Últimos vídeos';

  @override
  String get subscribed => 'Suscrito';

  @override
  String get subscribe => 'Suscribirse';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Sin suscriptores',
        'other': '$count Suscriptores',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Compartir';

  @override
  String get shareYoutubeLink => 'Compartir enlace de YouTube';

  @override
  String get shareInvidiousLink => 'Compartir enlace de Invidious';

  @override
  String get redirectInvidiousLink =>
      'Compartir el enlace de directo de Invidious';

  @override
  String get shareLinkWithTimestamp => 'Agregar marca de tiempo';

  @override
  String get ok => 'Ok';

  @override
  String get noChannels => 'No hay canales';

  @override
  String get noPlaylists => 'No hay listas de reproducción';

  @override
  String get channels => 'Canales';

  @override
  String get couldntLoadVideo => 'No se pudo cargar el video';

  @override
  String get comments => 'Comentarios';

  @override
  String get recommended => 'Recomendado';

  @override
  String get couldntFetchVideos =>
      'No se pudieron recuperar los videos. Toca para volver a intentarlo.';

  @override
  String get wizardIntro =>
      'Selecciona un servidor público o agrega uno propio. (Se puede cambiar más tarde en la configuración)';

  @override
  String get startUsingClipious => 'Empieza a usar Clipious';

  @override
  String get videoAddedToPlaylist => 'Vídeo añadido a la lista de reproducción';

  @override
  String get videoAddedToQueue => 'Vídeo añadido a la cola';

  @override
  String get errorAddingVideoToPlaylist =>
      'Error al agregar video a la lista de reproducción';

  @override
  String get itemlistErrorGeneric => 'No se han podido recuperar los datos';

  @override
  String get itemListErrorInvalidScope =>
      'No tienes permiso para ver esto, si has entrado usando el método del token intenta salir y entrar de nuevo';

  @override
  String get selectPlaylist => 'Seleccionar lista de reproducción';

  @override
  String get createNewPlaylist => 'Crear nueva lista de reproducción';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Respuestas',
      one: '1 Respuesta',
      zero: 'Sin respuestas',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Cargar más';

  @override
  String get topSorting => 'Popularidad';

  @override
  String get newSorting => 'Nuevo';

  @override
  String get streamIsLive => 'En vivo';

  @override
  String get sponsorSkipped => 'Patrocinador omitido';

  @override
  String get selectBrowsingCountry => 'Seleccionar país de navegación';

  @override
  String get showOnStart =>
      'Seleccione qué mostrar cuando se inicia la aplicación';

  @override
  String get settings => 'Ajustes';

  @override
  String get browsing => 'Navegación';

  @override
  String get country => 'País';

  @override
  String get whenAppStartsShow => 'Cuando se inicie la aplicación, muestra…';

  @override
  String get servers => 'Servidores';

  @override
  String get manageServers => 'Administrar servidores';

  @override
  String currentServer(String current) {
    return '$current se está utilizando actualmente';
  }

  @override
  String get useSponsorBlock => 'Usar SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'Omitir segmentos de patrocinadores enviados por la comunidad';

  @override
  String get about => 'Acerca de';

  @override
  String get name => 'Nombre';

  @override
  String get package => 'Paquete';

  @override
  String get version => 'Versión';

  @override
  String get build => 'Compilacion';

  @override
  String get addServer => 'Agregar servidor';

  @override
  String get useThisServer => 'Usa este servidor';

  @override
  String get logIn => 'Iniciar sesión';

  @override
  String get delete => 'Borrar';

  @override
  String get invalidInvidiousServer => 'Servidor de Invidious no válido';

  @override
  String get yourServers => 'Tus servidores';

  @override
  String get loggedIn => 'Conectado';

  @override
  String get notLoggedIn => 'Sin iniciar sesión';

  @override
  String get addServerHelpText =>
      'Use el botón + para agregar sus propios servidores o toque un servidor público y agréguelo.';

  @override
  String get publicServers => 'Servidores públicos';

  @override
  String get loadingPublicServer => 'Cargando servidores públicos';

  @override
  String get tapToAddServer => 'Toque para agregar un servidor a su lista';

  @override
  String get publicServersError =>
      'No se pudo obtener la lista de servidores públicos. Toca para volver a intentarlo.';

  @override
  String get appearance => 'Apariencia';

  @override
  String get useDynamicTheme => 'Colores dinámicos';

  @override
  String get useDynamicThemeDescription =>
      'Usa los colores de Material You (solo disponible en Android 12+)';

  @override
  String get useDash => 'Usar DASH';

  @override
  String get useDashDescription =>
      'La transmisión adaptativa DASH a veces puede ser problemática, YouTube puede limitar su velocidad.';

  @override
  String get videoPlayer => 'Reproductor de video';

  @override
  String get videoListed => 'Público';

  @override
  String get videoUnlisted => 'No incluido en listado';

  @override
  String get videoIsFamilyFriendly => 'Familiar';

  @override
  String get tapToManage => 'Toca para administrar';

  @override
  String get authentication => 'Autenticación';

  @override
  String get tokenLogin => 'Iniciar sesión con un token';

  @override
  String get tokenLoginDescription => 'Forma recomendada de conectarse';

  @override
  String get cookieLogin => 'Iniciar sesión con una cookie';

  @override
  String get cookieLoginDescription =>
      'Utiliza este método si tienes problemas con la autenticación del token';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get wrongUsernamePassword =>
      'Nombre de usuario o contraseña incorrectos';

  @override
  String get error => 'Fallo';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats no es lo esperado';

  @override
  String get malformedStatsEndpointDescription =>
      'El punto final de las estadísticas del servidor no respondió a una carga útil esperada, la clave \"software.name\" debería ser igual a \"invidious\".\nRespuesta del servidor:';

  @override
  String get serverIsNotReachable => 'El servidor no está accesible';

  @override
  String get videoQueue => 'La cola del video';

  @override
  String get addToQueueList => 'Añadir a la cola';

  @override
  String get addToPlaylist => 'Añadir a la lista de reproducción';

  @override
  String get playNext => 'Reproducir la siguiente';

  @override
  String get playNextAddedToQueue => 'El vídeo se reproducirá a continuación';

  @override
  String get addRecommendedToQueue =>
      'Reproducción automática recomendada a continuación';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Selecciona el tipo de segmentos que deseas omitir';

  @override
  String get sponsorBlockCategorySponsor => 'Patrocinador';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Promoción pagada, referencias pagadas y anuncios directos. No para la autopromoción o los mensajes gratuitos a causas/creadores/sitios web/productos que les gustan.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo =>
      'No remunerado/Autopromoción';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Similar a \"patrocinador\", excepto para la autopromoción o no remunerada. Esto incluye secciones sobre mercancía, donaciones o información sobre quiénes colaboraron ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Recordatorio de interacción (Suscribirse)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Cuando hay un breve recordatorio para dar me gusta, suscribirse o seguirlos en medio del contenido. Si es largo o se trata de algo específico, debería estar bajo la autopromoción.';

  @override
  String get sponsorBlockCategoryIntro => 'Intermedio/Introducción Animada';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Un espacio sin contenido real. Puede ser una pausa, un cuadro estático, una animación repetitiva. No debe utilizarse para transferencias que contengan información.';

  @override
  String get sponsorBlockCategoryOutro => 'Tarjetas/Créditos';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Créditos o cuando aparecen las tarjetas finales de YouTube. No para conclusiones con información.';

  @override
  String get sponsorBlockCategoryPreview => 'Vista previa/Resumen';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Colección de clips que muestran lo que sucede en este video u otros videos, en una serie donde toda la información se repite más adelante en el video.';

  @override
  String get sponsorBlockCategoryFiller => 'Chistes de relleno/Bromas';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Escenas tangenciales agregadas solo para relleno o humor que no son necesarias para comprender el contenido principal del video. Esto no debe incluir segmentos que proporcionen contexto o detalles de fondo. Esta es una categoría muy agresiva pensada para cuando no estás de humor para \"divertirte\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic => 'Música: Sección No Musical';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Sólo para vídeos musicales. Sólo debe utilizarse para secciones de vídeos musicales que no estén ya cubiertas por otra categoría.';

  @override
  String get useProxy => 'Proxy de los videos';

  @override
  String get useProxyDescription =>
      'Mediante la transmisión proxy de secuencias de vídeo desde el servidor, puedes evitar los bloqueos regionales o el bloqueo de YouTube por parte de los ISP';

  @override
  String get pressDownToShowSettings =>
      'Pulsa hacia abajo para mostrar los ajustes';

  @override
  String get quality => 'Calidad';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Subtítulos';

  @override
  String get playbackSpeed => 'Velocidad de reproducción';

  @override
  String get blackBackground => 'Fondo negro';

  @override
  String get blackBackgroundDescription =>
      'Para el tema oscuro en una pantalla OLED';

  @override
  String get search => 'Buscar';

  @override
  String get subtitleFontSize => 'Tamaño de letra de los subtítulos';

  @override
  String get subtitleFontSizeDescription =>
      'Cambia el tamaño de los subtítulos si es demasiado pequeño o demasiado grande en tu dispositivo';

  @override
  String get skipSslVerification =>
      'Omitir la verificación del certificado SSL';

  @override
  String get skipSslVerificationDescription =>
      'Para utilizar un certificado SSL autofirmado, o cuando tienes problemas relacionados con un SSL tu servidor.';

  @override
  String get themeBrightness => 'Tema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get followSystem => 'Sistema';

  @override
  String get requiresRestart => 'Requiere reiniciar la aplicación';

  @override
  String get appLanguage => 'Idioma de la aplicación';

  @override
  String nVideos(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString vídeos',
      one: '1 video',
      zero: 'Sin vídeos',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'La URL debe comenzar con http:// o https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Muestra aproximaciones de los videos que no me gustan usando la API proporcionada por returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'URL de instancia RYD personalizada';

  @override
  String get rydCustomInstanceDescription =>
      'Use una instancia RYD diferente, déjela vacía para usar la predeterminada';

  @override
  String get autoplayVideoOnLoad =>
      'Reproducir el video automáticamente al iniciar';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Comenzar a reproducir automáticamente el video después de que se haya iniciado';

  @override
  String get searchHistory => 'Historial de búsquedas';

  @override
  String get searchHistoryDescription => 'Ajustes del historial de búsqueda';

  @override
  String get enableSearchHistory => 'Activar el historial de búsquedas';

  @override
  String get searchHistoryLimit => 'Límite del historial de búsquedas';

  @override
  String get searchHistoryLimitDescription =>
      'Establece el número de las búsquedas antiguas sugeridas';

  @override
  String get shorts => 'Videos Cortos';

  @override
  String get searchUploadDate => 'Fecha de la subida';

  @override
  String get searchUploadDateAny => 'En cualquier fecha';

  @override
  String get searchUploadDateHour => 'La última hora';

  @override
  String get searchUploadDateToday => 'Hoy';

  @override
  String get searchUploadDateWeek => 'Esta semana';

  @override
  String get searchUploadDateMonth => 'Este mes';

  @override
  String get searchUploadDateYear => 'Este año';

  @override
  String get searchDuration => 'Duración';

  @override
  String get searchDurationAny => 'Cualquier duración';

  @override
  String get searchDurationShort => 'Corta (<4 minutos)';

  @override
  String get searchDurationLong => 'Larga (>20 minutos)';

  @override
  String get searchDurationMedium => 'Media (de 4 a 20 minutos)';

  @override
  String get searchSortBy => 'Ordenar por';

  @override
  String get searchSortRelevance => 'Relevancia';

  @override
  String get searchSortRating => 'Clasificación';

  @override
  String get searchSortUploadDate => 'Fecha subida';

  @override
  String get searchSortViewCount => 'Contador de visitas';

  @override
  String get clearSearchHistory => 'Limpiar el historial de búsquedas';

  @override
  String get appLogs => 'Registros de aplicaciones';

  @override
  String get appLogsDescription =>
      'Obtener registros de lo que ocurre en la aplicación, puede ser útil para informar de problemas';

  @override
  String get copyToClipBoard => 'Copiar al portapapeles';

  @override
  String get logsCopied => 'Registros copiados en el portapapeles';

  @override
  String get rememberSubtitleLanguage => 'Recordar el idioma del subtitulo';

  @override
  String get videoFilters => 'Filtros de vídeo';

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
      zero: 'Sin vídeos',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'Oculta u ofusca los videos de todas las fuentes de video en la aplicación según los filtros definidos a continuación. Esto te permite, por ejemplo, ocultar spoilers deportivos u ocultar cortos de un determinado canal.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Definir las reglas para filtrar los vídeos';

  @override
  String get videoFilterAllChannels => 'Todos los canales';

  @override
  String get addVideoFilter => 'Crear un filtro';

  @override
  String get editVideoFilter => 'Editar el filtro';

  @override
  String get videoFilterType => 'Tipo';

  @override
  String get videoFilterOperation => 'Operación';

  @override
  String get videoFilterValue => 'Valor';

  @override
  String get save => 'Guardar';

  @override
  String get videoFilterEditDescription =>
      'Selecciona un canal opcional, un tipo de filtro, una operación y un valor para filtrar los vídeos de las listas. Ejemplo, tipo: nombre de vídeo, operación: contiene, valor: prueba EXCLUIRÁ todos los vídeos cuyo nombre contenga la palabra \"prueba\".';

  @override
  String get optional => 'opcional';

  @override
  String get videoFilterHideLabel => 'Ocultar';

  @override
  String get videoFilterFilterLabel => 'Ofuscar';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter videos donde $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered =>
      'Vídeo filtrado por el/los siguiente(s) motivo(s):';

  @override
  String get videoFilterTapToReveal => 'Toca para mostrar';

  @override
  String get videoFilterHide => 'Ocultar los vídeos filtrados';

  @override
  String get videoFilterHideDescription =>
      'Por defecto, los vídeos filtrados no se ocultan, sino que se muestran ofuscados con la(s) razón(es) por la(s) que se han filtrado. Esta opción elimina los vídeos filtrados de las listas.';

  @override
  String get videoFilterNoFilters =>
      'Sin filtros de vídeo, pulsa el botón \"+\" de abajo para empezar a añadir filtros.';

  @override
  String get videoFilterTypeVideoTitle => 'Título del vídeo';

  @override
  String get videoFilterTypeChannelName => 'Nombre del canal';

  @override
  String get videoFilterTypeVideoLength => 'Duración del vídeo (segundos)';

  @override
  String get videoFilterOperationContains => 'Contiene';

  @override
  String get videoFilterOperationNotContain => 'No contiene';

  @override
  String get videoFilterOperationLowerThan => 'Inferior a';

  @override
  String get videoFilterOperationHigherThan => 'Superior a';

  @override
  String get channel => 'Canal';

  @override
  String get videoFilterHideAllFromChannel =>
      'Filtrar todos los vídeos del canal';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter todos los vídeos del canal';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Establecer automáticamente los subtítulos en el último idioma seleccionado, si está disponible';

  @override
  String get lockFullScreenToLandscape =>
      'Bloquea la orientación de la pantalla completa en la relación al aspecto del vídeo';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Bloquea la orientación de la pantalla completa en función del formato de vídeo: horizontal para vídeos anchos y vertical para vídeos verticales';

  @override
  String get fillFullscreen =>
      'Maximiza el video para que se ajuste a la pantalla';

  @override
  String get fillFullscreenDescription =>
      'Ajusta el video para que la imagen se extienda por toda la pantalla en visualización horizontal';

  @override
  String get rememberPlaybackSpeed => 'Recordar la velocidad de reproducción';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Ajuste automático de la velocidad de reproducción a la última velocidad seleccionada';

  @override
  String get downloads => 'Descargas';

  @override
  String get download => 'Descarga';

  @override
  String get videoAlreadyDownloaded => 'Vídeo descargado';

  @override
  String get noDownloadedVideos =>
      'No hay vídeos descargados, navega, pulsa prolongadamente en un vídeo de una lista o toca el botón de descarga en la pantalla de un vídeo para descargarlo';

  @override
  String get downloadsPlayAll => 'Reproducir todo';

  @override
  String get videoDownloadStarted => 'Comienza la descarga del vídeo';

  @override
  String get videoFailedDownloadRetry =>
      'La descarga falló, toca para reintentar';

  @override
  String get videoDownloadAudioOnly => 'Sólo el audio';

  @override
  String get manageSubscriptions => 'Gestionar las suscripciones';

  @override
  String get noSubscriptions =>
      'Sin suscripciones, navega por los vídeos y suscríbete al canal que quieras.';

  @override
  String get youCanSubscribeAgainLater =>
      'Puedes volver a suscribirte a este canal más tarde';

  @override
  String get unSubscribeQuestion => '¿Darse de baja?';

  @override
  String get clearHistoryQuestion => '¿Borrar el historial?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Esto borrará el historial de visualización de tu cuenta en la instancia de Invidious que utilices. Esto no se puede deshacer.';

  @override
  String get noHistory =>
      'No hay historial de visualización, mira algunos videos y aparecerán aquí';

  @override
  String get homeLayoutEditor => 'Editar el diseño de la página de inicio';

  @override
  String get layoutEditorAddVideoSource => 'Añadir una fuente de vídeo';

  @override
  String get layoutEditorExplanation =>
      'Puedes decidir qué mostrar en tu pantalla de inicio, puedes tener hasta 2 vistas pequeñas con desplazamiento horizontal y una fuente grande.';

  @override
  String get home => 'Inicio';

  @override
  String get library => 'Biblioteca';

  @override
  String get customizeAppLayout =>
      'Personalizar las secciones de la aplicación';

  @override
  String get customizeAppLayoutExplanation =>
      'Selecciona qué secciones quieres que aparezcan en la barra de navegación de la aplicación. Pulsa en el icono de inicio para seleccionar qué pantalla se muestra al iniciar la aplicación. Puedes reordenar las secciones arrastrándolas.';

  @override
  String get navigationBarStyle => 'Estilo de la barra de navegación';

  @override
  String get navigationBarLabelAlwaysShowing => 'Etiquetas siempre visibles';

  @override
  String get navigationBarLabelShowOnSelect =>
      'Etiqueta mostrada en el elemento seleccionado';

  @override
  String get navigationBarLabelNeverShow => 'Nunca mostrar las etiquetas';

  @override
  String get distractionFreeMode => 'Modo sin distracciones';

  @override
  String get distractionFreeModeDescription =>
      'Desactivar los comentarios y las recomendaciones de los vídeos';

  @override
  String get secondsShortForm => 's';

  @override
  String get videoFilterApplyDateToFilter =>
      'Filtrar vídeos en función de la hora';

  @override
  String get videoFilterDayOfWeek =>
      'Seleccionar los días para aplicar los filtros';

  @override
  String get videoFilterDayOfWeekDescription =>
      'Puedes elegir selectivamente los días de la semana y la hora a la que se aplican los filtros para, por ejemplo, evitar spoilers de acontecimientos deportivos.';

  @override
  String get videoFilterStartTime => 'Hora de inicio';

  @override
  String get videoFilterEndTime => 'Hora de finalización';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Se aplica en $selectedDays';
  }

  @override
  String get from => 'De';

  @override
  String get to => 'A';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'De $from a $to';
  }

  @override
  String get notifications => 'Notificaciones';

  @override
  String get notificationsDescription => 'Activar y revisar las notificaciones';

  @override
  String get enableNotificationDescriptions =>
      'Ejecuta un servicio en primer plano para comprobar y notificar los cambios que estás supervisando';

  @override
  String get subscriptionNotification => 'Notificaciones de la suscripción';

  @override
  String get subscriptionNotificationDescription =>
      'Recibe notificaciones de nuevos vídeos desde la fuente de la suscripción si has iniciado sesión en tu instancia actual';

  @override
  String get subscriptionNotificationTitle =>
      'Nuevos vídeos de tus suscripciones';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString vídeos nuevos',
      one: '1 vídeo nuevo',
      zero: 'ningún vídeo nuevo',
    );
    return 'Hay  $_temp0 en tu feed de suscripción';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Es necesario desactivar la optimización de la batería';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'Para enviar notificaciones Clipious necesita ejecutar un servicio en segundo plano. Para que funcione sin problemas es necesario que Clipious tenga un uso de la batería sin restricciones, pulsando en de acuerdo se abrirá la configuración de optimización de la batería.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Notificaciones desactivadas';

  @override
  String get askToEnableBackgroundServiceContent =>
      'Para recibir las notificaciones, es necesario activar las notificaciones en Clipious, pulse de acuerdo para activarlo.';

  @override
  String get otherNotifications =>
      'Otras fuentes de notificación (iconos de campana)';

  @override
  String get deleteChannelNotificationTitle =>
      '¿Borrar la notificación del canal?';

  @override
  String get deleteChannelNotificationContent =>
      'No recibirás más notificaciones de este canal.';

  @override
  String get deletePlaylistNotificationTitle =>
      '¿Notificación de eliminación de las listas de reproducción ?';

  @override
  String get deletePlaylistNotificationContent =>
      'No recibirás más notificaciones de esta lista de reproducción.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Nuevos vídeos de $channel';
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
      other: '$countString vídeos nuevos',
      one: '1 vídeo nuevo',
      zero: 'ningún vídeo nuevo',
    );
    return 'Hay $_temp0 de $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'Nuevos vídeos en la lista de reproducción $playlist';
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
      other: '$countString vídeos nuevos',
      one: '1 vídeo nuevo',
      zero: 'ningún vídeo nuevo',
    );
    return 'Hay $_temp0 en la lista de reproducción $playlist';
  }

  @override
  String get foregroundServiceNotificationTitle => 'Vigilando el vídeo';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'por hora',
        '24': 'al día',
        'other': 'cada $hours horas',
      },
    );
    return 'Comprobará si hay vídeos nuevos una vez $_temp0';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'Revisando las suscripciones...';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'Comprobando las listas de reproducción...';

  @override
  String get foregroundServiceUpdatingChannels => 'Comprobando los canales...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Nueva frecuencia de verificación del video';

  @override
  String get notificationFrequencySettingsDescription =>
      'Frecuencia con la que la aplicación buscará nuevos vídeos';

  @override
  String notificationFrequencySliderLabel(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '24': '1día',
        'other': '${hours}horas',
      },
    );
    return '$_temp0';
  }

  @override
  String get subtitlesBackground => 'Fondo de los subtítulos';

  @override
  String get subtitlesBackgroundDescription =>
      'Añade un fondo negro a los subtítulos para hacerlos más legibles';

  @override
  String get history => 'Historial';

  @override
  String get deArrowSettingDescription =>
      'Sustituir los títulos y las miniaturas de los clickbait';

  @override
  String get deArrowReplaceThumbnails => 'Reemplazar las miniaturas';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Reemplazar las miniaturas del vídeo además de los títulos';

  @override
  String get deArrowWarning =>
      'Habilitar DeArrow puede reducir significativamente la velocidad de navegación de la aplicación, ya que se necesitan solicitudes http adicionales para cada video';

  @override
  String get copySettingsAsJson =>
      'Copiar los ajustes como JSON al portapapeles';

  @override
  String get copySettingsAsJsonDescription =>
      'Copie los ajustes como JSON para ayudar a la depuración si se encuentra con un problema con la aplicación y decide plantear un problema';

  @override
  String get seeking => 'Buscando';

  @override
  String get skipStep => 'Saltar hacia delante/atrás';

  @override
  String get skipStepDescription => 'Segundos a saltar en el avance/retroceso';

  @override
  String get exponentialSkip => 'Salto exponencial adelante/atrás';

  @override
  String get exponentialSkipDescription =>
      'Cuanto más saltes hacia delante, mayor será el paso.';

  @override
  String get fullscreenOnLandscape => 'Pantalla completa en apaisado';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Cambio a pantalla completa al girar el dispositivo al modo horizontal';

  @override
  String get enabled => 'Activado';

  @override
  String get submitFeedback => 'Enviar comentarios';

  @override
  String get submitFeedbackDescription =>
      '¿Has encontrado un error o tienes alguna sugerencia? Utiliza esta herramienta para hacer capturas de pantalla de la aplicación, anotarlas y enviar tus comentarios';

  @override
  String get feedbackDisclaimer =>
      'Para enviar comentarios necesitarás una cuenta de GitHub y tu captura de pantalla se enviará a Imgur de forma anónima.';

  @override
  String get feedbackScreenshotError =>
      'Error al subir una captura de pantalla a Imgur';

  @override
  String get channelSortByNewest => 'La más reciente';

  @override
  String get channelSortByOldest => 'La más antigua';

  @override
  String get channelSortByPopular => 'Popular';

  @override
  String get invidiousAccount => 'Cuenta de Invidious';

  @override
  String get onDeviceSubscriptions => 'En el dispositivo';

  @override
  String get both => 'Ambos';

  @override
  String get refresh => 'Recargar';

  @override
  String get addBasicAuth => 'Agregar autenticación básica';

  @override
  String get addBasicAuthExplanation =>
      'Si su servidor requiere autenticación HTTP básica, añada los datos que se indican a continuación. Estos no son los detalles de su cuenta invidious';

  @override
  String get addHeader => 'Añadir encabezado';

  @override
  String get advancedConfiguration => 'Configuración avanzada';

  @override
  String get customHeaders => 'Encabezados personalizados';

  @override
  String get customHeadersExplanation =>
      'Establezca los encabezamientos personalizados que se enviarán al servidor invidious';

  @override
  String get value => 'Valor';

  @override
  String get testAndAddServer => 'Probar y añadir servidor';

  @override
  String get alsoTestServerConfig =>
      'También probar la configuración del servidor, como si las miniaturas se muestran correctamente';

  @override
  String get serverAlreadyExists => 'El servidor ya existe en la configuración';

  @override
  String get wrongThumbnailConfiguration =>
      'El servidor es accesible pero no está configurado correctamente, las miniaturas de los vídeos y canales no se mostrarán correctamente. Desactive la configuración de prueba del servidor si está de acuerdo con esto, arregle su servidor en caso contrario';

  @override
  String get openWikiLink => 'Abrir wiki para obtener ayuda';

  @override
  String get serverUnreachable =>
      'El servidor es inaccesible o no es un servidor invidious válido';

  @override
  String get copyToDownloadFolder => 'Copiar a la carpeta de descarga';

  @override
  String get fileCopiedToDownloadFolder =>
      'Archivo copiado a la carpeta de descarga';

  @override
  String get videoDeleted => 'Vídeo eliminado';

  @override
  String get sleepTimer => 'Temporizador de apagado';

  @override
  String get stopTheVideo => 'Detener el vídeo';

  @override
  String get stopTheVideoExplanation =>
      'Si se activa, el vídeo se cerrará, si se desactiva, el vídeo simplemente se pausará';

  @override
  String get setTimer => 'Programar temporizador';

  @override
  String get cancelSleepTimer => 'Cancelar temporizador de apagado';

  @override
  String premieresIn(Object formattedDuration) {
    return 'Estrenos en $formattedDuration';
  }

  @override
  String get screenControls => 'Controles en pantalla';

  @override
  String get screenControlsExplanation =>
      'Cuando vea un vídeo a pantalla completa, arrastre verticalmente desde la izquierda o la derecha para ajustar el brillo o el volumen, respectivamente';

  @override
  String get retry => 'Reintentar';

  @override
  String get forceTvUi => 'Forzar interfaz de TV';

  @override
  String get forceTvUiExplanation =>
      'Fuerza la interfaz a ser la experiencia de TV, puede ser útil para algunos dispositivos que no tengan la configuración del sistema Leanback. Se necesita reiniciar la aplicación';

  @override
  String get noPublicServers => 'No hay servidores públicos disponibles';

  @override
  String get tapToSeeHow => 'Toca para ver cómo alojar el tuyo';

  @override
  String get referToInvidiousWebsiteForHostingInstructions =>
      'Consulta el sitio web de Invidious para obtener instrucciones sobre cómo alojar Invidious';
}
