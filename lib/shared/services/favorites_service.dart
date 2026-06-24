import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String _favoritesKey = 'favorite_pokemons';

  Future<void> toggleFavorite(int pokemonId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_favoritesKey) ?? [];
    
    final idString = pokemonId.toString();
    if (favorites.contains(idString)) {
      favorites.remove(idString);
    } else {
      favorites.add(idString);
    }
    
    await prefs.setStringList(_favoritesKey, favorites);
  }

  Future<bool> isFavorite(int pokemonId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_favoritesKey) ?? [];
    return favorites.contains(pokemonId.toString());
  }

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }
}
