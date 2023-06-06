import '../dtos/client_dto.dart';
import '../entities/client_entity.dart';

class ClientAdapter {
  ClientAdapter._();

  static ClientEntity fromMap(dynamic map) {
    return ClientEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      details: map['details'],
    );
  }

  static ClientDTO entityToDTO(ClientEntity model) {
    return ClientDTO(
      id: model.id,
      name: model.name,
      email: model.email,
      details: model.details,
    );
  }

  static Map<String, dynamic> entityToMap(ClientEntity model) {
    return {
      'id': model.id,
      'name': model.name,
      'email': model.email,
      'details': model.details,
    };
  }

  static Map<String, dynamic> dtoToMap(ClientDTO model) {
    return {
      'id': model.id,
      'name': model.name,
      'email': model.email,
      'details': model.details,
    };
  }
}
