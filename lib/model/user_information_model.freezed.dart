// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_information_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserInformationModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String? get fridgeId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserInformationModelCopyWith<UserInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInformationModelCopyWith<$Res> {
  factory $UserInformationModelCopyWith(UserInformationModel value,
          $Res Function(UserInformationModel) then) =
      _$UserInformationModelCopyWithImpl<$Res, UserInformationModel>;
  @useResult
  $Res call(
      {String email,
      String password,
      String? name,
      String gender,
      String age,
      String? fridgeId});
}

/// @nodoc
class _$UserInformationModelCopyWithImpl<$Res,
        $Val extends UserInformationModel>
    implements $UserInformationModelCopyWith<$Res> {
  _$UserInformationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = freezed,
    Object? gender = null,
    Object? age = null,
    Object? fridgeId = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      fridgeId: freezed == fridgeId
          ? _value.fridgeId
          : fridgeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInformationModelCopyWith<$Res>
    implements $UserInformationModelCopyWith<$Res> {
  factory _$$_UserInformationModelCopyWith(_$_UserInformationModel value,
          $Res Function(_$_UserInformationModel) then) =
      __$$_UserInformationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String? name,
      String gender,
      String age,
      String? fridgeId});
}

/// @nodoc
class __$$_UserInformationModelCopyWithImpl<$Res>
    extends _$UserInformationModelCopyWithImpl<$Res, _$_UserInformationModel>
    implements _$$_UserInformationModelCopyWith<$Res> {
  __$$_UserInformationModelCopyWithImpl(_$_UserInformationModel _value,
      $Res Function(_$_UserInformationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = freezed,
    Object? gender = null,
    Object? age = null,
    Object? fridgeId = freezed,
  }) {
    return _then(_$_UserInformationModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      fridgeId: freezed == fridgeId
          ? _value.fridgeId
          : fridgeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserInformationModel implements _UserInformationModel {
  const _$_UserInformationModel(
      {this.email = '',
      this.password = '',
      this.name = null,
      this.gender = '男性',
      this.age = '10代',
      this.fridgeId = null});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String gender;
  @override
  @JsonKey()
  final String age;
  @override
  @JsonKey()
  final String? fridgeId;

  @override
  String toString() {
    return 'UserInformationModel(email: $email, password: $password, name: $name, gender: $gender, age: $age, fridgeId: $fridgeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInformationModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.fridgeId, fridgeId) ||
                other.fridgeId == fridgeId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, name, gender, age, fridgeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInformationModelCopyWith<_$_UserInformationModel> get copyWith =>
      __$$_UserInformationModelCopyWithImpl<_$_UserInformationModel>(
          this, _$identity);
}

abstract class _UserInformationModel implements UserInformationModel {
  const factory _UserInformationModel(
      {final String email,
      final String password,
      final String? name,
      final String gender,
      final String age,
      final String? fridgeId}) = _$_UserInformationModel;

  @override
  String get email;
  @override
  String get password;
  @override
  String? get name;
  @override
  String get gender;
  @override
  String get age;
  @override
  String? get fridgeId;
  @override
  @JsonKey(ignore: true)
  _$$_UserInformationModelCopyWith<_$_UserInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
