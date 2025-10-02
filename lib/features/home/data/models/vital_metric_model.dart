import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vital_metric.dart';

part 'vital_metric_model.freezed.dart';
part 'vital_metric_model.g.dart';

/// Data model for vital metric, extends the domain entity
@freezed
class VitalMetricModel with _$VitalMetricModel {
  const factory VitalMetricModel({
    required String id,
    required String name,
    required double value,
    required String unit,
    String? status,
    required DateTime timestamp,
    String? iconName,
  }) = _VitalMetricModel;

  const VitalMetricModel._();

  /// Create from domain entity
  factory VitalMetricModel.fromEntity(VitalMetric metric) {
    return VitalMetricModel(
      id: metric.id,
      name: metric.name,
      value: metric.value,
      unit: metric.unit,
      status: metric.status,
      timestamp: metric.timestamp,
      iconName: metric.iconName,
    );
  }

  /// Convert to domain entity
  VitalMetric toEntity() {
    return VitalMetric(
      id: id,
      name: name,
      value: value,
      unit: unit,
      status: status,
      timestamp: timestamp,
      iconName: iconName,
    );
  }

  /// Create from JSON
  factory VitalMetricModel.fromJson(Map<String, dynamic> json) =>
      _$$VitalMetricModelImplFromJson(json);

  /// Convert to JSON
  Map<String, dynamic> toJson() => _$$VitalMetricModelImplToJson(this as _$VitalMetricModelImpl);
}
