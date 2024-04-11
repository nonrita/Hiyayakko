import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_information_model.freezed.dart';

@freezed
class UserInformationModel with _$UserInformationModel {
  const factory UserInformationModel({
    @Default('') String email,
    @Default('') String password,
    @Default(null) String? name,
    @Default('男性') String gender,
    @Default('10代') String age,
    @Default(null) String? fridgeId,
  }) = _UserInformationModel;
}
