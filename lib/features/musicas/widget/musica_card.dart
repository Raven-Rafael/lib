import 'package:flutter/material.dart';

import '../../../shared/models/musica.dart';

class MusicaCard extends StatelessWidget {
  final Musica musica;

  const MusicaCard({
    super.key,
    required this.musica,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            musica.urlImagem,
            width: 64,
            height: 64,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 64,
                height: 64,
                color: Colors.black12,
                child: const Icon(Icons.music_note_outlined),
              );
            },
          ),
        ),
        title: Text(
          musica.titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${musica.artista} • ${musica.album}'),
        trailing: Text(musica.duracao),
      ),
    );
  }
}
