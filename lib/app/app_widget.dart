import 'package:flutter/material.dart';

import 'app_routes.dart';

// Gerenciador global simples para o tema da aplicação
final ValueNotifier<ThemeMode> appThemeNotifier = ValueNotifier(ThemeMode.light);

class AppWidget extends StatelessWidget {
  final Map<String, WidgetBuilder> _rotas;

  const AppWidget(this._rotas, {super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: appThemeNotifier,
      builder: (context, currentMode, child) {
        final esquemaDeCoresLight = ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
        );

        final esquemaDeCoresDark = ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        );

        return MaterialApp(
          title: 'Pokédex',
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          theme: ThemeData(
            colorScheme: esquemaDeCoresLight,
            scaffoldBackgroundColor: const Color(0xFFF3FAF4),
            appBarTheme: AppBarTheme(
              backgroundColor: esquemaDeCoresLight.primary,
              foregroundColor: esquemaDeCoresLight.onPrimary,
              centerTitle: true,
              elevation: 2,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: esquemaDeCoresLight.primary,
              unselectedItemColor: Colors.green.shade900.withAlpha(140),
              backgroundColor: esquemaDeCoresLight.surface,
              type: BottomNavigationBarType.fixed,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: esquemaDeCoresLight.primary,
                foregroundColor: esquemaDeCoresLight.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: esquemaDeCoresLight.primary,
              foregroundColor: esquemaDeCoresLight.onPrimary,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: esquemaDeCoresDark,
            scaffoldBackgroundColor: const Color(0xFF121212),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.green.shade900,
              foregroundColor: Colors.white,
              centerTitle: true,
              elevation: 2,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.greenAccent,
              unselectedItemColor: Colors.white54,
              backgroundColor: const Color(0xFF1E1E1E),
              type: BottomNavigationBarType.fixed,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            cardTheme: const CardThemeData(
              color: Color(0xFF1E1E1E),
              shadowColor: Colors.black,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.green.shade700,
              foregroundColor: Colors.white,
            ),
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.home,
          routes: _rotas,
        );
      },
    );
  }
}
