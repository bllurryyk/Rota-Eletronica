import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:rota_eletronica/paginas/busca.dart';
import 'package:rota_eletronica/paginas/pagina_empresa.dart';

const accessToken =
    'pk.eyJ1Ijoidml0b3ItY29zdGEiLCJhIjoiY2xvYmNiMGFuMHNkYzJzcWZ1dGxhdHY3NyJ9.TdQy8ZYwN7nQy8JkTqifDQ';

const aracaju = LatLng(-10.9095, -37.0748);
const blocoD = LatLng(-10.967934374633456, -37.058787347198496);

class PaginaMapa extends StatefulWidget {
  const PaginaMapa({super.key});

  @override
  State<PaginaMapa> createState() => _PaginaMapaState();
}

class _PaginaMapaState extends State<PaginaMapa> {
  LatLng posicaoAtual = aracaju;
  late double latitude;
  late double longitude;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Mapa(
            posicaoAtual: posicaoAtual,
          ),
          Positioned(
            bottom: 5.0,
            right: 5.0,
            child: InkWell(
              onTap: () {
                _getCurrentLocation().then((value) =>
                    {latitude = value.latitude, longitude = value.longitude});
                setState(() {
                  posicaoAtual = LatLng(latitude, longitude);
                });
                _liveLocation();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(
                  Icons.my_location,
                  size: 30.0,
                  color: Color(0xff2D3E9A),
                ),
              ),
            ),
          ),
          const Cabecalho(),
        ],
      ),
    );
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permission');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 50);

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      latitude = position.latitude;
      longitude = position.longitude;

      setState(() {
        posicaoAtual = LatLng(latitude, longitude);
      });
    });
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
        //WidgetBotaoCabecalho(icone: const Icon(Icons.arrow_back,color: Color(0xff333333),),acao: () {Navigator.pop;}),
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

class Mapa extends StatefulWidget {
  const Mapa({super.key, required this.posicaoAtual});

  final LatLng posicaoAtual;

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: widget.posicaoAtual,
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
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.transparent,
                      useRootNavigator: true,
                      isDismissible: true,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 70.0, left: 50.0, right: 50.0),
                              child: WidgetEmpresa(
                                nome: 'Eco TI Ambiental',
                                endereco:
                                    'Av. Coelho e Campos, 784 - Centro, Aracaju - SE, 49060-000',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child:
                      ClipRRect(child: Image.asset('assets/images/pin.png')))),
          Marker(
              point: widget.posicaoAtual,
              child: const Icon(
                Icons.circle,
                color: Colors.purple,
                size: 10,
              )),
        ])
      ],
    );
  }
}

class WidgetEmpresa extends StatefulWidget {
  final String nome;
  final String endereco;
  final Function onPressed;

  const WidgetEmpresa({
    super.key,
    required this.nome,
    required this.endereco,
    required this.onPressed,
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
              onPressed: () {
                widget.onPressed;
              },
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
