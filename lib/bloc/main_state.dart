part of 'main_bloc.dart';

@MappableClass(generateMethods: GenerateMethods.copy)
class MainState with MainStateMappable {
  // client setting
  ThemeMode themeMode;
  AppTheme theme;
  UIDesign uiDesign;
  bool useSystemProxy;

  // server info
  ServerID? currentServer;
  ConnectionStatus? currentConnectionStatus;
  User? currentUser;
  Map<ServerID, ServerConfig> knownServers;
  Map<ServerID, ServerBinarySummary> knownServerInfos;
  Map<ServerID, FeatureSummary> knownServerFeatureSummaries;
  Map<ServerID, ServerInstanceSummary> knownServerInstanceSummaries;

  bool get isLocal => currentServer?.isLocal ?? true;
  bool get isNotLocal => !isLocal;
  ServerConfig? get serverConfig =>
      currentServer != null ? knownServers[currentServer!] : null;
  ServerBinarySummary? get serverInfo =>
      currentServer != null ? knownServerInfos[currentServer!] : null;
  FeatureSummary? get serverFeatureSummary => currentServer != null
      ? knownServerFeatureSummaries[currentServer!]
      : null;
  ServerInstanceSummary? get serverInstanceSummary => currentServer != null
      ? knownServerInstanceSummaries[currentServer!]
      : null;

  MainState({
    this.themeMode = ThemeMode.system,
    this.theme = AppTheme.defaultTheme,
    this.uiDesign = UIDesign.material,
    this.useSystemProxy = false,
    this.currentServer,
    this.currentConnectionStatus,
    this.currentUser,
    this.knownServers = const {},
    this.knownServerInfos = const {},
    this.knownServerFeatureSummaries = const {},
    this.knownServerInstanceSummaries = const {},
  });

  MainState.clone(MainState other)
      : themeMode = other.themeMode,
        theme = other.theme,
        uiDesign = other.uiDesign,
        useSystemProxy = other.useSystemProxy,
        currentServer = other.currentServer,
        currentConnectionStatus = other.currentConnectionStatus,
        currentUser = other.currentUser,
        knownServers = other.knownServers,
        knownServerInfos = other.knownServerInfos,
        knownServerFeatureSummaries = other.knownServerFeatureSummaries,
        knownServerInstanceSummaries = other.knownServerInstanceSummaries;
}

class MainEventState extends MainState with EventStatusMixin {
  MainEventState.clone(super.state, this.statusCode, {this.msg})
      : super.clone();

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class MainInitState extends MainEventState {
  MainInitState(super.state, super.statusCode, {super.msg}) : super.clone();
}

class MainGetServerInfoState extends MainEventState {
  MainGetServerInfoState(
    super.state,
    super.statusCode, {
    super.msg,
    this.delay,
  }) : super.clone();

  final int? delay;
}

class MainRefreshServerInfoState extends MainEventState {
  MainRefreshServerInfoState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class MainLoginState extends MainEventState {
  MainLoginState(super.state, super.statusCode, {super.msg}) : super.clone();
}

class MainNewServerSetState extends MainState {
  MainNewServerSetState(super.state) : super.clone();
}

class MainRegisterState extends MainEventState {
  MainRegisterState(
    super.state,
    super.statusCode, {
    super.msg,
    this.captchaID,
    this.captchaImage,
  }) : super.clone();

  final String? captchaID;
  final Uint8List? captchaImage;
}
