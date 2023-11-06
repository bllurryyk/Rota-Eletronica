import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_conteudo_educacional.dart';

class PaginaInformacoesEducacional extends StatefulWidget {
  const PaginaInformacoesEducacional({
    super.key,
  });

  @override
  State<PaginaInformacoesEducacional> createState() =>
      _PaginaInformacoesEducacionalState();
}

class _PaginaInformacoesEducacionalState
    extends State<PaginaInformacoesEducacional> {
  List<Widget> empresas = [
    const WidgetConteudo(nome: 'Placa mãe', resumo: 'Lorem Ipsum'),
    const WidgetConteudo(nome: 'Ventilador', resumo: 'Lorem Ipsum'),
    const WidgetConteudo(nome: 'Televisão', resumo: 'Lorem Ipsum'),
    const WidgetConteudo(nome: 'Mouse', resumo: 'Lorem Ipsum'),
    const WidgetConteudo(nome: 'Computador', resumo: 'Lorem Ipsum')
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Conteúdo Educacional',
              style: TextStyle(
                  color: Color(0xff2D3E9A),
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                itemCount: empresas.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: empresas[index],
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetConteudo extends StatefulWidget {
  final String nome;
  final String resumo;

  const WidgetConteudo({
    super.key,
    required this.nome,
    required this.resumo,
  });

  @override
  State<WidgetConteudo> createState() => _WidgetConteudoState();
}

class _WidgetConteudoState extends State<WidgetConteudo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 1,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PaginaConteudoEducacional(
                    nome: widget.nome,
                  )));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 90, width: 90),
            const SizedBox(height: 5),
            Text(
              widget.nome,
              style: const TextStyle(color: Color(0xff2D3E9A)),
            ),
            const SizedBox(height: 5),
            Text(
              widget.resumo,
              style: const TextStyle(color: Color(0xff8497FE)),
            ),
            const SizedBox(height: 10),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PaginaConteudoEducacional(
                                  nome: widget.nome,
                                )));
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xff999999),
                      ),
                      label: const Text(
                        'Ver mais',
                        style: TextStyle(color: Color(0xff999999)),
                      )),
                ]),
          ],
        ),
      ),
    );
  }
}
