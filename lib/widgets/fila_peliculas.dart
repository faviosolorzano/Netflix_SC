import 'package:flutter/material.dart';

import '../data/datos.dart';
import 'poster_card.dart';

// Fila de la pantalla de inicio: Column (título) + ListView horizontal (pósters)
class FilaPeliculas extends StatelessWidget {
  final Map<String, dynamic> categoria;

  const FilaPeliculas({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.from(categoria['items']);
    final bool esTop = categoria['top'] == true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 18, 12, 8),
          child: Text(categoria['titulo'],
              style: Theme.of(context).textTheme.titleLarge),
        ),
        SizedBox(
          height: 165,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: items.length,
            itemBuilder: (context, i) {
              final pelicula = buscar(items[i]);
              if (!esTop) return PosterCard(pelicula: pelicula);
              // Top 10: número grande + póster en un Row
              return Row(
                children: [
                  Text(
                    '${i + 1}',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 110,
                          height: 1,
                          color: Colors.black,
                          shadows: const [
                            Shadow(color: Colors.white, blurRadius: 2),
                            Shadow(color: Colors.white, offset: Offset(1, 1)),
                          ],
                        ),
                  ),
                  PosterCard(pelicula: pelicula, ancho: 100),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
