import 'package:audevi/features/receita.dart';
import 'package:audevi/apresentacao/about_page.dart';
import 'package:audevi/apresentacao/how_to_use_page.dart';
import 'package:audevi/apresentacao/searching_page.dart';
import 'package:audevi/apresentacao/bluetooth.dart';

import 'package:audevi/apagar/receitas_page.dart';
import 'package:audevi/apresentacao/splash_page.dart';
import 'package:audevi/features/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/homepage': (context) => const MainPage(),
        '/receitas': (context) => const ReceitasPage(),
        '/receita': (context) => const Receita(),
        '/bluetooth': (context) => const BluetoothConnectionPage(),
        '/about': (context) => const AboutPage(),
        '/how-to-use': (context) => const HowToUsePage(),
        '/searching': (context) => const SearchingPage(),
      },
      title: 'Audevi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
