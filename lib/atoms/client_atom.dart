import 'package:asp/asp.dart';
import 'package:cadastro_asp/dtos/client_dto.dart';

import '../states/client_state.dart';
import '../states/edit_client.dart';

// Atom
final clientState = Atom<ClientState>(const StartClientState());
final editClientState = Atom<ClientEditState>(const StartEditClientState());

// Actions
final fetchClientsAction = Atom.action();
final createClientAction = Atom<ClientDTO>(ClientDTO());
final updateClientAction = Atom<ClientDTO>(ClientDTO());
final deleteClientAction = Atom<String>('');
