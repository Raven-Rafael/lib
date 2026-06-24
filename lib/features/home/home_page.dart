import 'package:flutter/material.dart';
import 'package:yasmin/l10n/app_localizations.dart';
import '../perfil/perfil_page.dart';
import '../pokemons/pokemon_page.dart';
import '../pokemons/components/pokemon_drawer.dart';
import 'widget/home_bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceSelecionado = 0;

  final List<Widget> _paginas = const [
    PokemonPage(),
    PerfilPage(),
  ];



  void _alterarPagina(int novoIndice) {
    setState(() {
      _indiceSelecionado = novoIndice;
    });
  }

  @override
  Widget build(BuildContext context) {
    final titulos = [
      AppLocalizations.of(context)!.pokedexTitle,
      AppLocalizations.of(context)!.profileTitle,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titulos[_indiceSelecionado],
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const PokemonDrawer(),
      body: IndexedStack(
        index: _indiceSelecionado,
        children: _paginas,
      ),
      bottomNavigationBar: HomeBottomNavigation(
        indiceSelecionado: _indiceSelecionado,
        onTap: _alterarPagina,
      ),
    );
  }
}
