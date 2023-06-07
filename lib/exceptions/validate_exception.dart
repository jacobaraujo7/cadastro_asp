class AppException implements Exception {
  final String message;
  late StackTrace stackTrace;

  AppException(this.message, [StackTrace? stackTrace]) {
    this.stackTrace = stackTrace ?? StackTrace.current;
  }
}

class ValidateException extends AppException {
  ValidateException(super.message);
}

extension ValidateExceptionExtension on String {
  ValidateException asException() {
    return ValidateException(this);
  }
}
