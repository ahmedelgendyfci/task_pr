import 'package:task_pr/core/utils/image_manager.dart';

import '../models/wellness_data_model.dart';
import '../models/user_profile_model.dart';
import '../models/vital_metric_model.dart';

/// Abstract class for remote data source operations
abstract class HomeRemoteDataSource {
  /// Get wellness data from remote server
  Future<WellnessDataModel> getWellnessData();

  /// Trigger SOS alert on remote server
  Future<void> triggerSOS();

  /// Get real-time vitals updates
  Stream<WellnessDataModel> getWellnessDataStream();
}

/// Implementation of remote data source with mock data
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  // Mock data for demonstration
  static const _mockUserProfile = UserProfileModel(
    id: 'user_001',
    name: 'Philipo Andrew',
    avatarUrl: null,
    email: 'philipo.andrew@example.com',
  );

  static final _mockVitals = [
    VitalMetricModel(
      id: 'temp_001',
      name: 'Body Temperature',
      value: 38,
      unit: '°',
      status: 'normal',
      timestamp: DateTime.now(),
      iconName: ImageManager.temp,
    ),
    VitalMetricModel(
      id: 'hr_001',
      name: 'Heart Rate/Min',
      value: 101,
      unit: '',
      status: 'normal',
      timestamp: DateTime.now(),
      iconName: ImageManager.heart,
    ),
    VitalMetricModel(
      id: 'spo2_001',
      name: 'Blood Oxygen Level',
      value: 99,
      unit: '',
      status: 'normal',
      timestamp: DateTime.now(),
      iconName: ImageManager.blood,
    ),
    VitalMetricModel(
      id: 'rr_001',
      name: 'Respiratory Rate',
      value: 15,
      unit: '',
      status: 'normal',
      timestamp: DateTime.now(),
      iconName: ImageManager.respiratory,
    ),
    VitalMetricModel(
      id: 'noise_001',
      name: 'Noise Level',
      value: 22,
      unit: '',
      status: 'normal',
      timestamp: DateTime.now(),
      iconName: ImageManager.noise,
    ),
    VitalMetricModel(
      id: 'stress_001',
      name: 'Stress Level',
      value: 15,
      unit: '',
      status: 'low',
      timestamp: DateTime.now(),
      iconName: ImageManager.stress,
    ),
  ];

  @override
  Future<WellnessDataModel> getWellnessData() async {
    return WellnessDataModel(
      userProfile: _mockUserProfile,
      wellnessPercentage: 78.0,
      vitals: _mockVitals,
      lastUpdated: DateTime.now(),
      isConnected: true,
    );
  }

  @override
  Future<void> triggerSOS() async {
    print('SOS Alert triggered successfully');
  }

  @override
  Stream<WellnessDataModel> getWellnessDataStream() async* {
    // Simulate real-time updates every 5 seconds
    while (true) {
      await Future.delayed(const Duration(seconds: 5));
      
      // Generate slightly different values for real-time effect
      final updatedVitals = _mockVitals.map((vital) {
        final randomVariation = (DateTime.now().millisecond % 10 - 5) * 0.1;
        return vital.copyWith(
          value: double.parse((vital.value + randomVariation).clamp(0, double.infinity).toStringAsFixed(2)),
          timestamp: DateTime.now(),
        );
      }).toList();
      
      yield WellnessDataModel(
        userProfile: _mockUserProfile,
        wellnessPercentage: 78.0 + (DateTime.now().millisecond % 10 - 5),
        vitals: updatedVitals,
        lastUpdated: DateTime.now(),
        isConnected: true,
      );
    }
  }
}
