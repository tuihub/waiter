// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'main_bloc.dart';

class MainStateMapper extends ClassMapperBase<MainState> {
  MainStateMapper._();

  static MainStateMapper? _instance;
  static MainStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MainStateMapper._());
      ServerConfigMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MainState';

  static ThemeMode _$themeMode(MainState v) => v.themeMode;
  static const Field<MainState, ThemeMode> _f$themeMode =
      Field('themeMode', _$themeMode, opt: true, def: ThemeMode.system);
  static AppTheme _$theme(MainState v) => v.theme;
  static const Field<MainState, AppTheme> _f$theme =
      Field('theme', _$theme, opt: true, def: AppTheme.defaultTheme);
  static UIDesign _$uiDesign(MainState v) => v.uiDesign;
  static const Field<MainState, UIDesign> _f$uiDesign =
      Field('uiDesign', _$uiDesign, opt: true, def: UIDesign.material);
  static bool _$useSystemProxy(MainState v) => v.useSystemProxy;
  static const Field<MainState, bool> _f$useSystemProxy =
      Field('useSystemProxy', _$useSystemProxy, opt: true, def: false);
  static ServerID? _$currentServer(MainState v) => v.currentServer;
  static const Field<MainState, ServerID> _f$currentServer =
      Field('currentServer', _$currentServer, opt: true);
  static ConnectionStatus? _$currentConnectionStatus(MainState v) =>
      v.currentConnectionStatus;
  static const Field<MainState, ConnectionStatus> _f$currentConnectionStatus =
      Field('currentConnectionStatus', _$currentConnectionStatus, opt: true);
  static User? _$currentUser(MainState v) => v.currentUser;
  static const Field<MainState, User> _f$currentUser =
      Field('currentUser', _$currentUser, opt: true);
  static Map<ServerID, ServerConfig> _$knownServers(MainState v) =>
      v.knownServers;
  static const Field<MainState, Map<ServerID, ServerConfig>> _f$knownServers =
      Field('knownServers', _$knownServers, opt: true, def: const {});
  static Map<ServerID, ServerInformation> _$knownServerInfos(MainState v) =>
      v.knownServerInfos;
  static const Field<MainState, Map<ServerID, ServerInformation>>
      _f$knownServerInfos =
      Field('knownServerInfos', _$knownServerInfos, opt: true, def: const {});
  static Map<ServerID, FeatureSummary> _$knownServerFeatureSummaries(
          MainState v) =>
      v.knownServerFeatureSummaries;
  static const Field<MainState, Map<ServerID, FeatureSummary>>
      _f$knownServerFeatureSummaries = Field(
          'knownServerFeatureSummaries', _$knownServerFeatureSummaries,
          opt: true, def: const {});
  static Map<ServerID, ServerInstanceSummary> _$knownServerInstanceSummaries(
          MainState v) =>
      v.knownServerInstanceSummaries;
  static const Field<MainState, Map<ServerID, ServerInstanceSummary>>
      _f$knownServerInstanceSummaries = Field(
          'knownServerInstanceSummaries', _$knownServerInstanceSummaries,
          opt: true, def: const {});

  @override
  final MappableFields<MainState> fields = const {
    #themeMode: _f$themeMode,
    #theme: _f$theme,
    #uiDesign: _f$uiDesign,
    #useSystemProxy: _f$useSystemProxy,
    #currentServer: _f$currentServer,
    #currentConnectionStatus: _f$currentConnectionStatus,
    #currentUser: _f$currentUser,
    #knownServers: _f$knownServers,
    #knownServerInfos: _f$knownServerInfos,
    #knownServerFeatureSummaries: _f$knownServerFeatureSummaries,
    #knownServerInstanceSummaries: _f$knownServerInstanceSummaries,
  };

  static MainState _instantiate(DecodingData data) {
    return MainState(
        themeMode: data.dec(_f$themeMode),
        theme: data.dec(_f$theme),
        uiDesign: data.dec(_f$uiDesign),
        useSystemProxy: data.dec(_f$useSystemProxy),
        currentServer: data.dec(_f$currentServer),
        currentConnectionStatus: data.dec(_f$currentConnectionStatus),
        currentUser: data.dec(_f$currentUser),
        knownServers: data.dec(_f$knownServers),
        knownServerInfos: data.dec(_f$knownServerInfos),
        knownServerFeatureSummaries: data.dec(_f$knownServerFeatureSummaries),
        knownServerInstanceSummaries:
            data.dec(_f$knownServerInstanceSummaries));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin MainStateMappable {
  MainStateCopyWith<MainState, MainState, MainState> get copyWith =>
      _MainStateCopyWithImpl(this as MainState, $identity, $identity);
}

extension MainStateValueCopy<$R, $Out> on ObjectCopyWith<$R, MainState, $Out> {
  MainStateCopyWith<$R, MainState, $Out> get $asMainState =>
      $base.as((v, t, t2) => _MainStateCopyWithImpl(v, t, t2));
}

abstract class MainStateCopyWith<$R, $In extends MainState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, ServerID, ServerConfig,
      ServerConfigCopyWith<$R, ServerConfig, ServerConfig>> get knownServers;
  MapCopyWith<$R, ServerID, ServerInformation,
          ObjectCopyWith<$R, ServerInformation, ServerInformation>>
      get knownServerInfos;
  MapCopyWith<$R, ServerID, FeatureSummary,
          ObjectCopyWith<$R, FeatureSummary, FeatureSummary>>
      get knownServerFeatureSummaries;
  MapCopyWith<$R, ServerID, ServerInstanceSummary,
          ObjectCopyWith<$R, ServerInstanceSummary, ServerInstanceSummary>>
      get knownServerInstanceSummaries;
  $R call(
      {ThemeMode? themeMode,
      AppTheme? theme,
      UIDesign? uiDesign,
      bool? useSystemProxy,
      ServerID? currentServer,
      ConnectionStatus? currentConnectionStatus,
      User? currentUser,
      Map<ServerID, ServerConfig>? knownServers,
      Map<ServerID, ServerInformation>? knownServerInfos,
      Map<ServerID, FeatureSummary>? knownServerFeatureSummaries,
      Map<ServerID, ServerInstanceSummary>? knownServerInstanceSummaries});
  MainStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MainStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MainState, $Out>
    implements MainStateCopyWith<$R, MainState, $Out> {
  _MainStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MainState> $mapper =
      MainStateMapper.ensureInitialized();
  @override
  MapCopyWith<$R, ServerID, ServerConfig,
          ServerConfigCopyWith<$R, ServerConfig, ServerConfig>>
      get knownServers => MapCopyWith($value.knownServers,
          (v, t) => v.copyWith.$chain(t), (v) => call(knownServers: v));
  @override
  MapCopyWith<$R, ServerID, ServerInformation,
          ObjectCopyWith<$R, ServerInformation, ServerInformation>>
      get knownServerInfos => MapCopyWith(
          $value.knownServerInfos,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(knownServerInfos: v));
  @override
  MapCopyWith<$R, ServerID, FeatureSummary,
          ObjectCopyWith<$R, FeatureSummary, FeatureSummary>>
      get knownServerFeatureSummaries => MapCopyWith(
          $value.knownServerFeatureSummaries,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(knownServerFeatureSummaries: v));
  @override
  MapCopyWith<$R, ServerID, ServerInstanceSummary,
          ObjectCopyWith<$R, ServerInstanceSummary, ServerInstanceSummary>>
      get knownServerInstanceSummaries => MapCopyWith(
          $value.knownServerInstanceSummaries,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(knownServerInstanceSummaries: v));
  @override
  $R call(
          {ThemeMode? themeMode,
          AppTheme? theme,
          UIDesign? uiDesign,
          bool? useSystemProxy,
          Object? currentServer = $none,
          Object? currentConnectionStatus = $none,
          Object? currentUser = $none,
          Map<ServerID, ServerConfig>? knownServers,
          Map<ServerID, ServerInformation>? knownServerInfos,
          Map<ServerID, FeatureSummary>? knownServerFeatureSummaries,
          Map<ServerID, ServerInstanceSummary>?
              knownServerInstanceSummaries}) =>
      $apply(FieldCopyWithData({
        if (themeMode != null) #themeMode: themeMode,
        if (theme != null) #theme: theme,
        if (uiDesign != null) #uiDesign: uiDesign,
        if (useSystemProxy != null) #useSystemProxy: useSystemProxy,
        if (currentServer != $none) #currentServer: currentServer,
        if (currentConnectionStatus != $none)
          #currentConnectionStatus: currentConnectionStatus,
        if (currentUser != $none) #currentUser: currentUser,
        if (knownServers != null) #knownServers: knownServers,
        if (knownServerInfos != null) #knownServerInfos: knownServerInfos,
        if (knownServerFeatureSummaries != null)
          #knownServerFeatureSummaries: knownServerFeatureSummaries,
        if (knownServerInstanceSummaries != null)
          #knownServerInstanceSummaries: knownServerInstanceSummaries
      }));
  @override
  MainState $make(CopyWithData data) => MainState(
      themeMode: data.get(#themeMode, or: $value.themeMode),
      theme: data.get(#theme, or: $value.theme),
      uiDesign: data.get(#uiDesign, or: $value.uiDesign),
      useSystemProxy: data.get(#useSystemProxy, or: $value.useSystemProxy),
      currentServer: data.get(#currentServer, or: $value.currentServer),
      currentConnectionStatus: data.get(#currentConnectionStatus,
          or: $value.currentConnectionStatus),
      currentUser: data.get(#currentUser, or: $value.currentUser),
      knownServers: data.get(#knownServers, or: $value.knownServers),
      knownServerInfos:
          data.get(#knownServerInfos, or: $value.knownServerInfos),
      knownServerFeatureSummaries: data.get(#knownServerFeatureSummaries,
          or: $value.knownServerFeatureSummaries),
      knownServerInstanceSummaries: data.get(#knownServerInstanceSummaries,
          or: $value.knownServerInstanceSummaries));

  @override
  MainStateCopyWith<$R2, MainState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MainStateCopyWithImpl($value, $cast, t);
}
