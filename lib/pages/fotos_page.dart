// ignore_for_file: constant_identifier_names

import 'package:diario_viagens/pages/diario_viagem_sqlite_page.dart';
import 'package:flutter/material.dart';
import 'package:diario_viagens/shared/app_images.dart';

class DiarioFotos extends StatefulWidget {
  const DiarioFotos({super.key});

  @override
  State<DiarioFotos> createState() => _DiarioFotosState();
}

class _DiarioFotosState extends State<DiarioFotos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(elevation: 8, child: Image.asset(AppImages.paisagem1)),
                  Card(elevation: 8, child: Image.asset(AppImages.paisagem2)),
                  Card(elevation: 8, child: Image.asset(AppImages.paisagem3)),
                ],
              ),
            ),
            Expanded(flex: 3, child: Container()),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ViagemPageSQLite()));
                },
                child: const Text("Voltar"))
          ],
        ),
      ),
    );
  }
}

class ImgSample {
  static String get(String name) {
    return AppImages.paisagem1;
    //return 'assets/images/$name';
  }
}

class MyColorsSample {
  static const Color primary = Color(0xFF12376F);
  static const Color primaryDark = Color(0xFF0C44A3);
  static const Color primaryLight = Color(0xFF43A3F3);
  static const Color green = Colors.green;
  static Color black = const Color(0xFF000000);
  static const Color accent = Color(0xFFFF4081);
  static const Color accentDark = Color(0xFFF50057);
  static const Color accentLight = Color(0xFFFF80AB);
  static const Color grey_3 = Color(0xFFf7f7f7);
  static const Color grey_5 = Color(0xFFf2f2f2);
  static const Color grey_10 = Color(0xFFe6e6e6);
  static const Color grey_20 = Color(0xFFcccccc);
  static const Color grey_40 = Color(0xFF999999);
  static const Color grey_60 = Color(0xFF666666);
  static const Color grey_80 = Color(0xFF37474F);
  static const Color grey_90 = Color(0xFF263238);
  static const Color grey_95 = Color(0xFF1a1a1a);
  static const Color grey_100_ = Color(0xFF0d0d0d);
  static const Color transparent = Color(0x00f7f7f7);
}

class MyStringsSample {
  static const String lorem_ipsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam efficitur ipsum in placerat molestie.  Fusce quis mauris a enim sollicitudin"
      "\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam efficitur ipsum in placerat molestie.  Fusce quis mauris a enim sollicitudin";
  static const String middle_lorem_ipsum =
      "Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase.";
  static const String card_text =
      "Cards are surfaces that display content and actions on a single topic.";
}
