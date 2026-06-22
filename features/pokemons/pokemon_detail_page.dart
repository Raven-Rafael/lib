import 'package:flutter/material.dart';
import '../../shared/models/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key});

  /// Retorna a cor característica do tipo de Pokémon para tematização visual.
  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return Colors.green.shade600;
      case 'fire':
        return Colors.orange.shade700;
      case 'water':
        return Colors.blue.shade600;
      case 'bug':
        return Colors.lightGreen.shade700;
      case 'normal':
        return Colors.grey.shade500;
      case 'poison':
        return Colors.purple.shade600;
      case 'electric':
        return Colors.amber.shade700;
      case 'ground':
        return Colors.brown.shade500;
      case 'fairy':
        return Colors.pink.shade300;
      case 'fighting':
        return Colors.red.shade800;
      case 'psychic':
        return Colors.pink.shade600;
      case 'rock':
        return Colors.grey.shade700;
      case 'ghost':
        return Colors.indigo.shade700;
      case 'ice':
        return Colors.cyan.shade600;
      case 'dragon':
        return Colors.indigo.shade900;
      case 'steel':
        return Colors.blueGrey.shade600;
      case 'dark':
        return Colors.grey.shade800;
      case 'flying':
        return Colors.indigo.shade300;
      default:
        return Colors.grey.shade600;
    }
  }

  /// Helper para capitalizar a primeira letra.
  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)?.settings.arguments as Pokemon?;

    if (pokemon == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes'),
        ),
        body: const Center(
          child: Text(
            'Nenhum Pokémon selecionado.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    final String formattedId = '#${pokemon.id.toString().padLeft(3, '0')}';
    final Color primaryTypeColor = pokemon.types.isNotEmpty
        ? _getTypeColor(pokemon.types.first)
        : Colors.green;

    return Scaffold(
      backgroundColor: primaryTypeColor.withValues(alpha: 0.05),
      appBar: AppBar(
        backgroundColor: primaryTypeColor,
        foregroundColor: Colors.white,
        title: Text(
          _capitalize(pokemon.name),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                formattedId,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white87,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner/Header superior com a arte do Pokémon
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryTypeColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryTypeColor.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Hero(
                    tag: 'pokemon_image_${pokemon.id}',
                    child: Container(
                      height: 220,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: pokemon.imageUrl.isNotEmpty
                          ? Image.network(
                              pokemon.imageUrl,
                              fit: BoxFit.contain,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.catching_pokemon,
                                  size: 100,
                                  color: Colors.white60,
                                );
                              },
                            )
                          : const Icon(
                              Icons.catching_pokemon,
                              size: 100,
                              color: Colors.white60,
                            ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Informações detalhadas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          _capitalize(pokemon.name),
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: Colors.green.shade900,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Center(
                        child: Text(
                          'National Pokédex $formattedId',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 16),
                      Text(
                        'Tipos',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        children: pokemon.types.map((type) {
                          final color = _getTypeColor(type);
                          return Chip(
                            backgroundColor: color,
                            labelPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: BorderSide.none,
                            label: Text(
                              _capitalize(type),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 16),
                      Text(
                        'Características Gerais',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatItem('Geração', '1ª Geração'),
                          _buildStatItem('Região de Origem', 'Kanto'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black55,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            color: Colors.green.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
