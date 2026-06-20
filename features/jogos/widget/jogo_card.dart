import 'package:flutter/material.dart';

import '../../../shared/models/jogo.dart';

class JogoCard extends StatelessWidget {
  final Jogo jogo;

  const JogoCard({
    super.key,
    required this.jogo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            jogo.urlImagem,
            width: double.infinity,
            height: 160,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const SizedBox(
                height: 160,
                child: Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 160,
                width: double.infinity,
                color: Colors.black12,
                child: const Icon(Icons.image_not_supported_outlined),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jogo.titulo,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 6),
                Text('${jogo.genero} • ${jogo.plataforma}'),
                const SizedBox(height: 10),
                Text(
                  jogo.descricao,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
