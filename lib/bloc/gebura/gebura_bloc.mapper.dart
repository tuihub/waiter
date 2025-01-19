// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'gebura_bloc.dart';

class GeburaStateMapper extends ClassMapperBase<GeburaState> {
  GeburaStateMapper._();

  static GeburaStateMapper? _instance;
  static GeburaStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GeburaStateMapper._());
      ServerIDMapper.ensureInitialized();
      LibraryListItemMapper.ensureInitialized();
      LocalAppRunRecordMapper.ensureInitialized();
      LocalLibraryScanResultMapper.ensureInitialized();
      LibrarySettingsMapper.ensureInitialized();
      LocalAppMapper.ensureInitialized();
      LocalAppInstMapper.ensureInitialized();
      LocalAppInstLauncherMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GeburaState';

  static ServerID _$currentServer(GeburaState v) => v.currentServer;
  static const Field<GeburaState, ServerID> _f$currentServer = Field(
      'currentServer', _$currentServer,
      opt: true, def: const ServerID.local());
  static List<LibraryListItem> _$libraryListItems(GeburaState v) =>
      v.libraryListItems;
  static const Field<GeburaState, List<LibraryListItem>> _f$libraryListItems =
      Field('libraryListItems', _$libraryListItems, opt: true, def: const []);
  static Map<String, LocalAppRunRecord> _$runningInsts(GeburaState v) =>
      v.runningInsts;
  static const Field<GeburaState, Map<String, LocalAppRunRecord>>
      _f$runningInsts =
      Field('runningInsts', _$runningInsts, opt: true, def: const {});
  static Map<String, LocalLibraryScanResult> _$localLibraryScanResults(
          GeburaState v) =>
      v.localLibraryScanResults;
  static const Field<GeburaState, Map<String, LocalLibraryScanResult>>
      _f$localLibraryScanResults = Field(
          'localLibraryScanResults', _$localLibraryScanResults,
          opt: true, def: const {});
  static LibrarySettings? _$librarySettings(GeburaState v) => v.librarySettings;
  static const Field<GeburaState, LibrarySettings> _f$librarySettings =
      Field('librarySettings', _$librarySettings, opt: true);
  static Map<String, LocalApp> _$libraryApps(GeburaState v) => v.libraryApps;
  static const Field<GeburaState, Map<String, LocalApp>> _f$libraryApps =
      Field('libraryApps', _$libraryApps, opt: true, def: const {});
  static Map<String, LocalAppInst> _$localAppInsts(GeburaState v) =>
      v.localAppInsts;
  static const Field<GeburaState, Map<String, LocalAppInst>> _f$localAppInsts =
      Field('localAppInsts', _$localAppInsts, opt: true, def: const {});
  static Map<String, LocalAppInstLauncher> _$localAppInstLaunchers(
          GeburaState v) =>
      v.localAppInstLaunchers;
  static const Field<GeburaState, Map<String, LocalAppInstLauncher>>
      _f$localAppInstLaunchers = Field(
          'localAppInstLaunchers', _$localAppInstLaunchers,
          opt: true, def: const {});

  @override
  final MappableFields<GeburaState> fields = const {
    #currentServer: _f$currentServer,
    #libraryListItems: _f$libraryListItems,
    #runningInsts: _f$runningInsts,
    #localLibraryScanResults: _f$localLibraryScanResults,
    #librarySettings: _f$librarySettings,
    #libraryApps: _f$libraryApps,
    #localAppInsts: _f$localAppInsts,
    #localAppInstLaunchers: _f$localAppInstLaunchers,
  };

  static GeburaState _instantiate(DecodingData data) {
    return GeburaState(
        currentServer: data.dec(_f$currentServer),
        libraryListItems: data.dec(_f$libraryListItems),
        runningInsts: data.dec(_f$runningInsts),
        localLibraryScanResults: data.dec(_f$localLibraryScanResults),
        librarySettings: data.dec(_f$librarySettings),
        libraryApps: data.dec(_f$libraryApps),
        localAppInsts: data.dec(_f$localAppInsts),
        localAppInstLaunchers: data.dec(_f$localAppInstLaunchers));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin GeburaStateMappable {
  GeburaStateCopyWith<GeburaState, GeburaState, GeburaState> get copyWith =>
      _GeburaStateCopyWithImpl(this as GeburaState, $identity, $identity);
}

extension GeburaStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GeburaState, $Out> {
  GeburaStateCopyWith<$R, GeburaState, $Out> get $asGeburaState =>
      $base.as((v, t, t2) => _GeburaStateCopyWithImpl(v, t, t2));
}

abstract class GeburaStateCopyWith<$R, $In extends GeburaState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ServerIDCopyWith<$R, ServerID, ServerID> get currentServer;
  ListCopyWith<$R, LibraryListItem,
          LibraryListItemCopyWith<$R, LibraryListItem, LibraryListItem>>
      get libraryListItems;
  MapCopyWith<$R, String, LocalAppRunRecord,
          LocalAppRunRecordCopyWith<$R, LocalAppRunRecord, LocalAppRunRecord>>
      get runningInsts;
  MapCopyWith<
      $R,
      String,
      LocalLibraryScanResult,
      LocalLibraryScanResultCopyWith<$R, LocalLibraryScanResult,
          LocalLibraryScanResult>> get localLibraryScanResults;
  LibrarySettingsCopyWith<$R, LibrarySettings, LibrarySettings>?
      get librarySettings;
  MapCopyWith<$R, String, LocalApp, LocalAppCopyWith<$R, LocalApp, LocalApp>>
      get libraryApps;
  MapCopyWith<$R, String, LocalAppInst,
      LocalAppInstCopyWith<$R, LocalAppInst, LocalAppInst>> get localAppInsts;
  MapCopyWith<
      $R,
      String,
      LocalAppInstLauncher,
      LocalAppInstLauncherCopyWith<$R, LocalAppInstLauncher,
          LocalAppInstLauncher>> get localAppInstLaunchers;
  $R call(
      {ServerID? currentServer,
      List<LibraryListItem>? libraryListItems,
      Map<String, LocalAppRunRecord>? runningInsts,
      Map<String, LocalLibraryScanResult>? localLibraryScanResults,
      LibrarySettings? librarySettings,
      Map<String, LocalApp>? libraryApps,
      Map<String, LocalAppInst>? localAppInsts,
      Map<String, LocalAppInstLauncher>? localAppInstLaunchers});
  GeburaStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GeburaStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GeburaState, $Out>
    implements GeburaStateCopyWith<$R, GeburaState, $Out> {
  _GeburaStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GeburaState> $mapper =
      GeburaStateMapper.ensureInitialized();
  @override
  ServerIDCopyWith<$R, ServerID, ServerID> get currentServer =>
      $value.currentServer.copyWith.$chain((v) => call(currentServer: v));
  @override
  ListCopyWith<$R, LibraryListItem,
          LibraryListItemCopyWith<$R, LibraryListItem, LibraryListItem>>
      get libraryListItems => ListCopyWith($value.libraryListItems,
          (v, t) => v.copyWith.$chain(t), (v) => call(libraryListItems: v));
  @override
  MapCopyWith<$R, String, LocalAppRunRecord,
          LocalAppRunRecordCopyWith<$R, LocalAppRunRecord, LocalAppRunRecord>>
      get runningInsts => MapCopyWith($value.runningInsts,
          (v, t) => v.copyWith.$chain(t), (v) => call(runningInsts: v));
  @override
  MapCopyWith<
      $R,
      String,
      LocalLibraryScanResult,
      LocalLibraryScanResultCopyWith<$R, LocalLibraryScanResult,
          LocalLibraryScanResult>> get localLibraryScanResults => MapCopyWith(
      $value.localLibraryScanResults,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(localLibraryScanResults: v));
  @override
  LibrarySettingsCopyWith<$R, LibrarySettings, LibrarySettings>?
      get librarySettings => $value.librarySettings?.copyWith
          .$chain((v) => call(librarySettings: v));
  @override
  MapCopyWith<$R, String, LocalApp, LocalAppCopyWith<$R, LocalApp, LocalApp>>
      get libraryApps => MapCopyWith($value.libraryApps,
          (v, t) => v.copyWith.$chain(t), (v) => call(libraryApps: v));
  @override
  MapCopyWith<$R, String, LocalAppInst,
          LocalAppInstCopyWith<$R, LocalAppInst, LocalAppInst>>
      get localAppInsts => MapCopyWith($value.localAppInsts,
          (v, t) => v.copyWith.$chain(t), (v) => call(localAppInsts: v));
  @override
  MapCopyWith<
      $R,
      String,
      LocalAppInstLauncher,
      LocalAppInstLauncherCopyWith<$R, LocalAppInstLauncher,
          LocalAppInstLauncher>> get localAppInstLaunchers => MapCopyWith(
      $value.localAppInstLaunchers,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(localAppInstLaunchers: v));
  @override
  $R call(
          {ServerID? currentServer,
          List<LibraryListItem>? libraryListItems,
          Map<String, LocalAppRunRecord>? runningInsts,
          Map<String, LocalLibraryScanResult>? localLibraryScanResults,
          Object? librarySettings = $none,
          Map<String, LocalApp>? libraryApps,
          Map<String, LocalAppInst>? localAppInsts,
          Map<String, LocalAppInstLauncher>? localAppInstLaunchers}) =>
      $apply(FieldCopyWithData({
        if (currentServer != null) #currentServer: currentServer,
        if (libraryListItems != null) #libraryListItems: libraryListItems,
        if (runningInsts != null) #runningInsts: runningInsts,
        if (localLibraryScanResults != null)
          #localLibraryScanResults: localLibraryScanResults,
        if (librarySettings != $none) #librarySettings: librarySettings,
        if (libraryApps != null) #libraryApps: libraryApps,
        if (localAppInsts != null) #localAppInsts: localAppInsts,
        if (localAppInstLaunchers != null)
          #localAppInstLaunchers: localAppInstLaunchers
      }));
  @override
  GeburaState $make(CopyWithData data) => GeburaState(
      currentServer: data.get(#currentServer, or: $value.currentServer),
      libraryListItems:
          data.get(#libraryListItems, or: $value.libraryListItems),
      runningInsts: data.get(#runningInsts, or: $value.runningInsts),
      localLibraryScanResults: data.get(#localLibraryScanResults,
          or: $value.localLibraryScanResults),
      librarySettings: data.get(#librarySettings, or: $value.librarySettings),
      libraryApps: data.get(#libraryApps, or: $value.libraryApps),
      localAppInsts: data.get(#localAppInsts, or: $value.localAppInsts),
      localAppInstLaunchers:
          data.get(#localAppInstLaunchers, or: $value.localAppInstLaunchers));

  @override
  GeburaStateCopyWith<$R2, GeburaState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GeburaStateCopyWithImpl($value, $cast, t);
}
