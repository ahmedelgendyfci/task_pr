import 'package:equatable/equatable.dart';
import 'user_profile.dart';
import 'vital_metric.dart';

/// Wellness data entity containing all health information
class WellnessData extends Equatable {
  final UserProfile userProfile;
  final double wellnessPercentage;
  final List<VitalMetric> vitals;
  final DateTime lastUpdated;
  final bool isConnected;

  const WellnessData({
    required this.userProfile,
    required this.wellnessPercentage,
    required this.vitals,
    required this.lastUpdated,
    required this.isConnected,
  });

  @override
  List<Object> get props => [userProfile, wellnessPercentage, vitals, lastUpdated, isConnected];

  @override
  String toString() => 'WellnessData(userProfile: $userProfile, wellnessPercentage: $wellnessPercentage, vitals: $vitals, lastUpdated: $lastUpdated, isConnected: $isConnected)';
}
