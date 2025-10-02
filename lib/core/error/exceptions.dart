/// Base class for all exceptions in the application
abstract class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, [this.code]);

  @override
  String toString() => 'AppException: $message';
}

/// Server-related exceptions
class ServerException extends AppException {
  const ServerException(super.message, [super.code]);
}

/// Cache-related exceptions
class CacheException extends AppException {
  const CacheException(super.message, [super.code]);
}

/// Network-related exceptions
class NetworkException extends AppException {
  const NetworkException(super.message, [super.code]);
}

/// Validation-related exceptions
class ValidationException extends AppException {
  const ValidationException(super.message, [super.code]);
}
