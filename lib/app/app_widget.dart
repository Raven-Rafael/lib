import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppWidget extends StatelessWidget {
  final Map<String, WidgetBuilder> _rotas;

  const AppWidget(this._rotas, {super.key});

  @override
  Widget build(BuildContext context) {
    final esquemaDeCores = ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.light,
    );

    return MaterialApp(
      title: 'Catálogo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: esquemaDeCores,
        scaffoldBackgroundColor: const Color(0xFFF3FAF4),
        appBarTheme: AppBarTheme(
          backgroundColor: esquemaDeCores.primary,
          foregroundColor: esquemaDeCores.onPrimary,
          centerTitle: true,
          elevation: 2,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: esquemaDeCores.primary,
          unselectedItemColor: Colors.green.shade900.withOpacity(0.55),
          backgroundColor: esquemaDeCores.surface,
          type: BottomNavigationBarType.fixed,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: esquemaDeCores.primary,
            foregroundColor: esquemaDeCores.onPrimary,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: esquemaDeCores.primary,
          foregroundColor: esquemaDeCores.onPrimary,
        ),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      routes: _rotas,
    );
  }
}
