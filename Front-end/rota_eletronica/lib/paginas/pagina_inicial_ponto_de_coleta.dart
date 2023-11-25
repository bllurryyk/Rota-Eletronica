import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_configuracao.dart';

class PaginaInicialPontoDeColeta extends StatefulWidget {
  const PaginaInicialPontoDeColeta({super.key});

  @override
  State<PaginaInicialPontoDeColeta> createState() =>
      _PaginaInicialPontoDeColetaState();
}

class _PaginaInicialPontoDeColetaState
    extends State<PaginaInicialPontoDeColeta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            GridView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              children: [
                WidgetB(
                  title: 'Dashboard',
                  icon: const Icon(Icons.bar_chart_sharp, size: 100.0),
                  function: () {},
                ),
                WidgetB(
                  title: 'Meu Ponto',
                  icon: const Icon(Icons.account_balance_sharp, size: 100.0),
                  function: () {},
                ),
                WidgetB(
                  title: 'Configurações',
                  icon: const Icon(Icons.settings, size: 100.0),
                  function: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PaginaMinhaConta()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function() function;
  const WidgetB({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            function();
          },
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: icon,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.black.withOpacity(.2),
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    )
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
