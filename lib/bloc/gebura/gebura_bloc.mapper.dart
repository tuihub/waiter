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
      LibraryListItemMapper.ensureInitialized();
      LocalAppInstRunRecordMapper.ensureInitialized();
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

  static bool _$initialized(GeburaState v) => v.initialized;
  static const Field<GeburaState, bool> _f$initialized =
      Field('initialized', _$initialized, opt: true, def: false);
  static List<LibraryListItem>? _$libraryListItems(GeburaState v) =>
      v.libraryListItems;
  static const Field<GeburaState, List<LibraryListItem>> _f$libraryListItems =
      Field('libraryListItems', _$libraryListItems, opt: true);
  static Map<String, LocalAppInstRunRecord> _$runningInsts(GeburaState v) =>
      v.runningInsts;
  static const Field<GeburaState, Map<String, LocalAppInstRunRecord>>
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
  static Map<String, LocalAppInst> _$libraryAppInsts(GeburaState v) =>
      v.libraryAppInsts;
  static const Field<GeburaState, Map<String, LocalAppInst>>
      _f$libraryAppInsts =
      Field('libraryAppInsts', _$libraryAppInsts, opt: true, def: const {});
  static Map<String, LocalAppInstLauncher> _$libraryAppInstLaunchers(
          GeburaState v) =>
      v.libraryAppInstLaunchers;
  static const Field<GeburaState, Map<String, LocalAppInstLauncher>>
      _f$libraryAppInstLaunchers = Field(
          'libraryAppInstLaunchers', _$libraryAppInstLaunchers,
          opt: true, def: const {});

  @override
  final MappableFields<GeburaState> fields = const {
    #initialized: _f$initialized,
    #libraryListItems: _f$libraryListItems,
    #runningInsts: _f$runningInsts,
    #localLibraryScanResults: _f$localLibraryScanResults,
    #librarySettings: _f$librarySettings,
    #libraryApps: _f$libraryApps,
    #libraryAppInsts: _f$libraryAppInsts,
    #libraryAppInstLaunchers: _f$libraryAppInstLaunchers,
  };

  static GeburaState _instantiate(DecodingData data) {
    return GeburaState(
        initialized: data.dec(_f$initialized),
        libraryListItems: data.dec(_f$libraryListItems),
        runningInsts: data.dec(_f$runningInsts),
        localLibraryScanResults: data.dec(_f$localLibraryScanResults),
        librarySettings: data.dec(_f$librarySettings),
        libraryApps: data.dec(_f$libraryApps),
        libraryAppInsts: data.dec(_f$libraryAppInsts),
        libraryAppInstLaunchers: data.dec(_f$libraryAppInstLaunchers));
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
  ListCopyWith<$R, LibraryListItem,
          LibraryListItemCopyWith<$R, LibraryListItem, LibraryListItem>>?
      get libraryListItems;
  MapCopyWith<
      $R,
      String,
      LocalAppInstRunRecord,
      LocalAppInstRunRecordCopyWith<$R, LocalAppInstRunRecord,
          LocalAppInstRunRecord>> get runningInsts;
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
      LocalAppInstCopyWith<$R, LocalAppInst, LocalAppInst>> get libraryAppInsts;
  MapCopyWith<
      $R,
      String,
      LocalAppInstLauncher,
      LocalAppInstLauncherCopyWith<$R, LocalAppInstLauncher,
          LocalAppInstLauncher>> get libraryAppInstLaunchers;
  $R call(
      {bool? initialized,
      List<LibraryListItem>? libraryListItems,
      Map<String, LocalAppInstRunRecord>? runningInsts,
      Map<String, LocalLibraryScanResult>? localLibraryScanResults,
      LibrarySettings? librarySettings,
      Map<String, LocalApp>? libraryApps,
      Map<String, LocalAppInst>? libraryAppInsts,
      Map<String, LocalAppInstLauncher>? libraryAppInstLaunchers});
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
  ListCopyWith<$R, LibraryListItem,
          LibraryListItemCopyWith<$R, LibraryListItem, LibraryListItem>>?
      get libraryListItems => $value.libraryListItems != null
          ? ListCopyWith($value.libraryListItems!,
              (v, t) => v.copyWith.$chain(t), (v) => call(libraryListItems: v))
          : null;
  @override
  MapCopyWith<
      $R,
      String,
      LocalAppInstRunRecord,
      LocalAppInstRunRecordCopyWith<$R, LocalAppInstRunRecord,
          LocalAppInstRunRecord>> get runningInsts => MapCopyWith(
      $value.runningInsts,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(runningInsts: v));
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
      get libraryAppInsts => MapCopyWith($value.libraryAppInsts,
          (v, t) => v.copyWith.$chain(t), (v) => call(libraryAppInsts: v));
  @override
  MapCopyWith<
      $R,
      String,
      LocalAppInstLauncher,
      LocalAppInstLauncherCopyWith<$R, LocalAppInstLauncher,
          LocalAppInstLauncher>> get libraryAppInstLaunchers => MapCopyWith(
      $value.libraryAppInstLaunchers,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(libraryAppInstLaunchers: v));
  @override
  $R call(
          {bool? initialized,
          Object? libraryListItems = $none,
          Map<String, LocalAppInstRunRecord>? runningInsts,
          Map<String, LocalLibraryScanResult>? localLibraryScanResults,
          Object? librarySettings = $none,
          Map<String, LocalApp>? libraryApps,
          Map<String, LocalAppInst>? libraryAppInsts,
          Map<String, LocalAppInstLauncher>? libraryAppInstLaunchers}) =>
      $apply(FieldCopyWithData({
        if (initialized != null) #initialized: initialized,
        if (libraryListItems != $none) #libraryListItems: libraryListItems,
        if (runningInsts != null) #runningInsts: runningInsts,
        if (localLibraryScanResults != null)
          #localLibraryScanResults: localLibraryScanResults,
        if (librarySettings != $none) #librarySettings: librarySettings,
        if (libraryApps != null) #libraryApps: libraryApps,
        if (libraryAppInsts != null) #libraryAppInsts: libraryAppInsts,
        if (libraryAppInstLaunchers != null)
          #libraryAppInstLaunchers: libraryAppInstLaunchers
      }));
  @override
  GeburaState $make(CopyWithData data) => GeburaState(
      initialized: data.get(#initialized, or: $value.initialized),
      libraryListItems:
          data.get(#libraryListItems, or: $value.libraryListItems),
      runningInsts: data.get(#runningInsts, or: $value.runningInsts),
      localLibraryScanResults: data.get(#localLibraryScanResults,
          or: $value.localLibraryScanResults),
      librarySettings: data.get(#librarySettings, or: $value.librarySettings),
      libraryApps: data.get(#libraryApps, or: $value.libraryApps),
      libraryAppInsts: data.get(#libraryAppInsts, or: $value.libraryAppInsts),
      libraryAppInstLaunchers: data.get(#libraryAppInstLaunchers,
          or: $value.libraryAppInstLaunchers));

  @override
  GeburaStateCopyWith<$R2, GeburaState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GeburaStateCopyWithImpl($value, $cast, t);
}
