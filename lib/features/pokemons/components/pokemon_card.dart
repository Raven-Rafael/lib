import 'package:flutter/material.dart';
import '../../../shared/models/pokemon.dart';
import '../../../app/app_routes.dart';
import 'package:yasmin/l10n/app_localizations.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

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

  /// Helper para capitalizar a primeira letra do nome do Pokémon.
  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  String _getTranslatedType(BuildContext context, String type) {
    final l10n = AppLocalizations.of(context)!;
    switch (type.toLowerCase()) {
      case 'grass': return l10n.typeGrass;
      case 'fire': return l10n.typeFire;
      case 'water': return l10n.typeWater;
      case 'bug': return l10n.typeBug;
      case 'normal': return l10n.typeNormal;
      case 'poison': return l10n.typePoison;
      case 'electric': return l10n.typeElectric;
      case 'ground': return l10n.typeGround;
      case 'fairy': return l10n.typeFairy;
      case 'fighting': return l10n.typeFighting;
      case 'psychic': return l10n.typePsychic;
      case 'rock': return l10n.typeRock;
      case 'ghost': return l10n.typeGhost;
      case 'ice': return l10n.typeIce;
      case 'dragon': return l10n.typeDragon;
      default: return _capitalize(type);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final String formattedId = '#${pokemon.id.toString().padLeft(3, '0')}';
    final Color primaryTypeColor = pokemon.types.isNotEmpty
        ? _getTypeColor(pokemon.types.first)
        : Colors.green;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shadowColor: primaryTypeColor.withAlpha(51),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.detalhesPokemon,
            arguments: pokemon,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                isDark ? const Color(0xFF2C2C2C) : Colors.white,
                primaryTypeColor.withAlpha(isDark ? 50 : 20),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top header within card (ID Badge and Circle Accent)
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: primaryTypeColor.withAlpha(31),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            formattedId,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: primaryTypeColor,
                            ),
                          ),
                        ),
                      ),
                      // Animated Hero Image
                      Hero(
                        tag: 'pokemon_image_${pokemon.id}',
                        child: pokemon.imageUrl.isNotEmpty
                            ? Image.network(
                                pokemon.imageUrl,
                                fit: BoxFit.contain,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                    child: SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                      ),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.catching_pokemon,
                                    size: 50,
                                    color: Colors.green.shade200,
                                  );
                                },
                              )
                            : Icon(
                                Icons.catching_pokemon,
                                size: 50,
                                color: Colors.green.shade200,
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Pokemon Name
                Text(
                  _capitalize(pokemon.name),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: isDark ? Colors.white : Colors.green.shade900,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                // Type Badges Wrap
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  alignment: WrapAlignment.center,
                  children: pokemon.types.map((type) {
                    final color = _getTypeColor(type);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        _getTranslatedType(context, type),
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
