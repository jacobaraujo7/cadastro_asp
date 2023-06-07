import 'package:equatable/equatable.dart';

class ClientEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? details;

  const ClientEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.details,
  });

  @override
  List<Object?> get props => [id, name, email, details];
}
