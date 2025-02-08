// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailResponse _$UserDetailResponseFromJson(Map<String, dynamic> json) =>
    UserDetailResponse(
      message: json['message'] as String,
      userDetail:
          UserDetail.fromJson(json['userDetail'] as Map<String, dynamic>),
      socialHandles:
          SocialHandles.fromJson(json['socialHandles'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num).toInt(),
    );

Map<String, dynamic> _$UserDetailResponseToJson(UserDetailResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'userDetail': instance.userDetail,
      'socialHandles': instance.socialHandles,
      'statusCode': instance.statusCode,
    };

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      profilePhoto: json['profilePhoto'] as String?,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'profilePhoto': instance.profilePhoto,
      'role': instance.role,
    };

SocialHandles _$SocialHandlesFromJson(Map<String, dynamic> json) =>
    SocialHandles(
      id: (json['id'] as num).toInt(),
      youtube: json['youtube'] as String,
      facebook: json['facebook'] as String,
      instagram: json['instagram'] as String,
    );

Map<String, dynamic> _$SocialHandlesToJson(SocialHandles instance) =>
    <String, dynamic>{
      'id': instance.id,
      'youtube': instance.youtube,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
    };
