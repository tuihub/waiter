// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chesed_bloc.dart';

class ChesedStateMapper extends ClassMapperBase<ChesedState> {
  ChesedStateMapper._();

  static ChesedStateMapper? _instance;
  static ChesedStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChesedStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChesedState';

  static List<String>? _$imageUrls(ChesedState v) => v.imageUrls;
  static const Field<ChesedState, List<String>> _f$imageUrls =
      Field('imageUrls', _$imageUrls, opt: true);

  @override
  final MappableFields<ChesedState> fields = const {
    #imageUrls: _f$imageUrls,
  };

  static ChesedState _instantiate(DecodingData data) {
    return ChesedState(imageUrls: data.dec(_f$imageUrls));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin ChesedStateMappable {
  ChesedStateCopyWith<ChesedState, ChesedState, ChesedState> get copyWith =>
      _ChesedStateCopyWithImpl<ChesedState, ChesedState>(
          this as ChesedState, $identity, $identity);
}

extension ChesedStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChesedState, $Out> {
  ChesedStateCopyWith<$R, ChesedState, $Out> get $asChesedState =>
      $base.as((v, t, t2) => _ChesedStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChesedStateCopyWith<$R, $In extends ChesedState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get imageUrls;
  $R call({List<String>? imageUrls});
  ChesedStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChesedStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChesedState, $Out>
    implements ChesedStateCopyWith<$R, ChesedState, $Out> {
  _ChesedStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChesedState> $mapper =
      ChesedStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get imageUrls =>
      $value.imageUrls != null
          ? ListCopyWith(
              $value.imageUrls!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(imageUrls: v))
          : null;
  @override
  $R call({Object? imageUrls = $none}) => $apply(
      FieldCopyWithData({if (imageUrls != $none) #imageUrls: imageUrls}));
  @override
  ChesedState $make(CopyWithData data) =>
      ChesedState(imageUrls: data.get(#imageUrls, or: $value.imageUrls));

  @override
  ChesedStateCopyWith<$R2, ChesedState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChesedStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
