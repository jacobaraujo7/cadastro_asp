import 'package:dson_adapter/dson_adapter.dart';

import '../dtos/client_dto.dart';
import '../entities/client_entity.dart';

class ClientAdapter {
  static const dson = DSON();
  ClientAdapter._();

  static ClientEntity fromMap(dynamic map) {
    return dson.fromJson(map, ClientEntity.new);
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
