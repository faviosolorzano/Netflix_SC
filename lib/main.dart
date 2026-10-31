import 'package:flutter/material.dart';

import 'screens/detalle_screen.dart';
import 'screens/inicio_screen.dart';
import 'screens/perfiles_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.tema, // Tema global
      initialRoute: '/',
      // Rutas con nombre
      routes: {
        '/': (context) => const PerfilesScreen(),
        '/inicio': (context) => const InicioScreen(),
        '/detalle': (context) => const DetalleScreen(),
      },
    );
  }
}
