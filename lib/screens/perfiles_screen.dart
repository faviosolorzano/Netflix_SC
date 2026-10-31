import 'package:flutter/material.dart';

import '../data/datos.dart';
import '../theme/app_theme.dart';

// Pantalla "¿Quién está viendo ahora?" (ruta '/')
class PerfilesScreen extends StatelessWidget {
  const PerfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/logo_netflix.png', height: 36),
        actions: [
          IconButton(icon: const Icon(Icons.edit_outlined), onPressed: () {}),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text('¿Quién está viendo ahora?',
                  style: textos.headlineMedium),
              const SizedBox(height: 30),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  for (final perfil in perfiles) _Perfil(perfil: perfil),
                  _AgregarPerfil(),
                ],
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.gris,
                  side: const BorderSide(color: AppTheme.gris),
                  shape: const RoundedRectangleBorder(),
                ),
                child: const Text('ADMINISTRAR PERFILES',
                    style: TextStyle(
                        fontFamily: 'RobotoCondensed', letterSpacing: 2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Perfil extends StatelessWidget {
  final Map<String, String> perfil;

  const _Perfil({required this.perfil});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, '/inicio',
          arguments: perfil),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            // Imagen LOCAL
            child: Image.asset(perfil['avatar']!, width: 100, height: 100),
          ),
          const SizedBox(height: 8),
          Text(perfil['nombre']!,
              style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}

class _AgregarPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.gris),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.add, size: 50, color: AppTheme.gris),
        ),
        const SizedBox(height: 8),
        Text('Agregar perfil', style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
