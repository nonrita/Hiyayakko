import 'package:freezed_annotation/freezed_annotation.dart';

part 'fridge_model.freezed.dart';

@freezed
class FridgeModel with _$FridgeModel {
  const factory FridgeModel({
    @Default(null) String? name,
    @Default({}) Map inFridge,
  }) = _FridgeModel;
}
