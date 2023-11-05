import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:rota_eletronica/paginas/busca.dart';

const accessToken =
    'pk.eyJ1Ijoidml0b3ItY29zdGEiLCJhIjoiY2xvYmNiMGFuMHNkYzJzcWZ1dGxhdHY3NyJ9.TdQy8ZYwN7nQy8JkTqifDQ';

const aracaju = LatLng(-10.9095, -37.0748);
const blocoD = LatLng(-10.967934374633456, -37.058787347198496);

class PaginaMapa extends StatefulWidget {
  const PaginaMapa({super.key});
=======
import 'package:rota_eletronica/paginas/pagina_empresa.dart';
import 'package:rota_eletronica/paginas/busca.dart';

class PaginaMapa extends StatefulWidget {
  const PaginaMapa({
    super.key,
  });

  @override
  State<PaginaMapa> createState() => _PaginaMapaState();
}

class _PaginaMapaState extends State<PaginaMapa> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Mapa(),
          Cabecalho(),
        ],
      ),
    );
  }
}

class Cabecalho extends StatelessWidget {
  const Cabecalho({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(41.0),
      child: Row(children: [
        WidgetBotaoCabecalho(
            icone: const Icon(
              Icons.arrow_back,
              color: Color(0xff333333),
            ),
            acao: () {}),
        const Spacer(),
        Container(
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
            onTap: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            child: const Icon(Icons.search),
          ),
        ),
      ]),
      
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
                  }),
              const Spacer(),
              Container(
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
                  onTap: () {
                    showSearch(
                        context: context, delegate: CustomSearchDelegate());
                  },
                  child: const Icon(Icons.search),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: ListView.separated(
                  itemCount: empresas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return empresas[index];
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                  reverse: true,
                ),
              ),
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

class Mapa extends StatelessWidget {
  const Mapa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: blocoD,
        initialZoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/vitor-costa/clobce3s100q001pbav3uf2o1/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoidml0b3ItY29zdGEiLCJhIjoiY2xvYmNiMGFuMHNkYzJzcWZ1dGxhdHY3NyJ9.TdQy8ZYwN7nQy8JkTqifDQ',
          additionalOptions: const {
            'accessToken': accessToken,
            'id': 'mapbox.mapbox-streets-v8'
          },
        ),
        MarkerLayer(markers: [
          Marker(
              point: blocoD,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          color: const Color(0xff2D3E9A), strokeAlign: 0.1),
                      color: Colors.white),
                  child: Image.asset('assets/images/logo.png')))
        ])
      ],
    );
  }
