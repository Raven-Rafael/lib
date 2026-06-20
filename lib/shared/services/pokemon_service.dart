import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class PokemonService {
  /// Obtém a lista dos 151 Pokémons da 1ª Geração com seus detalhes completos.
  Future<List<Pokemon>> fetchFirstGeneration() async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151&offset=0');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar a lista de Pokémons');
    }

    final data = json.decode(response.body);
    final results = data['results'] as List;

    // Busca os detalhes de cada Pokémon em paralelo para otimizar o tempo de carregamento
    final pokemonFutures = results.map((item) async {
      final detailUrl = Uri.parse(item['url'] as String);
      final detailResponse = await http.get(detailUrl);

      if (detailResponse.statusCode != 200) {
        throw Exception('Falha ao carregar detalhes de: ${item['name']}');
      }

      final detailData = json.decode(detailResponse.body);
      return Pokemon.fromJson(detailData);
    }).toList();

    final pokemons = await Future.wait(pokemonFutures);

    // Garante a ordenação crescente por ID (de 1 a 151)
    pokemons.sort((a, b) => a.id.compareTo(b.id));

    return pokemons;
  }
}
