part of 'main_bloc.dart';

@MappableClass(generateMethods: GenerateMethods.copy)
class MainState with MainStateMappable {
  // client setting
  ThemeMode themeMode;
  AppTheme theme;
  UIDesign uiDesign;
  bool useSystemProxy;

  // server info
  String? currentServer;
  User? currentUser;
  Map<String, ServerConfig> knownServers;
  Map<String, ServerInformation> knownServerInfos;
  Map<String, FeatureSummary> knownServerFeatureSummaries;
  Map<String, ServerInstanceSummary> knownServerInstanceSummaries;

  ServerConfig? get serverConfig =>
      currentServer != null ? knownServers[currentServer!] : null;
  ServerInformation? get serverInfo =>
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
    this.currentUser,
    this.knownServers = const {},
    this.knownServerInfos = const {},
    this.knownServerFeatureSummaries = const {},
    this.knownServerInstanceSummaries = const {},
  });

  void _from(MainState other) {
    themeMode = other.themeMode;
    theme = other.theme;
    uiDesign = other.uiDesign;
    useSystemProxy = other.useSystemProxy;
    currentServer = other.currentServer;
    currentUser = other.currentUser;
    knownServers = other.knownServers;
    knownServerInfos = other.knownServerInfos;
    knownServerFeatureSummaries = other.knownServerFeatureSummaries;
    knownServerInstanceSummaries = other.knownServerInstanceSummaries;
  }
}

class MainInitState extends MainState with EventStatusMixin {
  MainInitState(MainState state, this.statusCode, {this.msg}) : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class MainManualLoginState extends MainState with EventStatusMixin {
  MainManualLoginState(MainState state, this.statusCode, {this.msg}) : super() {
    _from(state);
  }

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class MainNewServerSetState extends MainState {
  MainNewServerSetState(MainState state) : super() {
    _from(state);
  }
}

class MainRegisterState extends MainState with EventStatusMixin {
  MainRegisterState(MainState state, this.statusCode,
      {this.msg, this.captchaID, this.captchaImage})
      : super() {
    _from(state);
  }

  final String? captchaID;
  final Uint8List? captchaImage;

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}
