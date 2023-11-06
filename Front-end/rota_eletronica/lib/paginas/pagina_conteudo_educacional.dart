import 'package:flutter/material.dart';

class PaginaConteudoEducacional extends StatefulWidget {
  const PaginaConteudoEducacional({super.key, required this.nome});

  final String nome;

  @override
  State<PaginaConteudoEducacional> createState() =>
      _PaginaConteudoEducacionalState();
}

class _PaginaConteudoEducacionalState extends State<PaginaConteudoEducacional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(children: [
                    WidgetBotaoCabecalho(
                      icone: const Icon(
                        Icons.arrow_back,
                        color: Color(0xff333333),
                      ),
                      acao: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Spacer(),
                    WidgetBotaoCabecalho(
                      icone: const Icon(
                        Icons.favorite_outline,
                        color: Color(0xff333333),
                      ),
                      acao: () {},
                    ),
                  ]),
                ),
                Center(child: Image.asset("assets/images/capa.png"))
              ]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_pin, color: Color(0xffD46A98)),
                      Text(
                        'Locais próximos a você',
                        style: TextStyle(color: Color(0xffD46A98)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.nome,
                    style: const TextStyle(
                      color: Color(0xff2D3E9A),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet erat lacus. Proin pellentesque imperdiet justo eget lacinia. Praesent vel lorem eu arcu rhoncus vulputate. Praesent posuere lacinia ipsum at pellentesque. Curabitur sapien libero, interdum id velit fringilla, porttitor mattis ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a fermentum felis. Nam in elit mi. Aliquam congue ex tortor, vel venenatis diam rutrum vitae. In faucibus fringilla nisi vel bibendum. Duis tempus viverra malesuada. Pellentesque pulvinar mauris dapibus velit dapibus, vitae vehicula nulla sollicitudin. Vestibulum mollis ultricies consequat. Donec non dolor libero.\n\nSuspendisse vitae urna eget orci feugiat fermentum vitae sed augue. Vivamus ac sodales magna, ac luctus leo. Nunc nisl lectus, cursus ac orci eget, sagittis congue sem. Duis nec risus vitae elit porta placerat. Phasellus feugiat massa non tellus elementum, sed efficitur ante pretium. Mauris sed dui quis eros malesuada posuere id quis lacus. Proin a tincidunt libero.\n\nNunc quis odio sodales, molestie magna nec, interdum odio. Quisque efficitur felis non lorem volutpat, posuere luctus leo commodo. Pellentesque in magna et odio consequat pretium sed ac sapien. Maecenas libero ligula, efficitur at velit quis, lacinia mattis risus. Nulla sit amet orci in dui porta maximus. Pellentesque justo eros, porttitor commodo tempus ac, ultrices a lacus. Morbi et ipsum vel dolor posuere efficitur. Nam vel finibus diam. Duis eu ornare tellus. Pellentesque dictum gravida tellus, et rutrum tellus pulvinar ac. Nullam a sollicitudin mauris. Nunc venenatis felis mauris, ut consectetur orci posuere sed. Quisque pellentesque libero eu tortor pulvinar hendrerit.',
                    style: TextStyle(
                      color: Color(0xff8497FE),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetBotaoCabecalho extends StatefulWidget {
  final Icon icone;
  final Function() acao;

  const WidgetBotaoCabecalho({
    super.key,
    required this.icone,
    required this.acao,
  });

  @override
  State<WidgetBotaoCabecalho> createState() => _WidgetBotaoCabecalhoState();
}

class _WidgetBotaoCabecalhoState extends State<WidgetBotaoCabecalho> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 1,
          ),
        ],
      ),
      child: InkWell(
        onTap: widget.acao,
        child: widget.icone,
      ),
    );
  }
}
