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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 150,
                height: 150,
                child: Image.asset("assets/images/logo.png"),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 35),
                    const WidgetBotao(texto: 'Editar cadastro'),
                    const SizedBox(height: 10),
                    const WidgetBotao(texto: 'Ajuda'),
                    const SizedBox(height: 10),
                    const WidgetBotao(texto: 'Sobre o projeto'),
                    const SizedBox(height: 10),
                    const WidgetBotao(texto: 'Entre em contato conosco'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        final preferencia =
                            await SharedPreferences.getInstance();
                        preferencia.setBool('mostrarInicio', false);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const PaginaOnboarding()));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xffEFF2FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Sair',
                            style: TextStyle(
                              color: Color(0xff8497FE),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.exit_to_app,
                            color: Color(0xff8497FE),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
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
