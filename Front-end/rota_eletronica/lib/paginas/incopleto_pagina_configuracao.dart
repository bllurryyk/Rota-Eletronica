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
    return Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Minha Conta",
              style: TextStyle(color: Color(0xff8497FE)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: 150,
              height: 150,
              child: Image.network("lib/image/logo.png"),
            ),
            TextButton(
                onPressed: () async {
                  final preferencia = await SharedPreferences.getInstance();
                  preferencia.setBool('mostrarHome', false);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const PaginaOnboarding()));
                },
                child: const Text(
                  'Sair',
                  style: TextStyle(color: Color(0xff8497FE)),
                ))
          ],
        ),
      ),
    );
  }
}
