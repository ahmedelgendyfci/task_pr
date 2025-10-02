import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

/// Base class for all use cases
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case that doesn't require parameters
abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}

/// Use case that returns void
abstract class UseCaseVoid<Params> {
  Future<Either<Failure, void>> call(Params params);
}

/// Use case that returns void and doesn't require parameters
abstract class UseCaseVoidNoParams {
  Future<Either<Failure, void>> call();
}

/// No parameters class for use cases that don't need parameters
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
