import 'package:flutter/material.dart';

import '../data/datos.dart';
import '../theme/app_theme.dart';

// Detalle de una serie (ruta '/detalle'), recibe el Map de la serie por argumentos
class DetalleScreen extends StatelessWidget {
  const DetalleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Si se abre sin argumentos (p. ej. recargando la página) muestra una por defecto
    final pelicula = (ModalRoute.of(context)?.settings.arguments
            as Map<String, dynamic>?) ??
        buscar('merlina');
    final textos = Theme.of(context).textTheme;

    // Lista de episodios generada como Lista de Mapas
    final List<Map<String, dynamic>> episodios = List.generate(
      6,
      (i) => {
        'numero': i + 1,
        'nombre': 'Capítulo ${i + 1}',
        'duracion': '${48 + i * 3} min',
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(icon: const Icon(Icons.cast), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          // Imagen de la nube con botón de play encima
          SizedBox(
            height: 230,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(pelicula['portada'] ?? pelicula['imagen'],
                    fit: BoxFit.cover, alignment: Alignment.topCenter),
                const Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black54,
                    child:
                        Icon(Icons.play_arrow, size: 40, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pelicula['titulo'], style: textos.headlineMedium),
                const SizedBox(height: 6),
                // Datos en una fila
                Row(
                  children: [
                    Text('${pelicula['coincidencia']}% para ti',
                        style: textos.labelMedium?.copyWith(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Text('${pelicula['anio']}', style: textos.labelMedium),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
                      color: Colors.grey[800],
                      child: Text(pelicula['edad'], style: textos.labelSmall),
                    ),
                    const SizedBox(width: 10),
                    Text('${pelicula['temporadas']} temporadas',
                        style: textos.labelMedium),
                    const SizedBox(width: 10),
                    const Icon(Icons.hd_outlined, size: 18),
                  ],
                ),
                const SizedBox(height: 12),
                _BotonAncho(
                  icono: Icons.play_arrow,
                  texto: 'Reproducir',
                  fondo: Colors.white,
                  color: Colors.black,
                ),
                const SizedBox(height: 8),
                _BotonAncho(
                  icono: Icons.download,
                  texto: 'Descargar T1:E1',
                  fondo: Colors.grey[850]!,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                Text(pelicula['descripcion'], style: textos.bodyMedium),
                const SizedBox(height: 6),
                Text('Género: ${pelicula['genero']}',
                    style: textos.labelMedium),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _Accion(icono: Icons.add, texto: 'Mi lista'),
                    _Accion(icono: Icons.thumb_up_outlined, texto: 'Calificar'),
                    _Accion(icono: Icons.share_outlined, texto: 'Compartir'),
                  ],
                ),
                const Divider(height: 32, color: AppTheme.rojo, thickness: 3),
                Text('EPISODIOS', style: textos.headlineMedium),
                Text('Temporada 1', style: textos.labelMedium),
              ],
            ),
          ),
          // Episodios: Card + ListTile
          for (final ep in episodios)
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(pelicula['imagen'],
                      width: 50, height: 70, fit: BoxFit.cover),
                ),
                title: Text('${ep['numero']}. ${ep['nombre']}',
                    style: textos.titleMedium),
                subtitle: Text(ep['duracion'], style: textos.labelMedium),
                trailing: const Icon(Icons.download_outlined),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: AppTheme.rojo,
                    content: Text(
                        'Reproduciendo ${pelicula['titulo']} - ${ep['nombre']}'),
                  ));
                },
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _BotonAncho extends StatelessWidget {
  final IconData icono;
  final String texto;
  final Color fondo;
  final Color color;

  const _BotonAncho({
    required this.icono,
    required this.texto,
    required this.fondo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icono, color: color),
        label: Text(texto,
            style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: fondo,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }
}

class _Accion extends StatelessWidget {
  final IconData icono;
  final String texto;

  const _Accion({required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icono, size: 28),
        const SizedBox(height: 4),
        Text(texto, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
