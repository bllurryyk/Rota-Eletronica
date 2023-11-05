import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rota_eletronica/paginas/localizacao_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rota Eletrônica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PaginaLocalizacao(),
    );
  }
}

class PaginaLocalizacao extends StatelessWidget {
  const PaginaLocalizacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<LocalizacaoController>(
        create: (context) => LocalizacaoController(),
        child: Builder(builder: (context) {
          final local = context.watch<LocalizacaoController>();

          String mensagem = local.erro == ''
              ? 'Latitude: ${local.latitude} | Longitude: ${local.longitude}'
              : local.erro;

          return Center(child: Text(mensagem));
        }),
      ),
    );
  }
}
