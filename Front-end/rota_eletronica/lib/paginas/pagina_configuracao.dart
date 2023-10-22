// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaMinhaConta extends StatefulWidget {
  const PaginaMinhaConta({
    super.key,
  });

  @override
  State<PaginaMinhaConta> createState() => _PaginaMinhaContaState();
}

class _PaginaMinhaContaState extends State<PaginaMinhaConta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        const Spacer(),
        IconButton(
          padding: const EdgeInsets.all(16.0),
          onPressed: () async {
            final preferencia = await SharedPreferences.getInstance();
            preferencia.setBool('mostrarHome', false);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const PaginaOnboarding()));
          },
          icon: const Icon(
            Icons.exit_to_app,
            color: Color(0xff004088),
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 150,
                height: 150,
                child: Image.network("lib/image/logo.png"),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: const Column(
                  children: [
                    SizedBox(height: 35),
                    WidgetBotao(texto: 'Editar cadastro'),
                    SizedBox(height: 10),
                    WidgetBotao(texto: 'Ajuda'),
                    SizedBox(height: 10),
                    WidgetBotao(texto: 'Sobre o projeto'),
                    SizedBox(height: 10),
                    WidgetBotao(texto: 'Entre em contato conosco'),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetBotao extends StatefulWidget {
  final String texto;

  const WidgetBotao({
    super.key,
    required this.texto,
  });

  @override
  State<WidgetBotao> createState() => _WidgetBotaoState();
}

class _WidgetBotaoState extends State<WidgetBotao> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: const Color(0xffEFF2FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.texto,
            style: const TextStyle(
              color: Color(0xff8497FE),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward,
            color: Color(0xff8497FE),
          ),
        ],
      ),
    );
  }
}
