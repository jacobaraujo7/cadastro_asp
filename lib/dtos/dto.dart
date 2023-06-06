import 'package:cadastro_asp/exceptions/validate_exception.dart';

abstract class DTO {
  void validate();

  bool isValid() {
    try {
      validate();
      return true;
    } on ValidateException {
      return false;
    }
  }
}
