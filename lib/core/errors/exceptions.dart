class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, {this.code});

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException([String message = 'Network error occurred']) 
      : super(message, code: 'network_error');
}

class AuthException extends AppException {
  AuthException([String message = 'Authentication error occurred']) 
      : super(message, code: 'auth_error');
}

class NotFoundException extends AppException {
  NotFoundException([String message = 'Resource not found']) 
      : super(message, code: 'not_found');
}

class ValidationException extends AppException {
  ValidationException([String message = 'Validation error']) 
      : super(message, code: 'validation_error');
}

class ServerException extends AppException {
  ServerException([String message = 'Server error occurred']) 
      : super(message, code: 'server_error');
}

class PermissionException extends AppException {
  PermissionException([String message = 'Permission denied']) 
      : super(message, code: 'permission_denied');
}
