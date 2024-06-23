import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '/core/user/domain/entites/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends UserEntity with _$UserModel {
  const factory UserModel({
    required String id,
    required int phoneNumber,
    String? email,
    String? firstName,
    String? lastName,
    String? nickName,
    String? streetAddress,
    String? state,
    int? postalCode,
    String? country,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
