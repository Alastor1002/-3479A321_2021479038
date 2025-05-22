import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:application_laboratorio/provider/app_data.dart'; 

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    final TextEditingController nameController = TextEditingController(text: appData.userName);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre la App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              textDirection: TextDirection.ltr,
              decoration: const InputDecoration(
                labelText: 'Nombre de Usuario',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                appData.updateUserName(value);
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Habilitar reinicio/resta:'),
                const SizedBox(width: 10),
                Switch(
                  value: appData.resetEnabled,
                  onChanged: (value) {
                    appData.toggleResetEnabled(value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Laboratorio 6 - Programación para Dispositivos Móviles\n\n'
              'Autor: José Migueles.\n\n',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
