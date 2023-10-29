import 'package:flutter/material.dart';

class Busca extends StatefulWidget {
  const Busca({Key? key}) : super(key: key);

  @override
  State<Busca> createState() => _BuscaState();
}

class _BuscaState extends State<Busca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> tags = [
    'Pilha',
    'Geladeira',
    'Monitor',
    'Placa mãe',
    'Ventilador',
    'Televisão de tubo',
    'Mouse'
  ];

  CustomSearchDelegate() : super(searchFieldLabel: 'O que deseja descartar?');

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          padding: const EdgeInsets.all(16.0),
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> consulta = [];
    for (var tag in tags) {
      if (tag.toLowerCase().contains(query.toLowerCase())) {
        consulta.add(tag);
      }
    }
    return ListView.builder(
      itemCount: consulta.length,
      itemBuilder: (context, index) {
        var resultado = consulta[index];
        return ListTile(
          title: Text(resultado),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> consulta = [];
    for (var tag in tags) {
      if (tag.toLowerCase().contains(query.toLowerCase())) {
        consulta.add(tag);
      }
    }
    return ListView.builder(
      itemCount: consulta.length,
      itemBuilder: (context, index) {
        var resultado = consulta[index];
        return ListTile(
          title: Text(resultado),
        );
      },
    );
  }
}
