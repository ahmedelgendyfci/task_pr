import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../entities/wellness_data.dart';
import '../repositories/home_repository.dart';

/// Use case to get current wellness data
class GetWellnessData implements UseCaseNoParams<WellnessData> {
  final HomeRepository repository;

  GetWellnessData(this.repository);

  @override
  Future<Either<Failure, WellnessData>> call() async {
    return await repository.getWellnessData();
  }
}
