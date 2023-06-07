part of 'client_dto.dart';

mixin class ClientValidate {
  Result<Unit, AppException> nameValidate(String name) {
    if (name.isEmpty) {
      return Failure('O nome não pode ser vazio'.asException());
    }

    return Success.unit();
  }

  Result<Unit, AppException> emailValidate(String email) {
    if (email.isEmpty) {
      return Failure('Email não pode ser vazio'.asException());
    }

    if (!validator.isEmail(email)) {
      return Failure('Email inválido'.asException());
    }

    return Success.unit();
  }
}
