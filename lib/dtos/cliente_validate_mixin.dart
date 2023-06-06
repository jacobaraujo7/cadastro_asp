part of 'client_dto.dart';

mixin ClientValidate {
  void nameValidate(String name) {
    if (name.isEmpty) {
      throw 'O nome não pode ser vazio'.asException();
    }
  }

  void emailValidate(String email) {
    if (email.isEmpty) {
      throw 'Email não pode ser vazio'.asException();
    }

    final regexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regexp.hasMatch(email)) {
      throw 'Email inválido'.asException();
    }
  }
}
