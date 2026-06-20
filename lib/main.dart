import 'package:flutter/material.dart';

import 'app/app_routes.dart';
import 'app/app_widget.dart';

void main() async {
  // Inicializa o mapa de rotas
  var rotas = await AppRoutes.getRoutes();

  // Inicializa o aplicativo Flutter
  runApp(AppWidget(rotas));
}
