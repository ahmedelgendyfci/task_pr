import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/wellness_data.dart';

/// Repository interface for home/wellness operations
abstract class HomeRepository {
  /// Get current wellness data including user profile and vitals
  Future<Either<Failure, WellnessData>> getWellnessData();

  /// Refresh wellness data from remote source
  Future<Either<Failure, WellnessData>> refreshWellnessData();

  /// Trigger SOS emergency alert
  Future<Either<Failure, void>> triggerSOS();

  /// Get real-time vitals updates
  Stream<Either<Failure, WellnessData>> getWellnessDataStream();
}
