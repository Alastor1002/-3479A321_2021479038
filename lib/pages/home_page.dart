import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:application_laboratorio/pages/about_page.dart';
import 'package:application_laboratorio/pages/list_content_page.dart';
import 'package:provider/provider.dart';
import 'package:application_laboratorio/provider/app_data.dart'; 

const String aIcon = "assets/icons/A.svg";
const String bIcon = "assets/icons/B.svg";
const String cIcon = "assets/icons/C.svg";
const String dIcon = "assets/icons/D.svg";
const String sIcon = "assets/icons/S.svg";

String getIconForCounter(int counter) {
  if (counter >= 20) return sIcon;
  if (counter >= 15) return aIcon;
  if (counter >= 10) return bIcon;
  if (counter >= 5) return cIcon;
  return dIcon;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() {
    print("createState: Se crea el estado del widget");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {
    print("Constructor _MyHomePageState. mounted: $mounted");
  }

  @override
  void initState() {
    super.initState();
    print("initState: Widget insertado en el árbol. mounted: $mounted");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies: Dependencias cambiaron.");
  }

  @override
  void setState(VoidCallback fn) {
    print("setState: Se actualiza el estado del widget.");
    super.setState(fn);
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget: Widget actualizado.");
  }

  @override
  void deactivate() {
    print("deactivate: Widget removido temporalmente del árbol.");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose: Widget eliminado permanentemente.");
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble: Hot reload ejecutado.");
  }

  List<Widget> _buildFooterButtons(BuildContext context) {
  final appData = context.read<AppData>();
  final List<Widget> buttons = [];
 
  if (appData.resetEnabled) {
    buttons.add(
      IconButton(
        icon: const Icon(Icons.remove),
        tooltip: 'Restar',
        onPressed: () {
          print("Resto");
          appData.decrementCounter();
        },
      ),
    );
  } else {
    buttons.add(
      IconButton(
        icon: const Icon(Icons.remove, color: Colors.grey),
        tooltip: 'Restar (deshabilitado)',
        onPressed: null,
      ),
    );
  }

  buttons.add(
    IconButton(
      icon: const Icon(Icons.add),
      tooltip: 'Sumar',
      onPressed: () {
        print("Sumo");
        appData.incrementCounter();
      },
    ),
  );

  if (appData.resetEnabled) {
    buttons.add(
      IconButton(
        icon: const Icon(Icons.refresh),
        tooltip: 'Reiniciar',
        onPressed: () {
          print("Reseteo");
          appData.resetCounter();
        },
      ),
    );
  } else {
    buttons.add(
      IconButton(
        icon: const Icon(Icons.refresh, color: Colors.grey),
        tooltip: 'Reiniciar (deshabilitado)',
        onPressed: null,
      ),
    );
  }

  return buttons;
}

  @override
  Widget build(BuildContext context) {
    print("build: Se construye la UI del widget.");

    final appData = context.watch<AppData>();
    final counter = appData.counter;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          color: Theme.of(context).cardColor,
          margin: const EdgeInsets.all(16),
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(getIconForCounter(counter), width: 100, height: 100),
                const SizedBox(height: 20),
                Text(
                  '¡Bienvenido ${appData.userName}!', 
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  'Contador: $counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListContentPage()),
                    );
                  },
                  child: const Text('Ir a Lista de Contenido'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutPage()),
                    );
                  },
                  child: const Text('Ir a Sobre la App'),
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: _buildFooterButtons(context),
    );
  }
}
