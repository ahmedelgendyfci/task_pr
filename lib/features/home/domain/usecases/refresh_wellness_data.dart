import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../entities/wellness_data.dart';
import '../repositories/home_repository.dart';

/// Use case to refresh wellness data from remote source
class RefreshWellnessData implements UseCaseNoParams<WellnessData> {
  final HomeRepository repository;

  RefreshWellnessData(this.repository);

  @override
  Future<Either<Failure, WellnessData>> call() async {
    return await repository.refreshWellnessData();
  }
}
