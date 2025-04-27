import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages/home_page.dart'; 

void main() {
  runApp(const CardExampleApp());
}

class CardExampleApp extends StatelessWidget {
  const CardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devil May Cry App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF8B0000),
        scaffoldBackgroundColor: Colors.black,
        cardColor: Color(0xFF8B0000),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8B0000),
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFB22222),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF8B0000),
          foregroundColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Devil May Cry Home'),
    );
  }
}
