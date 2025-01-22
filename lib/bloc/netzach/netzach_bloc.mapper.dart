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
  static List<SystemNotification>? _$systemNotifications(NetzachState v) =>
      v.systemNotifications;
  static const Field<NetzachState, List<SystemNotification>>
      _f$systemNotifications =
      Field('systemNotifications', _$systemNotifications, opt: true);
  static SystemNotificationFilter? _$systemNotificationFilter(NetzachState v) =>
      v.systemNotificationFilter;
  static const Field<NetzachState, SystemNotificationFilter>
      _f$systemNotificationFilter =
      Field('systemNotificationFilter', _$systemNotificationFilter, opt: true);

  @override
  final MappableFields<NetzachState> fields = const {
    #notifyTargets: _f$notifyTargets,
    #notifyFlows: _f$notifyFlows,
    #notifyFlowEditIndex: _f$notifyFlowEditIndex,
    #systemNotifications: _f$systemNotifications,
    #systemNotificationFilter: _f$systemNotificationFilter,
  };

  static NetzachState _instantiate(DecodingData data) {
    return NetzachState(
        notifyTargets: data.dec(_f$notifyTargets),
        notifyFlows: data.dec(_f$notifyFlows),
        notifyFlowEditIndex: data.dec(_f$notifyFlowEditIndex),
        systemNotifications: data.dec(_f$systemNotifications),
        systemNotificationFilter: data.dec(_f$systemNotificationFilter));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin NetzachStateMappable {
  NetzachStateCopyWith<NetzachState, NetzachState, NetzachState> get copyWith =>
      _NetzachStateCopyWithImpl(this as NetzachState, $identity, $identity);
}

extension NetzachStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NetzachState, $Out> {
  NetzachStateCopyWith<$R, NetzachState, $Out> get $asNetzachState =>
      $base.as((v, t, t2) => _NetzachStateCopyWithImpl(v, t, t2));
}

abstract class NetzachStateCopyWith<$R, $In extends NetzachState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, NotifyTarget,
      ObjectCopyWith<$R, NotifyTarget, NotifyTarget>>? get notifyTargets;
  ListCopyWith<$R, NotifyFlow, ObjectCopyWith<$R, NotifyFlow, NotifyFlow>>?
      get notifyFlows;
  ListCopyWith<$R, SystemNotification,
          ObjectCopyWith<$R, SystemNotification, SystemNotification>>?
      get systemNotifications;
  $R call(
      {List<NotifyTarget>? notifyTargets,
      List<NotifyFlow>? notifyFlows,
      int? notifyFlowEditIndex,
      List<SystemNotification>? systemNotifications,
      SystemNotificationFilter? systemNotificationFilter});
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
  ListCopyWith<$R, SystemNotification,
          ObjectCopyWith<$R, SystemNotification, SystemNotification>>?
      get systemNotifications => $value.systemNotifications != null
          ? ListCopyWith(
              $value.systemNotifications!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(systemNotifications: v))
          : null;
  @override
  $R call(
          {Object? notifyTargets = $none,
          Object? notifyFlows = $none,
          Object? notifyFlowEditIndex = $none,
          Object? systemNotifications = $none,
          Object? systemNotificationFilter = $none}) =>
      $apply(FieldCopyWithData({
        if (notifyTargets != $none) #notifyTargets: notifyTargets,
        if (notifyFlows != $none) #notifyFlows: notifyFlows,
        if (notifyFlowEditIndex != $none)
          #notifyFlowEditIndex: notifyFlowEditIndex,
        if (systemNotifications != $none)
          #systemNotifications: systemNotifications,
        if (systemNotificationFilter != $none)
          #systemNotificationFilter: systemNotificationFilter
      }));
  @override
  NetzachState $make(CopyWithData data) => NetzachState(
      notifyTargets: data.get(#notifyTargets, or: $value.notifyTargets),
      notifyFlows: data.get(#notifyFlows, or: $value.notifyFlows),
      notifyFlowEditIndex:
          data.get(#notifyFlowEditIndex, or: $value.notifyFlowEditIndex),
      systemNotifications:
          data.get(#systemNotifications, or: $value.systemNotifications),
      systemNotificationFilter: data.get(#systemNotificationFilter,
          or: $value.systemNotificationFilter));

  @override
  NetzachStateCopyWith<$R2, NetzachState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NetzachStateCopyWithImpl($value, $cast, t);
}
