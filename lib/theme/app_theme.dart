import 'package:flutter/material.dart';

// Tema global de la app con 3 tipos de letra:
//  - BebasNeue      -> títulos grandes (estilo logo Netflix)
//  - Poppins        -> texto general
//  - RobotoCondensed -> etiquetas y detalles pequeños
class AppTheme {
  static const Color rojo = Color(0xFFE50914);
  static const Color negro = Color(0xFF000000);
  static const Color grisOscuro = Color(0xFF141414);
  static const Color gris = Color(0xFF808080);

  static ThemeData get tema => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: negro,
        primaryColor: rojo,
        fontFamily: 'Poppins',
        colorScheme: const ColorScheme.dark(
          primary: rojo,
          secondary: Colors.white,
          surface: grisOscuro,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        cardTheme: CardThemeData(
          color: grisOscuro,
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'BebasNeue', fontSize: 44, letterSpacing: 2),
          headlineMedium: TextStyle(
              fontFamily: 'BebasNeue', fontSize: 30, letterSpacing: 1.5),
          titleLarge: TextStyle(
              fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontFamily: 'Poppins', fontSize: 15),
          bodyMedium: TextStyle(fontFamily: 'Poppins', fontSize: 13),
          labelMedium: TextStyle(
              fontFamily: 'RobotoCondensed', fontSize: 13, color: gris),
          labelSmall: TextStyle(
              fontFamily: 'RobotoCondensed', fontSize: 11, letterSpacing: 1),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: grisOscuro,
          selectedItemColor: Colors.white,
          unselectedItemColor: gris,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontFamily: 'RobotoCondensed'),
          unselectedLabelStyle: TextStyle(fontFamily: 'RobotoCondensed'),
        ),
      );
}
