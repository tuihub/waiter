// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'netzach_bloc.dart';

class NetzachStateMapper extends ClassMapperBase<NetzachState> {
  NetzachStateMapper._();

  static NetzachStateMapper? _instance;
  static NetzachStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NetzachStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NetzachState';

  static List<NotifyTarget>? _$notifyTargets(NetzachState v) => v.notifyTargets;
  static const Field<NetzachState, List<NotifyTarget>> _f$notifyTargets =
      Field('notifyTargets', _$notifyTargets, opt: true);
  static List<NotifyFlow>? _$notifyFlows(NetzachState v) => v.notifyFlows;
  static const Field<NetzachState, List<NotifyFlow>> _f$notifyFlows =
      Field('notifyFlows', _$notifyFlows, opt: true);
  static int? _$notifyFlowEditIndex(NetzachState v) => v.notifyFlowEditIndex;
  static const Field<NetzachState, int> _f$notifyFlowEditIndex =
      Field('notifyFlowEditIndex', _$notifyFlowEditIndex, opt: true);
  static List<LogLevel> _$logLevelFilter(NetzachState v) => v.logLevelFilter;
  static const Field<NetzachState, List<LogLevel>> _f$logLevelFilter =
      Field('logLevelFilter', _$logLevelFilter, opt: true, def: const []);
  static List<String> _$serverLogFilter(NetzachState v) => v.serverLogFilter;
  static const Field<NetzachState, List<String>> _f$serverLogFilter =
      Field('serverLogFilter', _$serverLogFilter, opt: true, def: const []);

  @override
  final MappableFields<NetzachState> fields = const {
    #notifyTargets: _f$notifyTargets,
    #notifyFlows: _f$notifyFlows,
    #notifyFlowEditIndex: _f$notifyFlowEditIndex,
    #logLevelFilter: _f$logLevelFilter,
    #serverLogFilter: _f$serverLogFilter,
  };

  static NetzachState _instantiate(DecodingData data) {
    return NetzachState(
        notifyTargets: data.dec(_f$notifyTargets),
        notifyFlows: data.dec(_f$notifyFlows),
        notifyFlowEditIndex: data.dec(_f$notifyFlowEditIndex),
        logLevelFilter: data.dec(_f$logLevelFilter),
        serverLogFilter: data.dec(_f$serverLogFilter));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin NetzachStateMappable {
  NetzachStateCopyWith<NetzachState, NetzachState, NetzachState> get copyWith =>
      _NetzachStateCopyWithImpl<NetzachState, NetzachState>(
          this as NetzachState, $identity, $identity);
}

extension NetzachStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NetzachState, $Out> {
  NetzachStateCopyWith<$R, NetzachState, $Out> get $asNetzachState =>
      $base.as((v, t, t2) => _NetzachStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NetzachStateCopyWith<$R, $In extends NetzachState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, NotifyTarget,
      ObjectCopyWith<$R, NotifyTarget, NotifyTarget>>? get notifyTargets;
  ListCopyWith<$R, NotifyFlow, ObjectCopyWith<$R, NotifyFlow, NotifyFlow>>?
      get notifyFlows;
  ListCopyWith<$R, LogLevel, ObjectCopyWith<$R, LogLevel, LogLevel>>
      get logLevelFilter;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get serverLogFilter;
  $R call(
      {List<NotifyTarget>? notifyTargets,
      List<NotifyFlow>? notifyFlows,
      int? notifyFlowEditIndex,
      List<LogLevel>? logLevelFilter,
      List<String>? serverLogFilter});
  NetzachStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NetzachStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NetzachState, $Out>
    implements NetzachStateCopyWith<$R, NetzachState, $Out> {
  _NetzachStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NetzachState> $mapper =
      NetzachStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, NotifyTarget,
          ObjectCopyWith<$R, NotifyTarget, NotifyTarget>>?
      get notifyTargets => $value.notifyTargets != null
          ? ListCopyWith(
              $value.notifyTargets!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(notifyTargets: v))
          : null;
  @override
  ListCopyWith<$R, NotifyFlow, ObjectCopyWith<$R, NotifyFlow, NotifyFlow>>?
      get notifyFlows => $value.notifyFlows != null
          ? ListCopyWith(
              $value.notifyFlows!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(notifyFlows: v))
          : null;
  @override
  ListCopyWith<$R, LogLevel, ObjectCopyWith<$R, LogLevel, LogLevel>>
      get logLevelFilter => ListCopyWith(
          $value.logLevelFilter,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(logLevelFilter: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get serverLogFilter => ListCopyWith(
          $value.serverLogFilter,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(serverLogFilter: v));
  @override
  $R call(
          {Object? notifyTargets = $none,
          Object? notifyFlows = $none,
          Object? notifyFlowEditIndex = $none,
          List<LogLevel>? logLevelFilter,
          List<String>? serverLogFilter}) =>
      $apply(FieldCopyWithData({
        if (notifyTargets != $none) #notifyTargets: notifyTargets,
        if (notifyFlows != $none) #notifyFlows: notifyFlows,
        if (notifyFlowEditIndex != $none)
          #notifyFlowEditIndex: notifyFlowEditIndex,
        if (logLevelFilter != null) #logLevelFilter: logLevelFilter,
        if (serverLogFilter != null) #serverLogFilter: serverLogFilter
      }));
  @override
  NetzachState $make(CopyWithData data) => NetzachState(
      notifyTargets: data.get(#notifyTargets, or: $value.notifyTargets),
      notifyFlows: data.get(#notifyFlows, or: $value.notifyFlows),
      notifyFlowEditIndex:
          data.get(#notifyFlowEditIndex, or: $value.notifyFlowEditIndex),
      logLevelFilter: data.get(#logLevelFilter, or: $value.logLevelFilter),
      serverLogFilter: data.get(#serverLogFilter, or: $value.serverLogFilter));

  @override
  NetzachStateCopyWith<$R2, NetzachState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NetzachStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
