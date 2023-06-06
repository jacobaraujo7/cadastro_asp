import 'package:cadastro_asp/dtos/client_dto.dart';
import 'package:flutter/material.dart';

import '../states/client_state.dart';
import '../states/edit_client.dart';

// Atom
final clientState = ValueNotifier<ClientState>(const StartClientState());
final editClientState = ValueNotifier<ClientEditState>(const StartEditClientState());

// Actions
final fetchClientsAction = ValueNotifier(Object());
final createClientAction = ValueNotifier<ClientDTO>(ClientDTO());
final updateClientAction = ValueNotifier<ClientDTO>(ClientDTO());
final deleteClientAction = ValueNotifier<String>('');
