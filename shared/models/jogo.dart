class Jogo {
  final String titulo;
  final String genero;
  final String plataforma;
  final String descricao;
  final String urlImagem;

  const Jogo({
    required this.titulo,
    required this.genero,
    required this.plataforma,
    required this.descricao,
    required this.urlImagem,
  });
}

const List<Jogo> jogosFake = [
  Jogo(
    titulo: 'Reino dos Cogumelos',
    genero: 'Plataforma',
    plataforma: 'Nintendo Switch',
    descricao:
        'Aventura colorida inspirada em fases de plataforma, power-ups, moedas e chefes carismáticos.',
    urlImagem: 'https://picsum.photos/seed/jogo-reino-cogumelos/800/600',
  ),
  Jogo(
    titulo: 'Lenda do Herói Verde',
    genero: 'Ação e aventura',
    plataforma: 'Nintendo Switch',
    descricao:
        'Explore campos, templos e masmorras em uma jornada inspirada por grandes aventuras de fantasia.',
    urlImagem: 'https://picsum.photos/seed/jogo-heroi-verde/800/600',
  ),
  Jogo(
    titulo: 'Kart Estelar',
    genero: 'Corrida arcade',
    plataforma: 'Nintendo Switch',
    descricao:
        'Corridas rápidas com itens especiais, pistas malucas e disputas locais para vários jogadores.',
    urlImagem: 'https://picsum.photos/seed/jogo-kart-estelar/800/600',
  ),
  Jogo(
    titulo: 'Criaturas de Bolso',
    genero: 'RPG e coleção',
    plataforma: 'Nintendo Switch',
    descricao:
        'Capture, treine e evolua criaturas em uma campanha leve com batalhas por turno e exploração.',
    urlImagem: 'https://picsum.photos/seed/jogo-criaturas-bolso/800/600',
  ),
  Jogo(
    titulo: 'Vila Encantada',
    genero: 'Simulação social',
    plataforma: 'Nintendo Switch',
    descricao:
        'Personalize sua casa, converse com moradores e organize a rotina de uma vila tranquila.',
    urlImagem: 'https://picsum.photos/seed/jogo-vila-encantada/800/600',
  ),
  Jogo(
    titulo: 'Caçadora Galáctica',
    genero: 'Ação e exploração',
    plataforma: 'Nintendo Switch',
    descricao:
        'Explore laboratórios alienígenas, desbloqueie habilidades e enfrente ameaças espaciais.',
    urlImagem: 'https://picsum.photos/seed/jogo-cacadora-galactica/800/600',
  ),
];
