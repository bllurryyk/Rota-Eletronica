import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:rota_eletronica/paginas/busca.dart';
import 'package:rota_eletronica/paginas/pagina_empresa.dart';
import 'package:url_launcher/url_launcher_string.dart';

const accessToken =
    'pk.eyJ1Ijoidml0b3ItY29zdGEiLCJhIjoiY2xvYmNiMGFuMHNkYzJzcWZ1dGxhdHY3NyJ9.TdQy8ZYwN7nQy8JkTqifDQ';

const aracaju = LatLng(-10.9095, -37.0748);

const coordenadaEcoti = LatLng(-10.905721217774573, -37.05664796234068);
const coordenadaMLItabaianinha = LatLng(-10.909832086058183, -37.0503859316581);
const coordenadaMLJoaoPessoa = LatLng(-10.91008177003436, -37.04924693365784);
const coordenadaMLSJardins = LatLng(-10.940399448276365, -37.06016747716989);
const coordenadaMLSPremio = LatLng(-10.851321749502564, -37.07835242001214);

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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Mapa(
              posicaoAtual: posicaoAtual,
            ),
            Positioned(
              bottom: 25.0,
              right: 25.0,
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
            point: coordenadaEcoti,
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
                              nome: 'EOCTI',
                              endereco:
                                  'AVENIDA COELHO E CAMPOS, 784 - SEM COMPLEMENTO - SANTO ANTONIO - ARACAJU - SE, 49.060-000',
                              onPressed: () {
                                _openMap(coordenadaEcoti.latitude,
                                    coordenadaEcoti.longitude);
                              }),
                        ),
                      ],
                    );
                  },
                );
              },
              child: ClipRRect(
                child: Image.asset('assets/images/pin.png'),
              ),
            ),
          ),
          Marker(
            point: coordenadaMLItabaianinha,
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
                              nome:
                                  'MAGAZINE LUIZA S/A - ARACAJU - ITABAIANINHA',
                              endereco:
                                  'ITABAIANINHA, 283 - SEM COMPLEMENTO - SEM BAIRRO - ARACAJU - SE, 49.010-190',
                              onPressed: () {
                                _openMap(coordenadaMLItabaianinha.latitude,
                                    coordenadaMLItabaianinha.longitude);
                              }),
                        ),
                      ],
                    );
                  },
                );
              },
              child: ClipRRect(
                child: Image.asset('assets/images/pin.png'),
              ),
            ),
          ),
          Marker(
            point: coordenadaMLJoaoPessoa,
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
                              nome:
                                  'MAGAZINE LUIZA S/A - ARACAJU - RUA JOAO PESSOA',
                              endereco:
                                  'JOAO PESSOA, 320 - SEM COMPLEMENTO - SEM BAIRRO - ARACAJU - SE, 49.010-130',
                              onPressed: () {
                                _openMap(coordenadaMLJoaoPessoa.latitude,
                                    coordenadaMLJoaoPessoa.longitude);
                              }),
                        ),
                      ],
                    );
                  },
                );
              },
              child: ClipRRect(
                child: Image.asset('assets/images/pin.png'),
              ),
            ),
          ),
          Marker(
            point: coordenadaMLSJardins,
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
                              nome:
                                  'MAGAZINE LUIZA S/A - ARACAJU - SHOP JARDINS',
                              endereco:
                                  'GERALDO BARRETO SOBRAL, 0 - SEM COMPLEMENTO - SEM BAIRRO - ARACAJU - SE, 49.026-900',
                              onPressed: () {
                                _openMap(coordenadaMLSJardins.latitude,
                                    coordenadaMLSJardins.longitude);
                              }),
                        ),
                      ],
                    );
                  },
                );
              },
              child: ClipRRect(
                child: Image.asset('assets/images/pin.png'),
              ),
            ),
          ),
          Marker(
            point: coordenadaMLSPremio,
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
                              nome: 'MAGAZINE LUIZA S/A - SHOPPING PREMIO',
                              endereco:
                                  'AVENIDA A C A COLETORA A COMPLEXO HABITACIONAL T 0, S/N - SEM COMPLEMENTO - SEM BAIRRO - NOSSA SENHORA DO SOCORRO - SE, 49.160-000',
                              onPressed: () {
                                _openMap(coordenadaMLSPremio.latitude,
                                    coordenadaMLSPremio.longitude);
                              }),
                        ),
                      ],
                    );
                  },
                );
              },
              child: ClipRRect(
                child: Image.asset('assets/images/pin.png'),
              ),
            ),
          ),
          Marker(
              point: widget.posicaoAtual,
              child: const Icon(
                Icons.pin_drop_sharp,
                color: Colors.purple,
              )),
        ])
      ],
    );
  }

  Future<void> _openMap(double latitude, double longitude) async {
    String latitude_ = latitude.toString();
    String longitude_ = longitude.toString();
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$latitude_,$longitude_';
    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'Could not open the map.';
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PaginaEmpresa()));
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
              onPressed: () {
                widget.onPressed();
              },
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
