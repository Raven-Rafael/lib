import 'package:flutter/material.dart';

import '../../app/app_routes.dart';
import '../../shared/models/produto.dart';
import 'widget/produto_card.dart';

class ProdutosPage extends StatelessWidget {
  const ProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: produtosFake.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final produto = produtosFake[index];

        return ProdutoCard(
          produto: produto,
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.detalhesProduto,
              arguments: produto,
            );
          },
        );
      },
    );
  }
}
