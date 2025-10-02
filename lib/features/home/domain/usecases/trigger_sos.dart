import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../repositories/home_repository.dart';

/// Use case to trigger SOS emergency alert
class TriggerSOS implements UseCaseVoidNoParams {
  final HomeRepository repository;

  TriggerSOS(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.triggerSOS();
  }
}
