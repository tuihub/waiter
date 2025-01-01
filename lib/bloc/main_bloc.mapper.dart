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

  static String? _$currentServer(MainState v) => v.currentServer;
  static const Field<MainState, String> _f$currentServer =
      Field('currentServer', _$currentServer, opt: true);
  static User? _$currentUser(MainState v) => v.currentUser;
  static const Field<MainState, User> _f$currentUser =
      Field('currentUser', _$currentUser, opt: true);
  static Map<String, ServerConfig> _$knownServers(MainState v) =>
      v.knownServers;
  static const Field<MainState, Map<String, ServerConfig>> _f$knownServers =
      Field('knownServers', _$knownServers, opt: true, def: const {});
  static Map<String, ServerInformation> _$knownServerInfos(MainState v) =>
      v.knownServerInfos;
  static const Field<MainState, Map<String, ServerInformation>>
      _f$knownServerInfos =
      Field('knownServerInfos', _$knownServerInfos, opt: true, def: const {});
  static Map<String, FeatureSummary> _$knownServerFeatureSummaries(
          MainState v) =>
      v.knownServerFeatureSummaries;
  static const Field<MainState, Map<String, FeatureSummary>>
      _f$knownServerFeatureSummaries = Field(
          'knownServerFeatureSummaries', _$knownServerFeatureSummaries,
          opt: true, def: const {});
  static Map<String, ServerInstanceSummary> _$knownServerInstanceSummaries(
          MainState v) =>
      v.knownServerInstanceSummaries;
  static const Field<MainState, Map<String, ServerInstanceSummary>>
      _f$knownServerInstanceSummaries = Field(
          'knownServerInstanceSummaries', _$knownServerInstanceSummaries,
          opt: true, def: const {});

  @override
  final MappableFields<MainState> fields = const {
    #currentServer: _f$currentServer,
    #currentUser: _f$currentUser,
    #knownServers: _f$knownServers,
    #knownServerInfos: _f$knownServerInfos,
    #knownServerFeatureSummaries: _f$knownServerFeatureSummaries,
    #knownServerInstanceSummaries: _f$knownServerInstanceSummaries,
  };

  static MainState _instantiate(DecodingData data) {
    return MainState(
        currentServer: data.dec(_f$currentServer),
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
  MapCopyWith<$R, String, ServerConfig,
      ServerConfigCopyWith<$R, ServerConfig, ServerConfig>> get knownServers;
  MapCopyWith<$R, String, ServerInformation,
          ObjectCopyWith<$R, ServerInformation, ServerInformation>>
      get knownServerInfos;
  MapCopyWith<$R, String, FeatureSummary,
          ObjectCopyWith<$R, FeatureSummary, FeatureSummary>>
      get knownServerFeatureSummaries;
  MapCopyWith<$R, String, ServerInstanceSummary,
          ObjectCopyWith<$R, ServerInstanceSummary, ServerInstanceSummary>>
      get knownServerInstanceSummaries;
  $R call(
      {String? currentServer,
      User? currentUser,
      Map<String, ServerConfig>? knownServers,
      Map<String, ServerInformation>? knownServerInfos,
      Map<String, FeatureSummary>? knownServerFeatureSummaries,
      Map<String, ServerInstanceSummary>? knownServerInstanceSummaries});
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
  MapCopyWith<$R, String, ServerConfig,
          ServerConfigCopyWith<$R, ServerConfig, ServerConfig>>
      get knownServers => MapCopyWith($value.knownServers,
          (v, t) => v.copyWith.$chain(t), (v) => call(knownServers: v));
  @override
  MapCopyWith<$R, String, ServerInformation,
          ObjectCopyWith<$R, ServerInformation, ServerInformation>>
      get knownServerInfos => MapCopyWith(
          $value.knownServerInfos,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(knownServerInfos: v));
  @override
  MapCopyWith<$R, String, FeatureSummary,
          ObjectCopyWith<$R, FeatureSummary, FeatureSummary>>
      get knownServerFeatureSummaries => MapCopyWith(
          $value.knownServerFeatureSummaries,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(knownServerFeatureSummaries: v));
  @override
  MapCopyWith<$R, String, ServerInstanceSummary,
          ObjectCopyWith<$R, ServerInstanceSummary, ServerInstanceSummary>>
      get knownServerInstanceSummaries => MapCopyWith(
          $value.knownServerInstanceSummaries,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(knownServerInstanceSummaries: v));
  @override
  $R call(
          {Object? currentServer = $none,
          Object? currentUser = $none,
          Map<String, ServerConfig>? knownServers,
          Map<String, ServerInformation>? knownServerInfos,
          Map<String, FeatureSummary>? knownServerFeatureSummaries,
          Map<String, ServerInstanceSummary>? knownServerInstanceSummaries}) =>
      $apply(FieldCopyWithData({
        if (currentServer != $none) #currentServer: currentServer,
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
      currentServer: data.get(#currentServer, or: $value.currentServer),
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
