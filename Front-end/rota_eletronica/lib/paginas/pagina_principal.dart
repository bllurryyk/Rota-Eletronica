import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:rota_eletronica/paginas/pagina_configuracao.dart';
import 'package:rota_eletronica/paginas/pagina_favoritos.dart';
import 'package:rota_eletronica/paginas/pagina_informacoes_educacionais.dart';
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
    const PaginaInformacoesEducacional(),
    ProgressHUD(child: Builder(builder: (context) => const PaginaMapa())),
    const PaginaFavoritos(),
    const PaginaMinhaConta()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff2D3E9A),
        selectedItemColor: const Color(0xffFFE9FF),
        unselectedItemColor: const Color(0xffCCCCCC),
        iconSize: 30.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceAtual,
        onTap: (int newIndex) {
          setState(() {
            _indiceAtual = newIndex;
          });
          if (_indiceAtual == 2) {
            final progress = ProgressHUD.of(context);
            progress?.show();
            Future.delayed(const Duration(seconds: 3), () {
              progress?.dismiss();
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Página Inicial",
            backgroundColor: Color(0xff2D3E9A),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: "Conteúdo Educacional",
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
