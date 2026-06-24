import 'package:flutter/material.dart';
import '../../shared/models/pokemon.dart';
import 'package:yasmin/l10n/app_localizations.dart';
import '../../shared/services/favorites_service.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({super.key});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  final FavoritesService _favoritesService = FavoritesService();
  bool _isFavorite = false;
  bool _hasLoaded = false;
  Pokemon? _pokemon;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasLoaded) {
      _pokemon = ModalRoute.of(context)?.settings.arguments as Pokemon?;
      if (_pokemon != null) {
        _loadFavoriteStatus();
      }
      _hasLoaded = true;
    }
  }

  Future<void> _loadFavoriteStatus() async {
    if (_pokemon == null) return;
    final isFav = await _favoritesService.isFavorite(_pokemon!.id);
    if (mounted) {
      setState(() {
        _isFavorite = isFav;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    if (_pokemon == null) return;
    // UI First update
    setState(() {
      _isFavorite = !_isFavorite;
    });
    await _favoritesService.toggleFavorite(_pokemon!.id);
  }

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
    if (_pokemon == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.detailsTitle),
        ),
        body: Center(
          child: Text(
            AppLocalizations.of(context)!.noPokemon,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    final pokemon = _pokemon!;
    final String formattedId = '#${pokemon.id.toString().padLeft(3, '0')}';
    final Color primaryTypeColor = pokemon.types.isNotEmpty
        ? _getTypeColor(pokemon.types.first)
        : Colors.green;
        
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.green.shade900;
    final subTextColor = isDark ? Colors.white70 : Colors.grey.shade600;
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : primaryTypeColor.withAlpha(13),
      appBar: AppBar(
        backgroundColor: primaryTypeColor,
        foregroundColor: Colors.white,
        title: Text(
          _capitalize(pokemon.name),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.redAccent : Colors.white70,
            ),
            onPressed: _toggleFavorite,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 8),
            child: Center(
              child: Text(
                formattedId,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white70,
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
                    color: primaryTypeColor.withAlpha(77),
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
                        color: Colors.white.withAlpha(38),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: pokemon.imageUrl.isNotEmpty
                          ? Image.network(
                              pokemon.imageUrl,
                              fit: BoxFit.contain,
                              loadingBuilder: (context, child, loadingProgress) {
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
                color: cardColor,
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
                            color: textColor,
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
                            color: subTextColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.types,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor,
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
                              _getTranslatedType(context, type),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.generalCharacteristics,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatItem(AppLocalizations.of(context)!.generation, '1ª Geração', context),
                          _buildStatItem(AppLocalizations.of(context)!.originRegion, 'Kanto', context),
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

  Widget _buildStatItem(String label, String value, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.white60 : Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            color: isDark ? Colors.white : Colors.green.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
