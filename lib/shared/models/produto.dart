class Produto {
  final String nome;
  final double preco;
  final String descricao;
  final String urlImagem;

  const Produto({
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.urlImagem,
  });
}

const List<Produto> produtosFake = [
  Produto(
    nome: 'Smartphone Orion X1',
    preco: 2499.90,
    descricao:
        'Smartphone com tela AMOLED de 6.5 polegadas, câmera tripla e bateria para o dia todo.',
    urlImagem: 'https://picsum.photos/seed/produto-orion-x1/800/600',
  ),
  Produto(
    nome: 'Notebook Atlas Pro',
    preco: 5299.00,
    descricao:
        'Notebook leve para estudos, programação e produtividade, com SSD rápido e acabamento premium.',
    urlImagem: 'https://picsum.photos/seed/produto-atlas-pro/800/600',
  ),
  Produto(
    nome: 'Headphone Pulse Max',
    preco: 399.90,
    descricao:
        'Headphone Bluetooth com cancelamento de ruído, almofadas confortáveis e áudio imersivo.',
    urlImagem: 'https://picsum.photos/seed/produto-pulse-max/800/600',
  ),
  Produto(
    nome: 'Smartwatch Fit Go',
    preco: 799.50,
    descricao:
        'Relógio inteligente com monitoramento de atividades, notificações e resistência à água.',
    urlImagem: 'https://picsum.photos/seed/produto-fit-go/800/600',
  ),
  Produto(
    nome: 'Câmera Action Wave',
    preco: 1199.90,
    descricao:
        'Câmera compacta para vídeos em alta resolução, ideal para viagens, esportes e aventuras.',
    urlImagem: 'https://picsum.photos/seed/produto-action-wave/800/600',
  ),
  Produto(
    nome: 'Caixa Sound Mini',
    preco: 249.90,
    descricao:
        'Caixa de som portátil com graves reforçados, conexão sem fio e bateria de longa duração.',
    urlImagem: 'https://picsum.photos/seed/produto-sound-mini/800/600',
  ),
];
