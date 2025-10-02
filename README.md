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
- **Entities**: Core business objects
- **Repositories**: Abstract interfaces defining data operations
- **Use Cases**: Business logic implementation 

### 2. **Data Layer** (Data Management)
- **Models**: Data transfer objects with JSON serialization
- **Data Sources**: Local (cache) and remote (API) data sources
- **Repository Implementations**: Concrete implementations of domain repositories

### 3. **Presentation Layer** (UI)
- **Cubit**: State management using flutter_bloc
- **Pages**: Screen widgets
- **Widgets**: Reusable UI components 


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

## 🔧 Dependency Injection Setup

The dependency injection is configured in `core/injection.dart` using the `get_it` package:

## 📚 Best Practices

1. **Single Responsibility**: Each class has one reason to change
2. **Dependency Inversion**: Depend on abstractions, not concretions
3. **Error Handling**: Use Either type for explicit error handling
4. **Immutable State**: Use Equatable and Freezed for immutable objects
5. **Code Generation**: Leverage build_runner for boilerplate code

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

## 📖 Additional Resources

- [Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Bloc Documentation](https://bloclibrary.dev/)
- [Get It Documentation](https://pub.dev/packages/get_it)
- [Freezed Documentation](https://pub.dev/packages/freezed)

---

**Happy Coding! 🚀**
