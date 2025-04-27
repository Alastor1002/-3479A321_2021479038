import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre la App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Laboratorio 5 - Programación para Dispositivos Móviles\n\n'
              'Autor: José Migueles.\n\n'
              'Esta aplicación muestra la lista de misiones del primer Devil May Cry, junto con los requisitos necesarios para obtener el rango S en cada una de ellas.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Vuelve atrás
              },
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
