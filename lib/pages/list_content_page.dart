import 'package:flutter/material.dart';
import 'package:application_laboratorio/pages/about_page.dart';

class ListContentPage extends StatelessWidget {
  const ListContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Misiones DMC 1'),
      ),
      body: ListView.builder(
        itemCount: missions.length,
        itemBuilder: (context, index) {
          final mission = missions[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.star),
              title: Text(mission.name),
              subtitle: Text('Tiempo: ${mission.time} - Orbes: ${mission.orbs}'),
            ),
          );
        },
      ),
      persistentFooterButtons: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Volver hacia atrás (al Home)
          },
          child: const Text('Volver'),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutPage()),
            );
          },
          child: const Text('Ir a Sobre'),
        ),
      ],
    );
  }
}
class Mission {
  final String name;
  final String time;
  final int orbs;

  Mission({required this.name, required this.time, required this.orbs});
}
final List<Mission> missions = [
  Mission(name: 'Misión 1', time: '6:00', orbs: 400),
  Mission(name: 'Misión 2', time: '7:00', orbs: 450),
  Mission(name: 'Misión 3', time: '3:00', orbs: 550),
  Mission(name: 'Misión 4', time: '4:00', orbs: 550),
  Mission(name: 'Misión 5', time: '2:00', orbs: 100),
  Mission(name: 'Misión 6', time: '3:30', orbs: 200),
  Mission(name: 'Misión 7', time: '3:00', orbs: 650),
  Mission(name: 'Misión 8', time: '8:00', orbs: 585),
  Mission(name: 'Misión 9', time: '8:00', orbs: 1500),
  Mission(name: 'Misión 10', time: '5:30', orbs: 600),
  Mission(name: 'Misión 11', time: '5:30', orbs: 1000),
  Mission(name: 'Misión 12', time: '4:00', orbs: 700),
  Mission(name: 'Misión 13', time: '2:30', orbs: 200),
  Mission(name: 'Misión 14', time: '5:00', orbs: 500),
  Mission(name: 'Misión 15', time: '10:00', orbs: 1400),
  Mission(name: 'Misión 16', time: '6:00', orbs: 1000),
  Mission(name: 'Misión 17', time: '7:00', orbs: 600),
  Mission(name: 'Misión 18', time: '6:00', orbs: 900),
  Mission(name: 'Misión 19', time: '3:30', orbs: 500),
  Mission(name: 'Misión 20', time: '4:30', orbs: 700),
  Mission(name: 'Misión 21', time: '5:00', orbs: 100),
  Mission(name: 'Misión 22', time: '5:00', orbs: 0),
  Mission(name: 'Misión 23', time: '7:00', orbs: 600),
];

