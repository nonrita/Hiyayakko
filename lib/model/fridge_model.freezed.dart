// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fridge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FridgeModel {
  String? get name => throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get inFridge => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FridgeModelCopyWith<FridgeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridgeModelCopyWith<$Res> {
  factory $FridgeModelCopyWith(
          FridgeModel value, $Res Function(FridgeModel) then) =
      _$FridgeModelCopyWithImpl<$Res, FridgeModel>;
  @useResult
  $Res call({String? name, Map<dynamic, dynamic> inFridge});
}

/// @nodoc
class _$FridgeModelCopyWithImpl<$Res, $Val extends FridgeModel>
    implements $FridgeModelCopyWith<$Res> {
  _$FridgeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? inFridge = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      inFridge: null == inFridge
          ? _value.inFridge
          : inFridge // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FridgeModelCopyWith<$Res>
    implements $FridgeModelCopyWith<$Res> {
  factory _$$_FridgeModelCopyWith(
          _$_FridgeModel value, $Res Function(_$_FridgeModel) then) =
      __$$_FridgeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, Map<dynamic, dynamic> inFridge});
}

/// @nodoc
class __$$_FridgeModelCopyWithImpl<$Res>
    extends _$FridgeModelCopyWithImpl<$Res, _$_FridgeModel>
    implements _$$_FridgeModelCopyWith<$Res> {
  __$$_FridgeModelCopyWithImpl(
      _$_FridgeModel _value, $Res Function(_$_FridgeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? inFridge = null,
  }) {
    return _then(_$_FridgeModel(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      inFridge: null == inFridge
          ? _value._inFridge
          : inFridge // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc

class _$_FridgeModel implements _FridgeModel {
  const _$_FridgeModel(
      {this.name = null, final Map<dynamic, dynamic> inFridge = const {}})
      : _inFridge = inFridge;

  @override
  @JsonKey()
  final String? name;
  final Map<dynamic, dynamic> _inFridge;
  @override
  @JsonKey()
  Map<dynamic, dynamic> get inFridge {
    if (_inFridge is EqualUnmodifiableMapView) return _inFridge;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_inFridge);
  }

  @override
  String toString() {
    return 'FridgeModel(name: $name, inFridge: $inFridge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FridgeModel &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._inFridge, _inFridge));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_inFridge));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FridgeModelCopyWith<_$_FridgeModel> get copyWith =>
      __$$_FridgeModelCopyWithImpl<_$_FridgeModel>(this, _$identity);
}

abstract class _FridgeModel implements FridgeModel {
  const factory _FridgeModel(
      {final String? name,
      final Map<dynamic, dynamic> inFridge}) = _$_FridgeModel;

  @override
  String? get name;
  @override
  Map<dynamic, dynamic> get inFridge;
  @override
  @JsonKey(ignore: true)
  _$$_FridgeModelCopyWith<_$_FridgeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
