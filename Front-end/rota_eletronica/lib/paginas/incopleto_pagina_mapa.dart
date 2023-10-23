import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_empresa.dart';

class PaginaMapa extends StatefulWidget {
  const PaginaMapa({
    super.key,
  });

  @override
  State<PaginaMapa> createState() => _PaginaMapaState();
}

class _PaginaMapaState extends State<PaginaMapa> {
  List<Widget> empresas = [
    const WidgetEmpresa(
        nome: 'Eco TI Ambiental',
        endereco: 'Av. Coelho e Campos, 784 - Centro, Aracaju - SE, 49060-000'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mapa',
            style: TextStyle(
                color: Color(0xff2D3E9A),
                fontSize: 40.0,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.separated(
              itemCount: empresas.length,
              itemBuilder: (BuildContext context, int index) {
                return empresas[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetEmpresa extends StatefulWidget {
  final String nome;
  final String endereco;

  const WidgetEmpresa({
    super.key,
    required this.nome,
    required this.endereco,
  });

  @override
  State<WidgetEmpresa> createState() => _WidgetEmpresaState();
}

class _WidgetEmpresaState extends State<WidgetEmpresa> {
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
      child: ListTile(
        leading: Image.asset('assets/images/logo.png', height: 90, width: 90),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.nome,
              style: const TextStyle(color: Color(0xff2D3E9A)),
            ),
            const SizedBox(height: 5),
            Text(
              widget.endereco,
              style: const TextStyle(color: Color(0xff8497FE)),
            ),
          ],
        ),
        subtitle: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Color(0xff999999),
              ),
              label: const Text(
                'Ver mais',
                style: TextStyle(color: Color(0xff999999)),
              )),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.navigation_outlined,
                color: Color(0xff2D3E9A),
              ),
              label: const Text(
                'Ir',
                style: TextStyle(
                  color: Color(0xff2D3E9A),
                ),
              )),
        ]),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const PaginaEmpresa()));
        },
      ),
    );
  }
}
