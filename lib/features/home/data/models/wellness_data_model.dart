import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/wellness_data.dart';
import 'user_profile_model.dart';
import 'vital_metric_model.dart';

part 'wellness_data_model.freezed.dart';
part 'wellness_data_model.g.dart';

/// Data model for wellness data, extends the domain entity
@freezed
class WellnessDataModel with _$WellnessDataModel {
  const factory WellnessDataModel({
    required UserProfileModel userProfile,
    required double wellnessPercentage,
    required List<VitalMetricModel> vitals,
    required DateTime lastUpdated,
    required bool isConnected,
  }) = _WellnessDataModel;

  const WellnessDataModel._();

  /// Create from domain entity
  factory WellnessDataModel.fromEntity(WellnessData data) {
    return WellnessDataModel(
      userProfile: UserProfileModel.fromEntity(data.userProfile),
      wellnessPercentage: data.wellnessPercentage,
      vitals: data.vitals.map((v) => VitalMetricModel.fromEntity(v)).toList(),
      lastUpdated: data.lastUpdated,
      isConnected: data.isConnected,
    );
  }

  /// Convert to domain entity
  WellnessData toEntity() {
    return WellnessData(
      userProfile: userProfile.toEntity(),
      wellnessPercentage: wellnessPercentage,
      vitals: vitals.map((v) => v.toEntity()).toList(),
      lastUpdated: lastUpdated,
      isConnected: isConnected,
    );
  }

  /// Create from JSON
  factory WellnessDataModel.fromJson(Map<String, dynamic> json) =>
      _$$WellnessDataModelImplFromJson(json);

  /// Convert to JSON
  Map<String, dynamic> toJson() => _$$WellnessDataModelImplToJson(this as _$WellnessDataModelImpl);
}
