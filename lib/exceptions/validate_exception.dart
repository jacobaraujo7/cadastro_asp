class ValidateException implements Exception {
  final String message;
  late StackTrace stackTrace;

  ValidateException(this.message, [StackTrace? stackTrace]) {
    this.stackTrace = stackTrace ?? StackTrace.current;
  }
}

extension ValidateExceptionExtension on String {
  ValidateException asException() {
    return ValidateException(this);
  }
}
