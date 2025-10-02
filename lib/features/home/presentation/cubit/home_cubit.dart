import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/wellness_data.dart';
import '../../domain/usecases/get_wellness_data.dart';
import '../../domain/usecases/refresh_wellness_data.dart';
import '../../domain/usecases/trigger_sos.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_state.dart';

/// Cubit for managing home/wellness state and business logic
class HomeCubit extends Cubit<HomeState> {
  final GetWellnessData getWellnessData;
  final RefreshWellnessData refreshWellnessData;
  final TriggerSOS triggerSOS;
  final HomeRepository repository;

  StreamSubscription<Either<dynamic, WellnessData>>? _wellnessStreamSubscription;

  HomeCubit({
    required this.getWellnessData,
    required this.refreshWellnessData,
    required this.triggerSOS,
    required this.repository,
  }) : super(HomeInitial());

  /// Load the current wellness data
  Future<void> loadWellnessData() async {
    emit(HomeLoading());
    
    final result = await getWellnessData();
    
    result.fold(
      (failure) => emit(HomeError(message: failure.toString())),
      (wellnessData) => emit(HomeLoaded(wellnessData: wellnessData)),
    );
  }

  /// Refresh wellness data from remote source
  Future<void> refreshData() async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      emit(HomeLoading());
    }
    
    final result = await refreshWellnessData();
    
    result.fold(
      (failure) => emit(HomeError(message: failure.toString())),
      (wellnessData) => emit(HomeLoaded(wellnessData: wellnessData)),
    );
  }

  /// Trigger SOS emergency alert
  Future<void> triggerSOSAlert( bool isTriggered, BuildContext context) async {
    if (isTriggered) {
      print('SOS Alert sent successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('SOS Alert sent successfully'),
          backgroundColor: Colors.green,
        ),
      );
      // emit(HomeSOSTriggered(message: 'SOS Alert sent successfully'));
    } else {
      print('SOS Alert cancelled');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('SOS Alert cancelled'),
          backgroundColor: Colors.red,
        ),
      );
      // emit(HomeSOSTriggered(message: 'SOS Alert cancelled'));
    }
  }

  /// Start listening to real-time wellness data updates
  void startRealTimeUpdates() {
    _wellnessStreamSubscription?.cancel();
    _wellnessStreamSubscription = repository.getWellnessDataStream().listen(
      (result) {
        result.fold(
          (failure) => emit(HomeError(message: failure.toString())),
          (wellnessData) => emit(HomeLoaded(wellnessData: wellnessData)),
        );
      },
      onError: (error) => emit(HomeError(message: error.toString())),
    );
  }

  /// Stop listening to real-time updates
  void stopRealTimeUpdates() {
    _wellnessStreamSubscription?.cancel();
    _wellnessStreamSubscription = null;
  }

  @override
  Future<void> close() {
    _wellnessStreamSubscription?.cancel();
    return super.close();
  }
}
