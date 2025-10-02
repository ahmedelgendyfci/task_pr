# Wellness Overview Flutter App

A Flutter project implementing Clean Architecture principles with a wellness monitoring interface. Features real-time vitals tracking, user profile management, and emergency SOS functionality with dependency injection and state management using Cubit.

## 🏗️ Architecture Overview

This project follows **Clean Architecture** principles, organizing code into three main layers:

### 📁 Project Structure

```
lib/
├── core/                           # Core functionality shared across features
│   ├── error/                      # Error handling
│   │   ├── exceptions.dart         # Custom exceptions
│   │   └── failures.dart           # Failure classes for error handling
│   ├── utils/                      # Utility classes and constants
│   │   ├── constants.dart          # App-wide constants
│   │   ├── typedefs.dart           # Type definitions
│   │   └── usecase.dart            # Base use case classes
│   └── injection.dart              # Dependency injection setup
├── features/                       # Feature-based modules
│   └── home/                       # Wellness overview feature
│       ├── data/                   # Data layer
│       │   ├── datasources/        # Data sources (local & remote)
│       │   ├── models/             # Data models
│       │   └── repositories/       # Repository implementations
│       ├── domain/                 # Domain layer (business logic)
│       │   ├── entities/           # Business entities
│       │   ├── repositories/       # Repository interfaces
│       │   └── usecases/           # Use cases (business logic)
│       └── presentation/           # Presentation layer (UI)
│           ├── cubit/              # State management
│           ├── pages/              # Screen widgets
│           └── widgets/            # Reusable UI components
└── main.dart                       # App entry point
```

## 🏛️ Clean Architecture Layers

### 1. **Domain Layer** (Business Logic)
- **Entities**: Core business objects (e.g., `WellnessData`, `VitalMetric`, `UserProfile`)
- **Repositories**: Abstract interfaces defining data operations
- **Use Cases**: Business logic implementation (e.g., `GetWellnessData`, `RefreshWellnessData`, `TriggerSOS`)

### 2. **Data Layer** (Data Management)
- **Models**: Data transfer objects with JSON serialization
- **Data Sources**: Local (cache) and remote (API) data sources
- **Repository Implementations**: Concrete implementations of domain repositories

### 3. **Presentation Layer** (UI)
- **Cubit**: State management using flutter_bloc
- **Pages**: Screen widgets (e.g., `HomePage`)
- **Widgets**: Reusable UI components (e.g., `VitalsListSection`, `SOSButtonSection`)

## 🛠️ Dependencies

### Core Dependencies
- **flutter_bloc**: State management
- **equatable**: Value equality for objects
- **get_it**: Dependency injection
- **dartz**: Functional programming (Either type for error handling)
- **freezed**: Code generation for immutable classes
- **json_annotation**: JSON serialization

### Development Dependencies
- **build_runner**: Code generation
- **json_serializable**: JSON serialization code generation

## 🚀 Getting Started

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Generate Code
```bash
flutter packages pub run build_runner build
```

### 3. Run the App
```bash
flutter run
```

## 📝 How to Add a New Feature

Follow these steps to add a new feature following Clean Architecture:

### Step 1: Create Feature Directory Structure
```
lib/features/your_feature/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── cubit/
    ├── pages/
    └── widgets/
```

### Step 2: Define Domain Layer
1. **Create Entity** (`domain/entities/your_entity.dart`):
```dart
import 'package:equatable/equatable.dart';

class YourEntity extends Equatable {
  final String id;
  final String name;
  
  const YourEntity({required this.id, required this.name});
  
  @override
  List<Object> get props => [id, name];
}
```

2. **Create Repository Interface** (`domain/repositories/your_repository.dart`):
```dart
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/your_entity.dart';

abstract class YourRepository {
  Future<Either<Failure, YourEntity>> getYourEntity(String id);
  Future<Either<Failure, List<YourEntity>>> getAllEntities();
}
```

3. **Create Use Cases** (`domain/usecases/get_your_entity.dart`):
```dart
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../entities/your_entity.dart';
import '../repositories/your_repository.dart';

class GetYourEntity implements UseCase<YourEntity, String> {
  final YourRepository repository;
  
  GetYourEntity(this.repository);
  
  @override
  Future<Either<Failure, YourEntity>> call(String params) async {
    return await repository.getYourEntity(params);
  }
}
```

### Step 3: Implement Data Layer
1. **Create Model** (`data/models/your_entity_model.dart`):
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/your_entity.dart';

part 'your_entity_model.freezed.dart';
part 'your_entity_model.g.dart';

@freezed
class YourEntityModel with _$YourEntityModel {
  const factory YourEntityModel({
    required String id,
    required String name,
  }) = _YourEntityModel;

  const YourEntityModel._();

  factory YourEntityModel.fromEntity(YourEntity entity) {
    return YourEntityModel(id: entity.id, name: entity.name);
  }

  YourEntity toEntity() {
    return YourEntity(id: id, name: name);
  }

  factory YourEntityModel.fromJson(Map<String, dynamic> json) =>
      _$YourEntityModelFromJson(json);

  Map<String, dynamic> toJson() => _$YourEntityModelToJson(this);
}
```

2. **Create Data Sources** (`data/datasources/your_local_datasource.dart`):
```dart
import '../models/your_entity_model.dart';

abstract class YourLocalDataSource {
  Future<YourEntityModel> getYourEntity(String id);
  Future<void> cacheYourEntity(YourEntityModel entity);
}

class YourLocalDataSourceImpl implements YourLocalDataSource {
  @override
  Future<YourEntityModel> getYourEntity(String id) async {
    // Implement local data retrieval
  }

  @override
  Future<void> cacheYourEntity(YourEntityModel entity) async {
    // Implement local caching
  }
}
```

3. **Implement Repository** (`data/repositories/your_repository_impl.dart`):
```dart
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/your_entity.dart';
import '../../domain/repositories/your_repository.dart';
import '../datasources/your_local_datasource.dart';
import '../datasources/your_remote_datasource.dart';
import '../models/your_entity_model.dart';

class YourRepositoryImpl implements YourRepository {
  final YourLocalDataSource localDataSource;
  final YourRemoteDataSource remoteDataSource;

  YourRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, YourEntity>> getYourEntity(String id) async {
    try {
      final model = await localDataSource.getYourEntity(id);
      return Right(model.toEntity());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
```

### Step 4: Create Presentation Layer
1. **Create Cubit** (`presentation/cubit/your_cubit.dart`):
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/your_entity.dart';
import '../../domain/usecases/get_your_entity.dart';
import 'your_state.dart';

class YourCubit extends Cubit<YourState> {
  final GetYourEntity getYourEntity;

  YourCubit({required this.getYourEntity}) : super(YourInitial());

  Future<void> loadYourEntity(String id) async {
    emit(YourLoading());
    
    final result = await getYourEntity(id);
    
    result.fold(
      (failure) => emit(YourError(message: failure.toString())),
      (entity) => emit(YourLoaded(entity: entity)),
    );
  }
}
```

2. **Create State** (`presentation/cubit/your_state.dart`):
```dart
import 'package:equatable/equatable.dart';
import '../../domain/entities/your_entity.dart';

abstract class YourState extends Equatable {
  const YourState();
}

class YourInitial extends YourState {
  @override
  List<Object> get props => [];
}

class YourLoading extends YourState {
  @override
  List<Object> get props => [];
}

class YourLoaded extends YourState {
  final YourEntity entity;
  
  const YourLoaded({required this.entity});
  
  @override
  List<Object> get props => [entity];
}

class YourError extends YourState {
  final String message;
  
  const YourError({required this.message});
  
  @override
  List<Object> get props => [message];
}
```

### Step 5: Register Dependencies
Add your feature dependencies to `core/injection.dart`:

```dart
//! Features - Your Feature
// Bloc
sl.registerFactory(() => YourCubit(getYourEntity: sl()));

// Use cases
sl.registerLazySingleton(() => GetYourEntity(sl()));

// Repository
sl.registerLazySingleton<YourRepository>(
  () => YourRepositoryImpl(
    localDataSource: sl(),
    remoteDataSource: sl(),
  ),
);

// Data sources
sl.registerLazySingleton<YourLocalDataSource>(
  () => YourLocalDataSourceImpl(),
);
sl.registerLazySingleton<YourRemoteDataSource>(
  () => YourRemoteDataSourceImpl(),
);
```

## 🔧 Dependency Injection Setup

The dependency injection is configured in `core/injection.dart` using the `get_it` package:

### Key Functions:
- `init()`: Initialize all dependencies
- `getCubit<T>()`: Get cubit instance
- `getUseCase<T>()`: Get use case instance
- `getRepository<T>()`: Get repository instance

### Registration Types:
- **Factory**: Creates new instance each time (for Cubits)
- **Lazy Singleton**: Creates instance only when first requested
- **Singleton**: Creates instance immediately

## 📱 Home Feature - Wellness Overview

The project includes a complete wellness monitoring feature demonstrating:

- **Entities**: `WellnessData`, `VitalMetric`, `UserProfile` with comprehensive health data
- **Use Cases**: `GetWellnessData`, `RefreshWellnessData`, `TriggerSOS`
- **Repository**: Handles both local cache and remote sync with real-time updates
- **Cubit**: Manages wellness state with loading, loaded, error, and SOS states
- **UI**: Modern wellness interface with real-time vitals, user profile, and emergency SOS

### Key Features:
- ✅ **User Profile Section**: Displays user name, avatar, and basic information
- ✅ **Wellness Percentage**: Circular progress indicator showing overall health status
- ✅ **Real-time Vitals**: Live monitoring of 6 key health metrics:
  - Body Temperature
  - Heart Rate/Min
  - Blood Oxygen Level
  - Respiratory Rate
  - Noise Level
  - Stress Level
- ✅ **Date & Time Display**: Current time and last update timestamp
- ✅ **SOS Emergency Button**: Slide-to-trigger emergency alert functionality
- ✅ **Connection Status**: Real-time connection indicator
- ✅ **Local Caching**: Offline support with cached data
- ✅ **Error Handling**: User-friendly error messages and retry functionality
- ✅ **Pull-to-Refresh**: Manual data refresh capability

## 🔧 Extending the Home Feature

### Adding a New Vital Metric

To add a new health metric to the wellness overview:

1. **Update the Mock Data** in `HomeRemoteDataSourceImpl`:
```dart
VitalMetricModel(
  id: 'new_metric_001',
  name: 'Blood Pressure',
  value: 120,
  unit: 'mmHg',
  status: 'normal',
  timestamp: DateTime.now(),
  iconName: 'blood_pressure',
),
```

2. **Add Icon Support** in `VitalsListSection`:
```dart
case 'blood pressure':
  return Icons.monitor_heart;
```

3. **Update Status Colors** if needed:
```dart
case 'high':
  return Colors.red;
case 'low':
  return Colors.blue;
```

### Replacing Mock Data with Real API

To connect to a real wellness monitoring API:

1. **Update Remote Data Source**:
```dart
@override
Future<WellnessDataModel> getWellnessData() async {
  final response = await httpClient.get('/api/wellness');
  return WellnessDataModel.fromJson(response.data);
}
```

2. **Add Authentication**:
```dart
@override
Future<WellnessDataModel> getWellnessData() async {
  final response = await httpClient.get(
    '/api/wellness',
    headers: {'Authorization': 'Bearer $token'},
  );
  return WellnessDataModel.fromJson(response.data);
}
```

3. **Handle Real-time Updates**:
```dart
@override
Stream<WellnessDataModel> getWellnessDataStream() async* {
  final stream = httpClient.get('/api/wellness/stream');
  await for (final data in stream) {
    yield WellnessDataModel.fromJson(data);
  }
}
```

### Customizing the UI

The UI components are modular and can be easily customized:

- **Colors**: Update the color scheme in each widget
- **Layout**: Modify the `HomePage` layout structure
- **Animations**: Add custom animations to the `SOSButtonSection`
- **Themes**: Create custom themes for different user preferences

## 🧪 Testing

The architecture supports easy testing:

- **Unit Tests**: Test use cases and repositories in isolation
- **Widget Tests**: Test UI components with mock cubits
- **Integration Tests**: Test complete user flows

## 📚 Best Practices

1. **Single Responsibility**: Each class has one reason to change
2. **Dependency Inversion**: Depend on abstractions, not concretions
3. **Error Handling**: Use Either type for explicit error handling
4. **Immutable State**: Use Equatable and Freezed for immutable objects
5. **Code Generation**: Leverage build_runner for boilerplate code
6. **Feature Isolation**: Each feature is self-contained

## 🔄 State Management Flow

```
UI Event → Cubit → Use Case → Repository → Data Source
    ↑                                              ↓
    ← State ← Either<Failure, Entity> ← Model ← Data
```

## 🚨 Error Handling

The app uses a comprehensive error handling strategy:

- **Failures**: Domain-level error representations
- **Exceptions**: Data-level error representations
- **Either Type**: Functional error handling with dartz
- **User-Friendly Messages**: Convert technical errors to user messages

## 📖 Additional Resources

- [Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Bloc Documentation](https://bloclibrary.dev/)
- [Get It Documentation](https://pub.dev/packages/get_it)
- [Freezed Documentation](https://pub.dev/packages/freezed)

---

**Happy Coding! 🚀**
