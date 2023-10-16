// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rota_eletronica/testes/pagina_login_cadastro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PaginaOnboarding extends StatefulWidget {
  const PaginaOnboarding({super.key});

  @override
  State<PaginaOnboarding> createState() => _PaginaOnboardingState();
}

class _PaginaOnboardingState extends State<PaginaOnboarding> {
  late PageController _controlePagina;
  int _indicePagina = 0;
  bool primeiraPagina = true;
  bool ultimaPagina = false;

  @override
  void initState() {
    _controlePagina = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controlePagina.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _controlePagina.jumpToPage(4),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color(0xff8497FE),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xFFffffff),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controlePagina,
                  itemCount: paginas.length,
                  onPageChanged: (index) {
                    setState(() {
                      _indicePagina = index;
                      ultimaPagina = index == 3;
                      primeiraPagina = index == 0;
                    });
                  },
                  itemBuilder: (context, index) => ConteudoOnboarding(
                    imagem: paginas[index].imagem,
                    texto: paginas[index].texto,
                    descricao: paginas[index].descricao,
                  ),
                ),
              ),
              Row(
                children: [
                  Center(
                    child: SmoothPageIndicator(
                      controller: _controlePagina,
                      count: paginas.length,
                      effect: const ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: Colors.black26,
                          activeDotColor: Color(0xff8497FE)),
                      onDotClicked: (index) => _controlePagina.animateToPage(
                        index,
                        duration: const Duration(microseconds: 300),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    //height: 60,
                    //width: 60,
                    child: primeiraPagina
                        ? TextButton(
                            onPressed: () {
                              _controlePagina.nextPage(
                                  duration: const Duration(microseconds: 300),
                                  curve: Curves.ease);
                            },
                            child: const Text(
                              'Iniciar',
                              style: TextStyle(color: Color(0xff8497FE)),
                            ),
                          )
                        : ultimaPagina
                            ? ElevatedButton(
                                onPressed: () async {
                                  final preferencia =
                                      await SharedPreferences.getInstance();
                                  preferencia.setBool('mostrarHome', true);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PaginaLoginCadastro()));
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: const Color(0xff8497FE),
                                ),
                                child: const Text(
                                  'Vamos Começar?',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            : TextButton(
                                onPressed: () {
                                  _controlePagina.nextPage(
                                      duration:
                                          const Duration(microseconds: 300),
                                      curve: Curves.ease);
                                },
                                child: const Text(
                                  'Próximo',
                                  style: TextStyle(color: Color(0xff8497FE)),
                                ),
                              ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Onboarding {
  final String imagem;
  final String texto;
  final String descricao;

  Onboarding(this.imagem, this.texto, this.descricao);
}

final List<Onboarding> paginas = [
  Onboarding(
      'lib/image/capa.png',
      'Encontre pontos para descartar seu lixo eletrônico',
      'Localize pontos de coleta próximos em um piscar de olhos.\n Simplificando o descarte responsável.'),
  Onboarding(
      'lib/image/capa.png',
      'Leia guias explicativos para entender mais sobre o problema crescente do lixo eletrônico',
      'Eduque-se sobre o impacto do lixo eletrônico.\nSaiba por que o lixo eletrônico importa.'),
  Onboarding('lib/image/capa.png', 'Favorite seus pontos de coleta favoritos',
      'Marque seus lugares de reciclagem preferidos.\nAcesse facilmente seus pontos de coleta favoritos.'),
  Onboarding('lib/image/capa.png', 'Ganhe pontos a cada descarte correto',
      'Recicle e seja recompensado.\nFaça a diferença e acumule pontos.'),
];

class ConteudoOnboarding extends StatelessWidget {
  const ConteudoOnboarding({
    super.key,
    required this.imagem,
    required this.texto,
    required this.descricao,
  });

  final String imagem;
  final String texto;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          Image.network(imagem, height: 250),
          const Spacer(),
          Text(texto,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: 16),
          Text(descricao, textAlign: TextAlign.center),
          const Spacer(),
        ],
      ),
    );
  }
}
