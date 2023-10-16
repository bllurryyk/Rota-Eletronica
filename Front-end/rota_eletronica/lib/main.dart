import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_onboarding.dart';
import 'package:rota_eletronica/paginas/pagina_principal.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final preferencia = await SharedPreferences.getInstance();
  final mostrarInicio = preferencia.getBool('mostrarInicio') ?? false;

  runApp(MyApp(mostrarInicio: mostrarInicio));
}

class MyApp extends StatelessWidget {
  final bool mostrarInicio;
  const MyApp({super.key, required this.mostrarInicio});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rota Eletrônica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: mostrarInicio ? const PaginaPrincipal() : const PaginaOnboarding(),
    );
  }
}
