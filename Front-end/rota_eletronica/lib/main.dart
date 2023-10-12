import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/incopleto_pagina_configuracao.dart';
import 'package:rota_eletronica/paginas/incopleto_pagina_favoritos.dart';
import 'package:rota_eletronica/paginas/incopleto_pagina_mapa.dart';
import 'package:rota_eletronica/paginas/pagina_inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rota Eletrônica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Rota Eletrônica'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    PaginaInicial(),
    PaginaMapa(),
    PaginaFavoritos(),
    PaginaMinhaConta()
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
            backgroundColor: Colors.deepPurpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: "Mapa",
            backgroundColor: Colors.deepPurpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favoritos",
            backgroundColor: Colors.deepPurpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Minha Conta",
            backgroundColor: Colors.deepPurpleAccent,
          ),
        ],
      ),
    );
  }
}
