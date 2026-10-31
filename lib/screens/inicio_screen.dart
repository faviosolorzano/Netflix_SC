import 'package:flutter/material.dart';

import '../data/datos.dart';
import '../theme/app_theme.dart';
import '../widgets/fila_peliculas.dart';

// Pantalla principal (ruta '/inicio')
class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final perfil = (ModalRoute.of(context)?.settings.arguments
            as Map<String, String>?) ??
        perfiles.first;
    final destacado = buscar('stranger');

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        automaticallyImplyLeading: false,
        titleSpacing: 8,
        title: Image.asset('assets/images/logo_netflix.png', height: 28),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(36),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _Menu('Series'),
                _Menu('Películas'),
                _Menu('Mi lista'),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(perfil['avatar']!, width: 30),
              ),
            ),
          ),
        ],
      ),
      // ListView vertical con el banner y las filas de categorías
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _Banner(pelicula: destacado),
          for (final categoria in categorias) FilaPeliculas(categoria: categoria),
          const SizedBox(height: 24),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined), label: 'Novedades'),
          BottomNavigationBarItem(
              icon: Icon(Icons.download_outlined), label: 'Descargas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Mi Netflix'),
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  final String texto;

  const _Menu(this.texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Text(texto,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Colors.white)),
    );
  }
}

// Banner destacado: Stack con imagen de la nube + degradado + botones en Row
class _Banner extends StatelessWidget {
  final Map<String, dynamic> pelicula;

  const _Banner({required this.pelicula});

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    return SizedBox(
      height: 520,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(pelicula['portada'], fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
                stops: [0.5, 1],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: Column(
              children: [
                Text(pelicula['titulo'].toString().toUpperCase(),
                    style: textos.displayLarge),
                Text('${pelicula['genero']} • Suspenso • Misterio',
                    style: textos.labelMedium?.copyWith(color: Colors.white)),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const _IconoTexto(icono: Icons.add, texto: 'Mi lista'),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pushNamed(context, '/detalle',
                          arguments: pelicula),
                      icon: const Icon(Icons.play_arrow, color: Colors.black),
                      label: const Text('Reproducir',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/detalle',
                          arguments: pelicula),
                      child: const _IconoTexto(
                          icono: Icons.info_outline, texto: 'Info'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconoTexto extends StatelessWidget {
  final IconData icono;
  final String texto;

  const _IconoTexto({required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icono, color: Colors.white),
        Text(texto,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: AppTheme.gris)),
      ],
    );
  }
}
