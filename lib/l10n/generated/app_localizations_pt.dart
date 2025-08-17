// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get subscriptions => 'Subscrições';

  @override
  String get playlists => 'Listas de reprodução';

  @override
  String get popular => 'Mais popular';

  @override
  String get trending => 'Tendência';

  @override
  String get noVideoInPlayList => 'Sem vídeo na lista de reprodução';

  @override
  String get removeFromPlayList => 'Remover da lista de reprodução';

  @override
  String get deletePlayListQ => 'Eliminar a lista de reprodução?';

  @override
  String get irreversibleAction => 'Esta ação é irreversível';

  @override
  String get addPlayList => 'Adicionar lista de reprodução';

  @override
  String get playListName => 'Nome da lista de reprodução';

  @override
  String get playlistVisibility => 'Visibilidade';

  @override
  String get publicPlaylist => 'Público';

  @override
  String get privatePlaylist => 'Privado';

  @override
  String get cancel => 'Cancelar';

  @override
  String get add => 'Adicionar';

  @override
  String get unlistedPlaylist => 'Não listado';

  @override
  String get info => 'Informação';

  @override
  String get videos => 'Vídeos';

  @override
  String get streams => 'Transmissão';

  @override
  String get latestVideos => 'Vídeos mais recentes';

  @override
  String get subscribed => 'Subscrito';

  @override
  String get subscribe => 'Inscrever';

  @override
  String nSubscribers(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        'no': 'Sem subscritores',
        'other': '$count subscritores',
      },
    );
    return '$_temp0';
  }

  @override
  String get share => 'Compartilhar';

  @override
  String get shareYoutubeLink => 'Partilhar o link do YouTube';

  @override
  String get shareInvidiousLink => 'Partilhar link Invidious';

  @override
  String get redirectInvidiousLink =>
      'Partilhar Invidious Link de redireccionamento';

  @override
  String get shareLinkWithTimestamp => 'Adicionar carimbo de data/hora';

  @override
  String get ok => 'OK';

  @override
  String get noChannels => 'Sem canais';

  @override
  String get noPlaylists => 'Sem listas de reprodução';

  @override
  String get channels => 'Canais';

  @override
  String get couldntLoadVideo => 'Não foi possível carregar o vídeo';

  @override
  String get comments => 'Comentários';

  @override
  String get recommended => 'Recomendado';

  @override
  String get couldntFetchVideos =>
      'Não foi possível ir buscar vídeos. Toque para tentar novamente.';

  @override
  String get wizardIntro =>
      'Selecione um servidor público ou adicione o seu próprio. (Pode ser alterado mais tarde nas definições)';

  @override
  String get startUsingClipious => 'Comece a usar o Clipious';

  @override
  String get videoAddedToPlaylist => 'Vídeo adicionado à lista de reprodução';

  @override
  String get videoAddedToQueue => 'Vídeo adicionado à fila de espera';

  @override
  String get errorAddingVideoToPlaylist =>
      'Erro ao adicionar vídeo à lista de reprodução';

  @override
  String get itemlistErrorGeneric => 'Não foi possível obter dados';

  @override
  String get itemListErrorInvalidScope =>
      'Se iniciou sessão utilizando o método do token, tente terminar a sessão e iniciar novamente';

  @override
  String get selectPlaylist => 'Selecionar lista de reprodução';

  @override
  String get createNewPlaylist => 'Criar nova lista de reprodução';

  @override
  String nReplies(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString respostas',
      one: '1 responder',
      zero: 'Sem respostas',
    );
    return '$_temp0';
  }

  @override
  String get loadMore => 'Carregar mais';

  @override
  String get topSorting => 'Topo';

  @override
  String get newSorting => 'Novo';

  @override
  String get streamIsLive => 'Em directo';

  @override
  String get sponsorSkipped => 'Patrocinador ignorado';

  @override
  String get selectBrowsingCountry => 'Selecione o país de navegação';

  @override
  String get showOnStart =>
      'Selecione o que mostrar quando a aplicação começar';

  @override
  String get settings => 'Definições';

  @override
  String get browsing => 'Navegação';

  @override
  String get country => 'País';

  @override
  String get whenAppStartsShow => 'Quando a aplicação começar, mostrar…';

  @override
  String get servers => 'Servidores';

  @override
  String get manageServers => 'Gerir servidores';

  @override
  String currentServer(String current) {
    return 'Atualmente a utilizar $current';
  }

  @override
  String get useSponsorBlock => 'Usar SponsorBlock';

  @override
  String get sponsorBlockDescription =>
      'Ignorar segmentos de patrocinadores apresentados pela comunidade';

  @override
  String get about => 'Sobre';

  @override
  String get name => 'Nome';

  @override
  String get package => 'Pacote';

  @override
  String get version => 'Versão';

  @override
  String get build => 'Compilação';

  @override
  String get addServer => 'Adicionar servidor';

  @override
  String get useThisServer => 'Utilizar este servidor';

  @override
  String get logIn => 'Iniciar Sessão';

  @override
  String get delete => 'Eliminar';

  @override
  String get invalidInvidiousServer => 'Servidor Invidious inválido';

  @override
  String get yourServers => 'Os seus servidores';

  @override
  String get loggedIn => 'Não ligado';

  @override
  String get notLoggedIn => 'Não está conectado';

  @override
  String get addServerHelpText =>
      'Use o botão + para adicionar os seus próprios servidores ou toque num servidor público e adicione-o.';

  @override
  String get publicServers => 'Servidores públicos';

  @override
  String get loadingPublicServer => 'Carregando servidores públicos';

  @override
  String get tapToAddServer => 'Toque para adicionar servidor à sua lista';

  @override
  String get publicServersError =>
      'Não foi possível obter uma lista de Servidores Públicos. Toque em para tentar novamente.';

  @override
  String get appearance => 'Aparência';

  @override
  String get useDynamicTheme => 'Cores dinâmicas';

  @override
  String get useDynamicThemeDescription =>
      'Usar cores Material You (apenas disponível no Android 12+)';

  @override
  String get useDash => 'Usar DASH';

  @override
  String get useDashDescription =>
      'Às vezes, o streaming adaptativo do DASH pode ser problemático, o Youtube pode limitá-lo.';

  @override
  String get videoPlayer => 'Reprodutor de vídeo';

  @override
  String get videoListed => 'Público';

  @override
  String get videoUnlisted => 'Não listado';

  @override
  String get videoIsFamilyFriendly => 'Familiar';

  @override
  String get tapToManage => 'Toque para gerir';

  @override
  String get authentication => 'Autenticação';

  @override
  String get tokenLogin => 'Iniciar sessão com token';

  @override
  String get tokenLoginDescription => 'Forma recomendada de iniciar sessão';

  @override
  String get cookieLogin => 'Iniciar sessão com cookie';

  @override
  String get cookieLoginDescription =>
      'Utilize este método se enfrentar problemas com a autenticação simbólica';

  @override
  String get logout => 'Terminar sessão';

  @override
  String get username => 'Nome de utilizador';

  @override
  String get password => 'Palavra-passe';

  @override
  String get wrongUsernamePassword =>
      'Nome de utilizador ou palavra-passe incorretos';

  @override
  String get error => 'Erro';

  @override
  String get malformedStatsEndpoint => '/api/v1/stats não é o esperado';

  @override
  String get malformedStatsEndpointDescription =>
      'O endpoint de estatísticas do servidor não respondeu com o payload esperado, a chave \"software.name\" deveria ser igual a \"invidious\".\nResposta do servidor:';

  @override
  String get serverIsNotReachable => 'O servidor não está acessível';

  @override
  String get videoQueue => 'Fila de vídeo';

  @override
  String get addToQueueList => 'Adicionar à fila';

  @override
  String get addToPlaylist => 'Adicionar à lista de reprodução';

  @override
  String get playNext => 'Reproduzir o próximo';

  @override
  String get playNextAddedToQueue => 'O vídeo será reproduzido a seguir';

  @override
  String get addRecommendedToQueue =>
      'Reprodução automática recomendada a seguir';

  @override
  String get sponsorBlockSettingsQuickDescription =>
      'Selecione o tipo de segmentos a saltar';

  @override
  String get sponsorBlockCategorySponsor => 'Patrocinador';

  @override
  String get sponsorBlockCategorySponsorDescription =>
      'Promoção paga, referências pagas e publicidade direta. Não para auto-promoção ou gritos gratuitos a causas/criadores/websites/produtos de que eles gostam.';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromo =>
      'Promoção não remunerada/auto-própria';

  @override
  String get sponsorBlockCategoryUnpaidSelfPromoDescription =>
      'Semelhante a \"patrocinador\" exceto para promoção não remunerada ou auto-promoção. Isto inclui secções sobre mercadorias, doações, ou informação sobre quem colaboraram ';

  @override
  String get sponsorBlockCategoryInteraction =>
      'Lembrete de Interação (Inscrição)';

  @override
  String get sponsorBlockCategoryInteractionDescription =>
      'Quando houver um breve lembrete para gostar, subscrever ou segui-los no meio do conteúdo. Se for longo ou sobre algo específico, deve, em vez disso, estar sob auto-promoção.';

  @override
  String get sponsorBlockCategoryIntro => 'Interrupção/Animação Internacional';

  @override
  String get sponsorBlockCategoryIntroDescription =>
      'Um intervalo sem conteúdo real. Pode ser uma pausa, frame estático, repetição de animação. Isto não deve ser utilizado para transições que contenham informação.';

  @override
  String get sponsorBlockCategoryOutro => 'Endcards / Créditos';

  @override
  String get sponsorBlockCategoryOutroDescription =>
      'Créditos ou quando os endcards do YouTube aparecem. Não para conclusões com informações.';

  @override
  String get sponsorBlockCategoryPreview => 'Pré-visualização/Recapitulação';

  @override
  String get sponsorBlockCategoryPreviewDescription =>
      'Coleção de clips que mostram o que está a aparecer neste vídeo ou noutros vídeos de uma série onde toda a informação é repetida mais tarde no vídeo.';

  @override
  String get sponsorBlockCategoryFiller => 'Enrolações / Piadas';

  @override
  String get sponsorBlockCategoryFillerDescription =>
      'Cenas tangenciais adicionadas apenas para preenchimento ou humor que não são necessárias para compreender o conteúdo principal do vídeo. Isto não deve incluir segmentos que forneçam o contexto ou detalhes de fundo. Esta é uma categoria muito agressiva destinada a quando não se está com disposição para \"diversão\".';

  @override
  String get sponsorBlockCategoryMusicOffTopic =>
      'Música: Secção de Não-Música';

  @override
  String get sponsorBlockCategoryMusicOffTopicDescription =>
      'Apenas para utilização em vídeos musicais. Esta categoria só deve ser utilizada para secções de vídeos musicais que ainda não estejam abrangidas por outra categoria.';

  @override
  String get useProxy => 'Vídeos proxy';

  @override
  String get useProxyDescription =>
      'Ao fazer proxy de fluxos de vídeo do servidor, você pode ignorar bloqueios regionais ou ISP bloqueando o YouTube';

  @override
  String get pressDownToShowSettings =>
      'Pressione para baixo para mostrar as definições';

  @override
  String get quality => 'Qualidade';

  @override
  String get audio => 'Áudio';

  @override
  String get subtitles => 'Subtítulos';

  @override
  String get playbackSpeed => 'Velocidade de reprodução';

  @override
  String get blackBackground => 'Fundo preto';

  @override
  String get blackBackgroundDescription => 'Para tema escuro no ecrã OLED';

  @override
  String get search => 'Pesquisa';

  @override
  String get subtitleFontSize => 'Tamanho de letra das legendas';

  @override
  String get subtitleFontSizeDescription =>
      'Mude o tamanho das legendas se forem demasiado pequenas ou demasiado grandes no seu dispositivo';

  @override
  String get skipSslVerification => 'Ignorar verificação do certificado SSL';

  @override
  String get skipSslVerificationDescription =>
      'Para usar um certificado SSL auto-assinado, ou quando tiver problemas relacionados com SSL com o seu servidor.';

  @override
  String get themeBrightness => 'Tema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get followSystem => 'Seguir sistema';

  @override
  String get requiresRestart => 'Requer reinício da aplicação';

  @override
  String get appLanguage => 'Idioma da aplicação';

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
      one: '1 vídeo',
      zero: 'Sem vídeos',
    );
    return '$_temp0';
  }

  @override
  String get returnYoutubeUrlValidation =>
      'A URL deve começar com http:// ou https://';

  @override
  String get returnYoutubeDislikeDescription =>
      'Mostrar a estimativa de aversões a vídeos utilizando a API fornecida por returnyoutubedislike.com';

  @override
  String get rydCustomInstance => 'endereço de instância RYD personalizado';

  @override
  String get rydCustomInstanceDescription =>
      'Use a different RYD instance, leave empty to use the default';

  @override
  String get autoplayVideoOnLoad =>
      'Reprodução automática de vídeo ao carregar';

  @override
  String get autoplayVideoOnLoadDescription =>
      'Iniciar automaticamente a reprodução do vídeo depois de este ter sido carregado';

  @override
  String get searchHistory => 'Histórico de pesquisa';

  @override
  String get searchHistoryDescription => 'Definições do histórico de pesquisa';

  @override
  String get enableSearchHistory => 'Ativar o histórico de pesquisa';

  @override
  String get searchHistoryLimit => 'Limite do histórico de pesquisa';

  @override
  String get searchHistoryLimitDescription =>
      'Definir o número de pesquisas anteriores que aparecerão nas sugestões';

  @override
  String get shorts => 'Curtos';

  @override
  String get searchUploadDate => 'Data de Upload';

  @override
  String get searchUploadDateAny => 'Qualquer data';

  @override
  String get searchUploadDateHour => 'Última Hora';

  @override
  String get searchUploadDateToday => 'Hoje';

  @override
  String get searchUploadDateWeek => 'Essa semana';

  @override
  String get searchUploadDateMonth => 'Esse mês';

  @override
  String get searchUploadDateYear => 'Esse ano';

  @override
  String get searchDuration => 'Duração';

  @override
  String get searchDurationAny => 'Qualquer duração';

  @override
  String get searchDurationShort => 'Curto (<4 minutos)';

  @override
  String get searchDurationLong => 'Longo (>20 minutos)';

  @override
  String get searchDurationMedium => 'Médio (4-20 minutos)';

  @override
  String get searchSortBy => 'Ordenar por';

  @override
  String get searchSortRelevance => 'Relevância';

  @override
  String get searchSortRating => 'Classificação';

  @override
  String get searchSortUploadDate => 'Data de carregamento';

  @override
  String get searchSortViewCount => 'Ver contagem';

  @override
  String get clearSearchHistory => 'Limpar o histórico de pesquisa';

  @override
  String get appLogs => 'Registos de aplicações';

  @override
  String get appLogsDescription =>
      'Obter registos do que está a acontecer na aplicação, o que pode ser útil para comunicar problemas';

  @override
  String get copyToClipBoard => 'Copiar para a área de transferência';

  @override
  String get logsCopied => 'Registos copiados para a área de transferência';

  @override
  String get rememberSubtitleLanguage => 'Recordar o idioma das legendas';

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
      zero: 'No videos',
    );
    return '$_temp0';
  }

  @override
  String get videoFiltersExplanation =>
      'Oculte ou ofusque vídeos de todos os feeds de vídeo na aplicação com base nos filtros definidos abaixo. Isto permite-lhe, por exemplo, ocultar spoilers desportivos ou ocultar curtas-metragens de um determinado canal.';

  @override
  String get videoFiltersSettingTileDescriptions =>
      'Definir regras para filtrar vídeos';

  @override
  String get videoFilterAllChannels => 'Todos os canais';

  @override
  String get addVideoFilter => 'Criar filtro';

  @override
  String get editVideoFilter => 'Editar filtro';

  @override
  String get videoFilterType => 'Tipo';

  @override
  String get videoFilterOperation => 'Funcionamento';

  @override
  String get videoFilterValue => 'Valor';

  @override
  String get save => 'Guardar';

  @override
  String get videoFilterEditDescription =>
      'Seleccione um canal opcional, um tipo de filtro, uma operação e um valor para filtrar os vídeos OUT das listas. Exemplo, tipo: nome do vídeo, operação: contém, valor: teste EXCLUIRÁ todos os vídeos com a palavra \"teste\" no seu nome.';

  @override
  String get optional => 'facultativo';

  @override
  String get videoFilterHideLabel => 'Ocultar';

  @override
  String get videoFilterFilterLabel => 'Ofuscar';

  @override
  String videoFilterDescriptionString(
      String hideOrFilter, String type, String operation, String value) {
    return '$hideOrFilter vídeos em que $type $operation \'$value\'.';
  }

  @override
  String get videoFiltered => 'Vídeo filtrado pelo(s) seguinte(s) motivo(s):';

  @override
  String get videoFilterTapToReveal => 'Toque para revelar';

  @override
  String get videoFilterHide => 'Ocultar vídeos filtrados';

  @override
  String get videoFilterHideDescription =>
      'Por predefinição, os vídeos filtrados não são ocultados, mas mostrados como ofuscados com o(s) motivo(s) por que foram filtrados. Esta definição remove os vídeos filtrados das listas.';

  @override
  String get videoFilterNoFilters =>
      'Sem filtros de vídeo, toque no botão + abaixo para começar a adicionar filtros.';

  @override
  String get videoFilterTypeVideoTitle => 'Título do vídeo';

  @override
  String get videoFilterTypeChannelName => 'Nome do canal';

  @override
  String get videoFilterTypeVideoLength => 'Duração do vídeo (segundos)';

  @override
  String get videoFilterOperationContains => 'Contém';

  @override
  String get videoFilterOperationNotContain => 'Não contém';

  @override
  String get videoFilterOperationLowerThan => 'Inferior a';

  @override
  String get videoFilterOperationHigherThan => 'Superior a';

  @override
  String get channel => 'Canal';

  @override
  String get videoFilterHideAllFromChannel =>
      'Filtrar todos os vídeos do canal';

  @override
  String videoFilterWholeChannel(String hideOrFilter) {
    return '$hideOrFilter todos os vídeos do canal';
  }

  @override
  String get rememberSubtitleLanguageDescription =>
      'Definir automaticamente as legendas para o último idioma selecionado, se disponível';

  @override
  String get lockFullScreenToLandscape =>
      'Bloquear a orientação do ecrã inteiro para o rácio de aspeto do vídeo';

  @override
  String get lockFullScreenToLandscapeDescription =>
      'Bloqueia a orientação do ecrã inteiro com base no formato de vídeo, paisagem para vídeos largos e retrato para vídeos em retrato';

  @override
  String get fillFullscreen => 'Maximizar o vídeo para caber no ecrã';

  @override
  String get fillFullscreenDescription =>
      'Ajusta o vídeo para preencher todo o ecrã no modo paisagem';

  @override
  String get rememberPlaybackSpeed => 'Recordar a velocidade de reprodução';

  @override
  String get rememberPlaybackSpeedDescription =>
      'Definir automaticamente a velocidade de reprodução para a última velocidade selecionada';

  @override
  String get downloads => 'Transferências';

  @override
  String get download => 'Transferir';

  @override
  String get videoAlreadyDownloaded => 'Vídeo já transferido';

  @override
  String get noDownloadedVideos =>
      'Nenhum vídeo descarregado, navegar, premir longamente um vídeo numa lista ou tocar no botão de descarregamento no ecrã de um vídeo para descarregar';

  @override
  String get downloadsPlayAll => 'Reproduzir tudo';

  @override
  String get videoDownloadStarted => 'Início da transferência de vídeo';

  @override
  String get videoFailedDownloadRetry =>
      'A transferência falhou, toque para tentar de novo';

  @override
  String get videoDownloadAudioOnly => 'Apenas áudio';

  @override
  String get manageSubscriptions => 'Gerir subscrições';

  @override
  String get noSubscriptions =>
      'Sem subscrições, navegue pelos vídeos e subscreva qualquer canal de que goste.';

  @override
  String get youCanSubscribeAgainLater =>
      'Pode voltar a subscrever este canal mais tarde';

  @override
  String get unSubscribeQuestion => 'Cancelar a subscrição ?';

  @override
  String get clearHistoryQuestion => 'Limpar Histórico ?';

  @override
  String get clearHistoryQuestionExplanation =>
      'Isto irá limpar o histórico de visualizações da sua conta na instância Invidious que utiliza. Isto não pode ser desfeito.';

  @override
  String get noHistory =>
      'Sem histórico de visualizações, veja alguns vídeos e ele aparecerá aqui';

  @override
  String get homeLayoutEditor => 'Editar a disposição do Inicio';

  @override
  String get layoutEditorAddVideoSource => 'Adicionar fonte de vídeo';

  @override
  String get layoutEditorExplanation =>
      'Pode decidir o que apresentar no seu ecrã inicial, pode ter até 2 vistas pequenas com deslocação horizontal e uma fonte grande.';

  @override
  String get home => 'Início';

  @override
  String get library => 'Biblioteca';

  @override
  String get customizeAppLayout => 'Personalizar secções da aplicação';

  @override
  String get customizeAppLayoutExplanation =>
      'Selecione as secções que pretende que apareçam na barra de navegação principal da aplicação. Clique no ícone de início para selecionar o ecrã que aparece quando a aplicação é iniciada. Pode reordenar as secções arrastando-as.';

  @override
  String get navigationBarStyle => 'Estilo da barra de navegação';

  @override
  String get navigationBarLabelAlwaysShowing => 'Etiqueta sempre visível';

  @override
  String get navigationBarLabelShowOnSelect =>
      'Etiqueta apresentada no item selecionado';

  @override
  String get navigationBarLabelNeverShow => 'Nunca mostrar a etiqueta';

  @override
  String get distractionFreeMode => 'Modo sem distrações';

  @override
  String get distractionFreeModeDescription =>
      'Desativar comentários e recomendações de vídeo';

  @override
  String get secondsShortForm => 'segs';

  @override
  String get videoFilterApplyDateToFilter =>
      'Filtrar vídeos para datas fornecidas';

  @override
  String get videoFilterDayOfWeek => 'Selecionar dias para aplicar filtros';

  @override
  String get videoFilterDayOfWeekDescription =>
      'Você pode escolher, via seleção, dias da semana e horários para aplicar os filtros e, por exemplo, evitar spoilers de eventos esportivos.';

  @override
  String get videoFilterStartTime => 'Horário inicial';

  @override
  String get videoFilterEndTime => 'Horário final';

  @override
  String videoFilterAppliedOn(String selectedDays) {
    return 'Aplicado em $selectedDays';
  }

  @override
  String get from => 'de';

  @override
  String get to => 'até';

  @override
  String videoFilterTimeOfDayFromTo(String from, String to) {
    return 'De $from até $to';
  }

  @override
  String get notifications => 'Notificações';

  @override
  String get notificationsDescription =>
      'Ativar e rever as notificações que lhe são enviadas';

  @override
  String get enableNotificationDescriptions =>
      'Executa um serviço em primeiro plano para verificar e notificar o utilizador sobre as alterações que está a monitorizar';

  @override
  String get subscriptionNotification => 'Notificações de subscrição';

  @override
  String get subscriptionNotificationDescription =>
      'Receba notificações de novos vídeos do seu feed de subscrição se tiver sessão iniciada na sua instância atual';

  @override
  String get subscriptionNotificationTitle =>
      'Novos vídeos das suas subscrições';

  @override
  String subscriptionNotificationContent(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString vídeos novos',
      one: '1 vídeo novo',
      zero: 'nenhum vídeo novo',
    );
    return 'Existem $_temp0 no seu feed de subscrição';
  }

  @override
  String get askForDisableBatteryOptimizationTitle =>
      'Desativar a otimização da bateria necessária';

  @override
  String get askForDisableBatteryOptimizationContent =>
      'Para enviar notificações, o Clipious precisa de executar um serviço em segundo plano. Para que este funcione sem problemas, é necessário que o Clipious tenha uma utilização de bateria sem restrições. Ao tocar em ok, serão abertas as definições de otimização da bateria.';

  @override
  String get askToEnableBackgroundServiceTitle => 'Notificações desativadas';

  @override
  String get askToEnableBackgroundServiceContent =>
      'Para receber notificações, as notificações Clipious têm de estar ativadas, prima OK para as ativar.';

  @override
  String get otherNotifications =>
      'Outras fontes de notificações (ícones de sino)';

  @override
  String get deleteChannelNotificationTitle =>
      'Eliminar a notificação de canal?';

  @override
  String get deleteChannelNotificationContent =>
      'Não receberá mais notificações deste canal.';

  @override
  String get deletePlaylistNotificationTitle =>
      'Eliminar notificação de lista de reprodução ?';

  @override
  String get deletePlaylistNotificationContent =>
      'Não receberá mais notificações desta lista de reprodução.';

  @override
  String channelNotificationTitle(String channel) {
    return 'Novos vídeos do $channel';
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
      other: '$countString Esses são os novos videos',
      one: 'Um novo vídeo foi adicionado',
      zero: 'Ainda não tem novos videos',
    );
    return '$_temp0 em $channel';
  }

  @override
  String playlistNotificationTitle(String playlist) {
    return 'Novos vídeos na lista de reprodução $playlist';
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
      other: 'Há $countString Novos vídeos',
      one: 'Há 1 novo video',
      zero: 'Não há novos vídeos',
    );
    return '$_temp0 nesta $playlist playlist';
  }

  @override
  String get foregroundServiceNotificationTitle => 'Monitorização por vídeo';

  @override
  String foregroundServiceNotificationContent(String hours) {
    String _temp0 = intl.Intl.selectLogic(
      hours,
      {
        '1': 'por hora',
        '24': 'por dia',
        'other': 'a cada $hours horas',
      },
    );
    return 'Verificará a existência de novos vídeos uma vez $_temp0';
  }

  @override
  String get foregroundServiceUpdatingSubscriptions =>
      'Verificar as subscrições...';

  @override
  String get foregroundServiceUpdatingPlaylist =>
      'Verificando as novas listas de reprodução...';

  @override
  String get foregroundServiceUpdatingChannels => 'Verificar os canais...';

  @override
  String get notificationFrequencySettingsTitle =>
      'Nova frequência de verificação de vídeo';

  @override
  String get notificationFrequencySettingsDescription =>
      'Com que frequência a aplicação irá procurar novos vídeos';

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
  String get subtitlesBackground => 'Fundo das legendas';

  @override
  String get subtitlesBackgroundDescription =>
      'Adiciona um fundo preto às legendas para as tornar mais legíveis';

  @override
  String get history => 'Histórico';

  @override
  String get deArrowSettingDescription =>
      'Substituir títulos de clickbait e miniaturas';

  @override
  String get deArrowReplaceThumbnails => 'Substituir miniaturas';

  @override
  String get deArrowReplaceThumbnailsDescription =>
      'Substituir miniaturas de vídeo além dos títulos';

  @override
  String get deArrowWarning =>
      'Habilitar DeArrow pode reduzir significativamente a velocidade de navegação do aplicativo pelo motivo de pedidos adicionais ao banco de dados são necessários para cada vídeo único';

  @override
  String get copySettingsAsJson =>
      'Copiar as configurações como JSON para a área de transferência';

  @override
  String get copySettingsAsJsonDescription =>
      'Copie as configurações como JSON para auxiliar na depuração caso você encontre um problema com o aplicativo e decida reportar um problema';

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
      'Quanto mais você avançar, maior será o passo.';

  @override
  String get fullscreenOnLandscape => 'Tela cheia em modo paisagem';

  @override
  String get fullscreenOnLandscapeDescription =>
      'Alterar para tela cheia quando o dispositivo é rotacionado para o modo paisagem';

  @override
  String get enabled => 'Ativado';

  @override
  String get submitFeedback => 'Enviar feedback';

  @override
  String get submitFeedbackDescription =>
      'Encontrou um bug ou tem uma sugestão? Use esta ferramenta para tirar capturas de tela do aplicativo, fazer anotações e enviar feedbacks';

  @override
  String get feedbackDisclaimer =>
      'Para enviar feedback, você precisará de uma conta no GitHub, e sua captura de tela será enviada anonimamente para o Imgur.';

  @override
  String get feedbackScreenshotError =>
      'Erro ao enviar captura de tela para o Imgur';

  @override
  String get channelSortByNewest => 'Mais novo';

  @override
  String get channelSortByOldest => 'Mais velho';

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
