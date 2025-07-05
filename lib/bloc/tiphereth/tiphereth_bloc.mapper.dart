// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tiphereth_bloc.dart';

class TipherethStateMapper extends ClassMapperBase<TipherethState> {
  TipherethStateMapper._();

  static TipherethStateMapper? _instance;
  static TipherethStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TipherethStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TipherethState';

  static List<Account>? _$accounts(TipherethState v) => v.accounts;
  static const Field<TipherethState, List<Account>> _f$accounts =
      Field('accounts', _$accounts, opt: true);
  static List<PorterDigest>? _$porterGroups(TipherethState v) => v.porterGroups;
  static const Field<TipherethState, List<PorterDigest>> _f$porterGroups =
      Field('porterGroups', _$porterGroups, opt: true);
  static List<PorterContext>? _$porterContexts(TipherethState v) =>
      v.porterContexts;
  static const Field<TipherethState, List<PorterContext>> _f$porterContexts =
      Field('porterContexts', _$porterContexts, opt: true);
  static List<UserSession>? _$sessions(TipherethState v) => v.sessions;
  static const Field<TipherethState, List<UserSession>> _f$sessions =
      Field('sessions', _$sessions, opt: true);

  @override
  final MappableFields<TipherethState> fields = const {
    #accounts: _f$accounts,
    #porterGroups: _f$porterGroups,
    #porterContexts: _f$porterContexts,
    #sessions: _f$sessions,
  };

  static TipherethState _instantiate(DecodingData data) {
    return TipherethState(
        accounts: data.dec(_f$accounts),
        porterGroups: data.dec(_f$porterGroups),
        porterContexts: data.dec(_f$porterContexts),
        sessions: data.dec(_f$sessions));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin TipherethStateMappable {
  TipherethStateCopyWith<TipherethState, TipherethState, TipherethState>
      get copyWith =>
          _TipherethStateCopyWithImpl<TipherethState, TipherethState>(
              this as TipherethState, $identity, $identity);
}

extension TipherethStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TipherethState, $Out> {
  TipherethStateCopyWith<$R, TipherethState, $Out> get $asTipherethState =>
      $base.as((v, t, t2) => _TipherethStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TipherethStateCopyWith<$R, $In extends TipherethState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Account, ObjectCopyWith<$R, Account, Account>>? get accounts;
  ListCopyWith<$R, PorterDigest,
      ObjectCopyWith<$R, PorterDigest, PorterDigest>>? get porterGroups;
  ListCopyWith<$R, PorterContext,
      ObjectCopyWith<$R, PorterContext, PorterContext>>? get porterContexts;
  ListCopyWith<$R, UserSession, ObjectCopyWith<$R, UserSession, UserSession>>?
      get sessions;
  $R call(
      {List<Account>? accounts,
      List<PorterDigest>? porterGroups,
      List<PorterContext>? porterContexts,
      List<UserSession>? sessions});
  TipherethStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TipherethStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TipherethState, $Out>
    implements TipherethStateCopyWith<$R, TipherethState, $Out> {
  _TipherethStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TipherethState> $mapper =
      TipherethStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Account, ObjectCopyWith<$R, Account, Account>>?
      get accounts => $value.accounts != null
          ? ListCopyWith(
              $value.accounts!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(accounts: v))
          : null;
  @override
  ListCopyWith<$R, PorterDigest,
          ObjectCopyWith<$R, PorterDigest, PorterDigest>>?
      get porterGroups => $value.porterGroups != null
          ? ListCopyWith(
              $value.porterGroups!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(porterGroups: v))
          : null;
  @override
  ListCopyWith<$R, PorterContext,
          ObjectCopyWith<$R, PorterContext, PorterContext>>?
      get porterContexts => $value.porterContexts != null
          ? ListCopyWith(
              $value.porterContexts!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(porterContexts: v))
          : null;
  @override
  ListCopyWith<$R, UserSession, ObjectCopyWith<$R, UserSession, UserSession>>?
      get sessions => $value.sessions != null
          ? ListCopyWith(
              $value.sessions!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(sessions: v))
          : null;
  @override
  $R call(
          {Object? accounts = $none,
          Object? porterGroups = $none,
          Object? porterContexts = $none,
          Object? sessions = $none}) =>
      $apply(FieldCopyWithData({
        if (accounts != $none) #accounts: accounts,
        if (porterGroups != $none) #porterGroups: porterGroups,
        if (porterContexts != $none) #porterContexts: porterContexts,
        if (sessions != $none) #sessions: sessions
      }));
  @override
  TipherethState $make(CopyWithData data) => TipherethState(
      accounts: data.get(#accounts, or: $value.accounts),
      porterGroups: data.get(#porterGroups, or: $value.porterGroups),
      porterContexts: data.get(#porterContexts, or: $value.porterContexts),
      sessions: data.get(#sessions, or: $value.sessions));

  @override
  TipherethStateCopyWith<$R2, TipherethState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TipherethStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
