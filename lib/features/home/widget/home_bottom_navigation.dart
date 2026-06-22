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
          icon: Icon(Icons.catching_pokemon_outlined),
          activeIcon: Icon(Icons.catching_pokemon),
          label: 'Pokémons',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
