import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

// Card con el póster (imagen de la nube). Al tocarlo abre la ruta /detalle.
class PosterCard extends StatelessWidget {
  final Map<String, dynamic> pelicula;
  final double ancho;

  const PosterCard({super.key, required this.pelicula, this.ancho = 110});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, '/detalle', arguments: pelicula),
      child: SizedBox(
        width: ancho,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Image.network(
            pelicula['imagen'],
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progreso) => progreso == null
                ? child
                : const Center(
                    child: CircularProgressIndicator(
                        color: AppTheme.rojo, strokeWidth: 2)),
            errorBuilder: (context, error, stack) => Center(
              child: Text(pelicula['titulo'],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall),
            ),
          ),
        ),
      ),
    );
  }
}
