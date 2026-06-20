import 'package:flutter/material.dart';

import '../../shared/models/jogo.dart';
import 'widget/jogo_card.dart';

class JogosPage extends StatelessWidget {
  const JogosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: jogosFake.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final jogo = jogosFake[index];
        return JogoCard(jogo: jogo);
      },
    );
  }
}
