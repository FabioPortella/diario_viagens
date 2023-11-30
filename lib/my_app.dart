//import 'package:diario_viagens/pages/diario_viagem_sqlite_page.dart';
import 'package:diario_viagens/pages/splash_screen_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // stl - atalho
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // retira a faixa DEBUG do app
      home: SplashScreenPage(),
    );
  }
}
