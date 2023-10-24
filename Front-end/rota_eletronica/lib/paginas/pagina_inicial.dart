import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key? key}) : super(key: key);

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Promo(),
            Cabecalho(),
            Pesquisa(),
            CabecalhoTags(),
            ListaTags(),
            CabecalhoCategorias(),
            ListaCategorias(),
          ],
        ),
      ),
    );
  }
}

class Promo extends StatelessWidget {
  const Promo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [Color(0xff2D3E9A), Color(0xff8497FE)])),
        child: Stack(
          children: [
            Opacity(
              opacity: .5,
              child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
            ),
            //Image.asset(''),
            const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  "Rota Eletrônica",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cabecalho extends StatelessWidget {
  const Cabecalho({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 41,
            width: 48,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.25)),
            ]),
            child: Image.asset("assets/images/logo.png"),
          ),
          const Text(
            "Encontre o melhor\nlocal para seu\ndescarte",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class Pesquisa extends StatelessWidget {
  const Pesquisa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 15.0, left: 25.0, right: 25.0, bottom: 15.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          onChanged: (value) {
            //Do something
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            hintText: 'O que deseja descartar?',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class CabecalhoTags extends StatelessWidget {
  const CabecalhoTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tags populares",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "Explore as tags mais buscadas",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Ver todas",
                style: TextStyle(
                    color: Color(0xff8497FE), fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }
}

class ListaTags extends StatelessWidget {
  const ListaTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15.0, right: 25.0, bottom: 15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: [
              Tag('Pilha', Color(0xffFFFFFF)),
              Tag('Geladeira', Color(0xffEFF2FF)),
              Tag('Monitor', Color(0xffFFE9FF)),
              Tag('Placa mãe', Color(0xffEFF2FF)),
              Tag('Ventilador', Color(0xffEFF2FF)),
              Tag('Televisão de tubo', Color(0xffFFFFFF)),
              Tag('Mouse', Color(0xffFFE9FF))
            ]),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String text;
  final Color color;

  const Tag(this.text, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          //Navigator.of(context).pushNamed(route);
        },
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(10, 20),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.05)),
            ],
          ),
          child: Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
        ),
      ),
    );
  }
}

class CabecalhoCategorias extends StatelessWidget {
  const CabecalhoCategorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categorias",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "Explore as categorias",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Ver todas",
                style: TextStyle(
                    color: Color(0xff8497FE), fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }
}

class ListaCategorias extends StatelessWidget {
  const ListaCategorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, right: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            Card("Refrigeradores", "assets/images/minibar.png"),
            Card("Computadores", "assets/images/comp.png"),
            Card("Telas", "assets/images/tablet.png"),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String text;
  final String imageUrl;

  const Card(this.text, this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 15.0),
      child: GestureDetector(
        onTap: () {
          //Navigator.of(context).pushNamed(route);
        },
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(10, 20),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.05)),
            ],
          ),
          child: Column(
            children: [
              Image.asset(imageUrl, height: 70, fit: BoxFit.cover),
              const Spacer(),
              Text(text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
