import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:diario_viagens/pages/diario_viagem_sqlite_page.dart';
import 'package:diario_viagens/shared/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green, Colors.white],
                stops: [0.1, 0.7])),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(
                  16.0), // Defina as margens desejadas aqui
              child: Image.asset(
                AppImages.splash,
              ),
            ),
            Center(
                child: AnimatedTextKit(
              onFinished: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const ViagemPageSQLite()));
              },
              animatedTexts: [
                TypewriterAnimatedText(
                  '\n\nDiário de Viagens\nFábio Portella\nHenrique Portella\n\nMatéria: \nDispositivos Moveis II\nDesenvolvido em Flutter',
                  textStyle: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 50),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            )),
          ],
        ),
      ),
    ));
  }
}
