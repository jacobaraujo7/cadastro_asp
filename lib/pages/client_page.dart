import 'package:cadastro_asp/states/client_state.dart';
import 'package:flutter/material.dart';

import '../atoms/client_atom.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  void initState() {
    super.initState();

    clientState.value = const StartClientState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchClientsAction.value = Object();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
      ),
      body: AnimatedBuilder(
        animation: clientState,
        builder: (context, child) {
          final state = clientState.value;
          if(state is StartClientState){
            return const SizedBox();
          }else if(state is LoadingClientState){
            return const Center(child: CircularProgressIndicator());
          }else if (state is GettedClientState){
            return _gettedClients(state);
          }else if(state is FailureClientState ){
            return _failure(state);
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewClient,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _gettedClients(GettedClientState state) {
    final clients = state.clients;
    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (_, index) {
        final client = clients[index];
        return ListTile(
          onTap: () {
            Navigator.of(context).pushNamed('/edit', arguments: client);
          },
          title: Text(client.name),
          subtitle: Text(client.email),
          trailing: IconButton(
            onPressed: () {
              deleteClientAction.value = client.id;
            },
            icon: const Icon(Icons.remove_circle),
          ),
        );
      },
    );
  }

  Widget _failure(FailureClientState state) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          fetchClientsAction.value = Object();
        },
        child: Text(state.message),
      ),
    );
  }

  void _createNewClient() {
    Navigator.of(context).pushNamed('/create');
  }
}
