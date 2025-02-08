import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserDetailResponse {
  final String message;
  final UserDetail userDetail;
  final SocialHandles socialHandles;
  final int statusCode;

  UserDetailResponse({
    required this.message,
    required this.userDetail,
    required this.socialHandles,
    required this.statusCode,
  });

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailResponseToJson(this);
}

@JsonSerializable()
class UserDetail {
  final int id;
  final String username;
  final String email;
  final String phoneNumber;
  final String address;
  final String? profilePhoto; // Nullable field
  final String role;

  UserDetail({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    this.profilePhoto,
    required this.role,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}

@JsonSerializable()
class SocialHandles {
  final int id;
  final String youtube;
  final String facebook;
  final String instagram;

  SocialHandles({
    required this.id,
    required this.youtube,
    required this.facebook,
    required this.instagram,
  });

  factory SocialHandles.fromJson(Map<String, dynamic> json) =>
      _$SocialHandlesFromJson(json);

  Map<String, dynamic> toJson() => _$SocialHandlesToJson(this);
}
