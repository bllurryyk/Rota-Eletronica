import 'package:flutter/material.dart';

class PaginaEmpresa extends StatefulWidget {
  const PaginaEmpresa({
    super.key,
  });

  @override
  State<PaginaEmpresa> createState() => _PaginaEmpresaState();
}

class _PaginaEmpresaState extends State<PaginaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(children: [
                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(children: [
                    WidgetBotaoCabecalho(
                      icone: Icon(
                        Icons.arrow_back,
                        color: Color(0xff333333),
                      ),
                    ),
                    Spacer(),
                    WidgetBotaoCabecalho(
                      icone: Icon(
                        Icons.favorite_outline,
                        color: Color(0xff333333),
                      ),
                    ),
                  ]),
                ),
                Center(child: Image.network("lib/image/capa.png"))
              ]),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_pin, color: Color(0xffD46A98)),
                      Text(
                        'Próximo a você',
                        style: TextStyle(color: Color(0xffD46A98)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Eco TI Ambiental',
                    style: TextStyle(
                      color: Color(0xff2D3E9A),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Av. Coelho e Campos, 784 - Centro, Aracaju - SE, 49060-000',
                    style: TextStyle(
                      color: Color(0xff999999),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'A ECO TI AMBIENTAL é uma empresa que executa serviços técnicos especializados em gerenciamento sustentável de resíduos sólidos perigosos e não perigosos, especialmente resíduos eletroeletrônicos, e de efluentes sanitários e industriais.',
                    style: TextStyle(
                      color: Color(0xff8497FE),
                    ),
                  ),
                  SizedBox(height: 50),
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

  const WidgetBotaoCabecalho({
    super.key,
    required this.icone,
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
        onTap: () {},
        child: widget.icone,
      ),
    );
  }
}
