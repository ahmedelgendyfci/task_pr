import 'package:equatable/equatable.dart';
import '../../domain/entities/wellness_data.dart';

/// States for the home cubit
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

/// Initial state when the cubit is first created
class HomeInitial extends HomeState {}

/// Loading state when an operation is in progress
class HomeLoading extends HomeState {}

/// Loaded state when wellness data is successfully retrieved
class HomeLoaded extends HomeState {
  final WellnessData wellnessData;

  const HomeLoaded({required this.wellnessData});

  @override
  List<Object> get props => [wellnessData];
}

/// Error state when an operation fails
class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}

/// SOS triggered state
class HomeSOSTriggered extends HomeState {
  final String message;

  const HomeSOSTriggered({required this.message});

  @override
  List<Object> get props => [message];
}
