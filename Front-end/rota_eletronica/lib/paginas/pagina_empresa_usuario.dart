// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_login_cadastro_usuario.dart';
import 'package:rota_eletronica/testes/pagina_login_cadastro_ponto_de_coleta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaPontoDeColetaUsuario extends StatefulWidget {
  const PaginaPontoDeColetaUsuario({super.key});

  @override
  State<PaginaPontoDeColetaUsuario> createState() =>
      _PaginaPontoDeColetaUsuarioState();
}

class _PaginaPontoDeColetaUsuarioState
    extends State<PaginaPontoDeColetaUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xffCED2FF), Color(0xffffffff)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        )),
        child: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Cabecalho(),
              SizedBox(height: 10),
              Corpo(),
              SizedBox(height: 35),
              Botoes(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class Cabecalho extends StatelessWidget {
  const Cabecalho({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/capa.png",
        width: 250,
        height: 250,
      ),
    );
  }
}

class Corpo extends StatelessWidget {
  const Corpo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 50,
          height: 50,
        ),
        const SizedBox(height: 10),
        Text(
          "Você pretende utilizar como usuário ou como local de coleta?",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}

class Botoes extends StatelessWidget {
  const Botoes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: const Color(0xff8497FE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () async {
            final preferencia = await SharedPreferences.getInstance();
            preferencia.setBool('mostrarInicio', true);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) =>
                        const PaginaLoginCadastroPontoDeColeta()),
                (route) => route.isFirst);
          },
          child: const Text(
            "Local de coleta",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 25),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: const Color(0xff8497FE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () async {
            final preferencia = await SharedPreferences.getInstance();
            preferencia.setBool('mostrarInicio', true);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const PaginaLoginCadastroUsuario()),
                (route) => route.isFirst);
          },
          child: const Text(
            "Usuário",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
