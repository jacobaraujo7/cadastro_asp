import 'package:cadastro_asp/entities/client_entity.dart';

sealed class ClientState {
  const ClientState();
}

class StartClientState extends ClientState {
  const StartClientState();
}

class GettedClientState extends ClientState {
  final List<ClientEntity> clients;

  const GettedClientState(this.clients);
}

class LoadingClientState extends ClientState {
  const LoadingClientState();
}

class FailureClientState extends ClientState {
  final String message;
  const FailureClientState(this.message);
}
