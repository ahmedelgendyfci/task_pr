import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/wellness_data.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_datasource.dart';
import '../datasources/home_remote_datasource.dart';

/// Implementation of the home repository
class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, WellnessData>> getWellnessData() async {
    try {
      // Try to get from local cache first
      // final cachedData = await localDataSource.getCachedWellnessData();
      // if (cachedData != null) {
      //   return Right(cachedData.toEntity());
      // }
      
      // If no cached data, fetch from remote
      return await refreshWellnessData();
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WellnessData>> refreshWellnessData() async {
    try {
      // Fetch from remote
      final remoteData = await remoteDataSource.getWellnessData();
      
      // Cache the data locally
      // await localDataSource.cacheWellnessData(remoteData);
      
      return Right(remoteData.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> triggerSOS() async {
    try {
      await remoteDataSource.triggerSOS();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, WellnessData>> getWellnessDataStream() async* {
    try {
      await for (final data in remoteDataSource.getWellnessDataStream()) {
        // Cache each update locally
        // await localDataSource.cacheWellnessData(data);
        yield Right(data.toEntity());
      }
    } on ServerException catch (e) {
      yield Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      yield Left(NetworkFailure(message: e.message));
    } catch (e) {
      yield Left(UnknownFailure(message: e.toString()));
    }
  }
}
