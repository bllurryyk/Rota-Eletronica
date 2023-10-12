import 'package:flutter/material.dart';

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
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              width: 150,
              height: 150,
              child: Image.network("lib/image/logo.png"),
            ),
          ],
        ),
      ),
    );
  }
}
