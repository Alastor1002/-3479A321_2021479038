import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:application_laboratorio/provider/app_data.dart';
import 'pages/home_page.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppData(),
      child: const CardExampleApp(),
    ),
  );
}

class CardExampleApp extends StatelessWidget {
  const CardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devil May Cry App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF8B0000),
        scaffoldBackgroundColor: Colors.black,
        cardColor: const Color(0xFF8B0000),
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
