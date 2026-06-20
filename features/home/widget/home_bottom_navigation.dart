import 'package:flutter/material.dart';

class HomeBottomNavigation extends StatelessWidget {
  final int indiceSelecionado;
  final ValueChanged<int> onTap;

  const HomeBottomNavigation({
    super.key,
    required this.indiceSelecionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: indiceSelecionado,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_outlined),
          activeIcon: Icon(Icons.inventory_2),
          label: 'Produtos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_esports_outlined),
          activeIcon: Icon(Icons.sports_esports),
          label: 'Jogos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note_outlined),
          activeIcon: Icon(Icons.music_note),
          label: 'Músicas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Perfil',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.catching_pokemon_outlined),
          activeIcon: Icon(Icons.catching_pokemon),
          label: 'Pokémons',
        ),
      ],
    );
  }
}
