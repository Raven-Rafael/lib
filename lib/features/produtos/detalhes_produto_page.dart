import 'package:flutter/material.dart';

import '../../shared/models/produto.dart';
import 'widget/detalhes_produto_conteudo.dart';

class DetalhesProdutoPage extends StatelessWidget {
  const DetalhesProdutoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final produto = ModalRoute.of(context)?.settings.arguments as Produto?;

    if (produto == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Produto')),
        body: const Center(
          child: Text('Produto não encontrado.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
      ),
      body: DetalhesProdutoConteudo(produto: produto),
    );
  }
}
