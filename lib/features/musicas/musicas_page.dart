import 'package:flutter/material.dart';

import '../../shared/models/musica.dart';
import 'widget/musica_card.dart';

class MusicasPage extends StatelessWidget {
  const MusicasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: musicasFake.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final musica = musicasFake[index];
        return MusicaCard(musica: musica);
      },
    );
  }
}
