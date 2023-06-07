import 'package:cadastro_asp/exceptions/validate_exception.dart';
import 'package:result_dart/result_dart.dart';

abstract class DTO {
  Result<Unit, AppException> validate();

  bool isValid() {
    return validate().isSuccess();
  }
}
