import 'package:flutter/material.dart';

class PaginaMapa extends StatefulWidget {
  const PaginaMapa({
    super.key,
  });

  @override
  State<PaginaMapa> createState() => _PaginaMapaState();
}

class _PaginaMapaState extends State<PaginaMapa> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Mapa",
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
