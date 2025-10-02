// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_metric_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VitalMetricModelImpl _$$VitalMetricModelImplFromJson(
  Map<String, dynamic> json,
) => _$VitalMetricModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  value: (json['value'] as num).toDouble(),
  unit: json['unit'] as String,
  status: json['status'] as String?,
  timestamp: DateTime.parse(json['timestamp'] as String),
  iconName: json['iconName'] as String?,
);

Map<String, dynamic> _$$VitalMetricModelImplToJson(
  _$VitalMetricModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'value': instance.value,
  'unit': instance.unit,
  'status': instance.status,
  'timestamp': instance.timestamp.toIso8601String(),
  'iconName': instance.iconName,
};
