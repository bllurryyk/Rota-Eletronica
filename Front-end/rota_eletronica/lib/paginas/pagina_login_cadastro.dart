// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_cadastro.dart';
import 'package:rota_eletronica/paginas/pagina_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaLoginCadastro extends StatefulWidget {
  const PaginaLoginCadastro({super.key});

  @override
  State<PaginaLoginCadastro> createState() => _PaginaLoginCadastroState();
}

class _PaginaLoginCadastroState extends State<PaginaLoginCadastro> {
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
          "Rota Eletrônica",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 10),
        Text(
          "Encontre os melhores lugares\npara descartar seu lixo eletrônico",
          style: Theme.of(context).textTheme.bodySmall,
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
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PaginaLogin()));
          },
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 25),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: const Color(0xffEFF2FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () async {
            final preferencia = await SharedPreferences.getInstance();
            preferencia.setBool('mostrarInicio', true);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PaginaCadastro()));
          },
          child: const Text(
            "Cadastrar",
            style: TextStyle(color: Color(0xff8497FE)),
          ),
        ),
      ],
    );
  }
}
