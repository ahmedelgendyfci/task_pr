import '../models/wellness_data_model.dart';

/// Abstract class for local data source operations
abstract class HomeLocalDataSource {
  /// Get cached wellness data from local storage
  Future<WellnessDataModel?> getCachedWellnessData();

  /// Cache wellness data to local storage
  Future<void> cacheWellnessData(WellnessDataModel data);

  /// Clear cached wellness data
  Future<void> clearCachedData();
}

/// Implementation of local data source
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  // In a real app, this would use SharedPreferences, Hive, or similar
  WellnessDataModel? _cachedData;

  @override
  Future<WellnessDataModel?> getCachedWellnessData() async {
    // Simulate async operation
    await Future.delayed(const Duration(milliseconds: 100));
    return _cachedData;
  }

  @override
  Future<void> cacheWellnessData(WellnessDataModel data) async {
    // Simulate async operation
    await Future.delayed(const Duration(milliseconds: 50));
    _cachedData = data;
  }

  @override
  Future<void> clearCachedData() async {
    // Simulate async operation
    await Future.delayed(const Duration(milliseconds: 50));
    _cachedData = null;
  }
}
