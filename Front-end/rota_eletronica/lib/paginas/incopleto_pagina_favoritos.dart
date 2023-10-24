import 'package:flutter/material.dart';

class PaginaFavoritos extends StatefulWidget {
  const PaginaFavoritos({
    super.key,
  });

  @override
  State<PaginaFavoritos> createState() => _PaginaFavoritosState();
}

class _PaginaFavoritosState extends State<PaginaFavoritos> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Favoritos",
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
