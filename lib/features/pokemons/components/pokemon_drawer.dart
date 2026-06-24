import 'package:flutter/material.dart';
import 'package:yasmin/l10n/app_localizations.dart';
import '../../../app/app_widget.dart';

class PokemonDrawer extends StatelessWidget {
  const PokemonDrawer({super.key});

  void _toggleType(String type, bool value) {
    // Cria uma nova instância de Set para engatilhar o ValueNotifier
    final currentSet = Set<String>.from(selectedTypesNotifier.value);
    if (value) {
      currentSet.add(type);
    } else {
      currentSet.remove(type);
    }
    selectedTypesNotifier.value = currentSet;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              l10n.pokedexTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ExpansionTile(
            initiallyExpanded: true,
            title: Text(l10n.filterType),
            leading: const Icon(Icons.category),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ValueListenableBuilder<Set<String>>(
                    valueListenable: selectedTypesNotifier,
                    builder: (context, selectedTypes, _) {
                      return Wrap(
                        spacing: 8.0,
                        children: [
                          FilterChip(
                            label: Text(l10n.typeWater),
                            selected: selectedTypes.contains('water'),
                            onSelected: (val) => _toggleType('water', val),
                            selectedColor: Colors.blue.shade600,
                          ),
                          FilterChip(
                            label: Text(l10n.typeFire),
                            selected: selectedTypes.contains('fire'),
                            onSelected: (val) => _toggleType('fire', val),
                            selectedColor: Colors.orange.shade700,
                          ),
                          FilterChip(
                            label: Text(l10n.typeGrass),
                            selected: selectedTypes.contains('grass'),
                            onSelected: (val) => _toggleType('grass', val),
                            selectedColor: Colors.green.shade600,
                          ),
                          FilterChip(
                            label: Text(l10n.typeElectric),
                            selected: selectedTypes.contains('electric'),
                            onSelected: (val) => _toggleType('electric', val),
                            selectedColor: Colors.amber.shade700,
                          ),
                          FilterChip(
                            label: Text(l10n.typeNormal),
                            selected: selectedTypes.contains('normal'),
                            onSelected: (val) => _toggleType('normal', val),
                            selectedColor: Colors.grey.shade500,
                          ),
                          FilterChip(
                            label: Text(l10n.typePoison),
                            selected: selectedTypes.contains('poison'),
                            onSelected: (val) => _toggleType('poison', val),
                            selectedColor: Colors.purple.shade600,
                          ),
                          FilterChip(
                            label: Text(l10n.typePsychic),
                            selected: selectedTypes.contains('psychic'),
                            onSelected: (val) => _toggleType('psychic', val),
                            selectedColor: Colors.pink.shade600,
                          ),
                          FilterChip(
                            label: Text(l10n.typeRock),
                            selected: selectedTypes.contains('rock'),
                            onSelected: (val) => _toggleType('rock', val),
                            selectedColor: Colors.grey.shade700,
                          ),
                          FilterChip(
                            label: Text(l10n.typeGround),
                            selected: selectedTypes.contains('ground'),
                            onSelected: (val) => _toggleType('ground', val),
                            selectedColor: Colors.brown.shade500,
                          ),
                          FilterChip(
                            label: Text(l10n.typeFighting),
                            selected: selectedTypes.contains('fighting'),
                            onSelected: (val) => _toggleType('fighting', val),
                            selectedColor: Colors.red.shade800,
                          ),
                          FilterChip(
                            label: Text(l10n.typeIce),
                            selected: selectedTypes.contains('ice'),
                            onSelected: (val) => _toggleType('ice', val),
                            selectedColor: Colors.cyan.shade600,
                          ),
                          FilterChip(
                            label: Text(l10n.typeBug),
                            selected: selectedTypes.contains('bug'),
                            onSelected: (val) => _toggleType('bug', val),
                            selectedColor: Colors.lightGreen.shade700,
                          ),
                          FilterChip(
                            label: Text(l10n.typeGhost),
                            selected: selectedTypes.contains('ghost'),
                            onSelected: (val) => _toggleType('ghost', val),
                            selectedColor: Colors.indigo.shade700,
                          ),
                          FilterChip(
                            label: Text(l10n.typeDragon),
                            selected: selectedTypes.contains('dragon'),
                            onSelected: (val) => _toggleType('dragon', val),
                            selectedColor: Colors.indigo.shade900,
                          ),
                          FilterChip(
                            label: Text('Voador'),
                            selected: selectedTypes.contains('flying'),
                            onSelected: (val) => _toggleType('flying', val),
                            selectedColor: Colors.indigo.shade300,
                          ),
                        ],
                      );
                    }),
              ),
              const SizedBox(height: 16),
            ],
          ),
          const Divider(),
          ValueListenableBuilder<ThemeMode>(
            valueListenable: appThemeNotifier,
            builder: (context, currentMode, _) {
              final isDark = Theme.of(context).brightness == Brightness.dark;
              final bool switchState = currentMode == ThemeMode.dark ||
                  (currentMode == ThemeMode.system && isDark);

              return SwitchListTile(
                title: Text(l10n.themeDark),
                secondary: const Icon(Icons.dark_mode),
                value: switchState,
                onChanged: (bool value) {
                  appThemeNotifier.value =
                      value ? ThemeMode.dark : ThemeMode.light;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
