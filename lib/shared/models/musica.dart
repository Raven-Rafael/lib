class Musica {
  final String titulo;
  final String artista;
  final String album;
  final String duracao;
  final String urlImagem;

  const Musica({
    required this.titulo,
    required this.artista,
    required this.album,
    required this.duracao,
    required this.urlImagem,
  });
}

const List<Musica> musicasFake = [
  Musica(
    titulo: 'Noite Sintética',
    artista: 'Lia Vector',
    album: 'Horizonte Neon',
    duracao: '3:42',
    urlImagem: 'https://picsum.photos/seed/musica-noite-sintetica/800/600',
  ),
  Musica(
    titulo: 'Café Lunar',
    artista: 'Banda Prisma',
    album: 'Orbitais',
    duracao: '4:08',
    urlImagem: 'https://picsum.photos/seed/musica-cafe-lunar/800/600',
  ),
  Musica(
    titulo: 'Rua das Frequências',
    artista: 'DJ Aurora',
    album: 'Pulso Urbano',
    duracao: '2:57',
    urlImagem: 'https://picsum.photos/seed/musica-rua-frequencias/800/600',
  ),
  Musica(
    titulo: 'Chuva em Marte',
    artista: 'Os Paralelos',
    album: 'Sinais Distantes',
    duracao: '5:11',
    urlImagem: 'https://picsum.photos/seed/musica-chuva-marte/800/600',
  ),
];
