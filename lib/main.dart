import 'package:asp/asp.dart';
import 'package:cadastro_asp/pages/client_page.dart';
import 'package:cadastro_asp/pages/edit_client_page.dart';
import 'package:flutter/material.dart';
import 'package:uno/uno.dart';

import 'entities/client_entity.dart';
import 'reducers/client_reducer.dart';
import 'services/client_service.dart';
import 'services/http_client_service.dart';

void main() {
  final uno = Uno();
  final httpClientService = HttpClientService(uno);
  final clientService = ClientService(httpClientService);
  final reducer = ClientReducer(clientService);
  runApp(
    RxRoot(reducers: [reducer], child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => const ClientPage(),
        '/create': (_) => const EditClient(),
        '/edit': (context) {
          final entity = ModalRoute.of(context)?.settings.arguments as ClientEntity?;
          return EditClient(entity: entity);
        },
      },
    );
  }
}
