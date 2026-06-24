import 'package:flutter/material.dart';
import 'dart:io';
import 'app/app_routes.dart';
import 'app/app_widget.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();

  // A correção está aqui nesta linha: mudamos de MyApp para AppWidget!
  runApp(const AppWidget());
}
