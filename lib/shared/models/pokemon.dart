class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
  });

  // Esse método pega o JSON da PokéAPI e transforma em um objeto que o Flutter usa
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    // Tratamento para pegar os tipos do Pokémon dentro da estrutura da API
    var typesFromJson = json['types'] as List;
    List<String> typeList = typesFromJson
        .map((typeSlot) => typeSlot['type']['name'].toString())
        .toList();

    return Pokemon(
      id: json['id'],
      name: json['name'],
      // Aqui pegamos a arte oficial em alta definição
      imageUrl:
          json['sprites']['other']['official-artwork']['front_default'] ?? '',
      types: typeList,
    );
  }
}
