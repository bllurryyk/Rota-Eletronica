import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_configuracao.dart';
import 'package:rota_eletronica/paginas/incopleto_pagina_favoritos.dart';
import 'package:rota_eletronica/paginas/pagina_mapa.dart';
import 'package:rota_eletronica/paginas/pagina_inicial.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    const PaginaInicial(),
    const PaginaMapa(),
    const PaginaFavoritos(),
    const PaginaMinhaConta()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (int newIndex) {
          setState(() {
            _indiceAtual = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Página Inicial",
            backgroundColor: Color(0xff2D3E9A),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: "Mapa",
            backgroundColor: Color(0xff2D3E9A),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favoritos",
            backgroundColor: Color(0xff2D3E9A),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Minha Conta",
            backgroundColor: Color(0xff2D3E9A),
          ),
        ],
      ),
    );
  }
}
