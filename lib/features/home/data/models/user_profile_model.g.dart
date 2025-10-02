// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserProfileModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$$UserProfileModelImplToJson(
  _$UserProfileModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatarUrl': instance.avatarUrl,
  'email': instance.email,
};
