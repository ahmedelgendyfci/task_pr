// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellness_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WellnessDataModelImpl _$$WellnessDataModelImplFromJson(
  Map<String, dynamic> json,
) => _$WellnessDataModelImpl(
  userProfile: UserProfileModel.fromJson(
    json['userProfile'] as Map<String, dynamic>,
  ),
  wellnessPercentage: (json['wellnessPercentage'] as num).toDouble(),
  vitals: (json['vitals'] as List<dynamic>)
      .map((e) => VitalMetricModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
  isConnected: json['isConnected'] as bool,
);

Map<String, dynamic> _$$WellnessDataModelImplToJson(
  _$WellnessDataModelImpl instance,
) => <String, dynamic>{
  'userProfile': instance.userProfile,
  'wellnessPercentage': instance.wellnessPercentage,
  'vitals': instance.vitals,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'isConnected': instance.isConnected,
};
