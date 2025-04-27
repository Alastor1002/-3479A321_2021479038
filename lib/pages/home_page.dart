import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:application_laboratorio/pages/about_page.dart';
import 'package:application_laboratorio/pages/list_content_page.dart';

const String svgString = 'assets/icons/8666582_chevrons_up_icon.svg';
const String aIcon = "assets/icons/A.svg";
const String bIcon = "assets/icons/B.svg";
const String cIcon = "assets/icons/C.svg";
const String dIcon = "assets/icons/D.svg";
const String sIcon = "assets/icons/S.svg";

String getIconForCounter(int counter) {
  if (counter >= 20) {
    return sIcon;
  } else if (counter >= 15) {
    return aIcon;
  } else if (counter >= 10) {
    return bIcon;
  } else if (counter >= 5) {
    return cIcon;
  } else {
    return dIcon;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  List<Widget> _buildFooterButtons() {
    return [
      IconButton(
        icon: const Icon(Icons.remove),
        tooltip: 'Restar',
        onPressed: _decrementCounter,
      ),
      IconButton(
        icon: const Icon(Icons.add),
        tooltip: 'Sumar',
        onPressed: _incrementCounter,
      ),
      IconButton(
        icon: const Icon(Icons.refresh),
        tooltip: 'Reiniciar',
        onPressed: _resetCounter,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                SvgPicture.asset(getIconForCounter(_counter), width: 100, height: 100),
                const SizedBox(height: 20),
                const Text(
                  '¡Bienvenido a Flutter!',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  'Contador: $_counter',
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
      persistentFooterButtons: _buildFooterButtons(),
    );
  }
}
