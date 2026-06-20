import 'package:flutter/material.dart';

import '../features/home/home_page.dart';
import '../features/pokemons/pokemon_detail_page.dart';
import '../features/produtos/detalhes_produto_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String detalhesProduto = '/detalhes-produto';
  static const String detalhesPokemon = '/detalhes-pokemon';

  static Future<Map<String, WidgetBuilder>> getRoutes() async {
    return {
      home: (context) => const HomePage(),
      detalhesProduto: (context) => const DetalhesProdutoPage(),
      detalhesPokemon: (context) => const PokemonDetailPage(),
    };
  }
}
