import 'package:firebase_core/firebase_core.dart';
import 'package:rota_eletronica/testes/pagina_empresa_usuario.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferencia = await SharedPreferences.getInstance();
  final mostrarInicio = preferencia.getBool('mostrarInicio') ?? false;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      home: mostrarInicio
          ? const PaginaPontoDeColetaUsuario()
          : const PaginaOnboarding(),
    );
  }
}
