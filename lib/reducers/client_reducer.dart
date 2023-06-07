import 'package:asp/asp.dart';
import 'package:cadastro_asp/states/client_state.dart';

import '../atoms/client_atom.dart';
import '../services/client_service.dart';
import '../states/edit_client.dart';

class ClientReducer extends Reducer {
  final ClientService service;

  ClientReducer(this.service) {
    on(() => [fetchClientsAction], _fetchClient);
    on(() => [createClientAction], _createClient);
    on(() => [updateClientAction], _updateClient);
    on(() => [deleteClientAction], _deleteClient);
  }

  void _fetchClient() async {
    clientState.value = const LoadingClientState();
    try {
      final clients = await service.fetchClients();
      clientState.value = GettedClientState(clients);
    } catch (e) {
      clientState.value = FailureClientState(e.toString());
    }
  }

  void _createClient() async {
    try {
      final dto = createClientAction.value;
      await service.createClient(dto);
      editClientState.value = const SavedClientState();

      _fetchClient();
    } catch (e) {
      editClientState.value = FailureEditClientState(e.toString());
    }
  }

  void _updateClient() async {
    try {
      final dto = updateClientAction.value;
      await service.updateClient(dto);
      editClientState.value = const SavedClientState();

      _fetchClient();
    } catch (e) {
      editClientState.value = FailureEditClientState(e.toString());
    }
  }

  void _deleteClient() async {
    final id = deleteClientAction.value;

    try {
      await service.deleteClient(id);
      final clients = await service.fetchClients();
      clientState.value = GettedClientState(clients);
    } catch (e) {
      clientState.value = FailureClientState(e.toString());
    }
  }
}
