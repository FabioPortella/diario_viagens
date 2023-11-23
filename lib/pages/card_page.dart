// ignore_for_file: constant_identifier_names

import 'package:diario_viagens/pages/diario_viagem_sqlite_page.dart';
import 'package:diario_viagens/shared/app_images.dart';
import 'package:flutter/material.dart';

double defaultRadius = 8.0;

class CardBasicRoute extends StatefulWidget {
  const CardBasicRoute({super.key});

  @override
  CardBasicRouteState createState() => CardBasicRouteState();
}

class CardBasicRouteState extends State<CardBasicRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Diário de Viagens")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(height: 10),

            // Card contendo os dados da viagem
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: MyColorsSample.primary,
                  width: 2,
                ),
              ),
              elevation: 0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Peru",
                      style: TextStyle(fontSize: 24, color: Colors.grey[800]),
                    ),
                    Container(height: 10),
                    Text("Início: 12/12/2023 \nFim: 26/12/2023",
                        style:
                            TextStyle(fontSize: 15, color: Colors.grey[700])),
                    Container(height: 10),
                  ],
                ),
              ),
            ),
            Container(height: 5),

            // Cards 01 contendo as fotos e descrições da viagem

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    AppImages.paisagem2,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("18/12/2023",
                            style: MyTextSample.button(context)!
                                .copyWith(color: MyColorsSample.grey_20)),
                        Container(height: 5),
                        Text("Conhecendo Machu Picchu",
                            style: MyTextSample.headline(context)!
                                .copyWith(color: MyColorsSample.grey_80)),
                        Container(height: 15),
                        Text(
                            "O Machu Picchu, também chamado de “Cidade Perdida dos Incas”, é um sítio arqueológico localizado no Peru. Esse imenso santuário é considerado um dos locais mais enigmáticos da América Latina. Em 1983, foi declarado pela Unesco como Patrimônio Cultural da Humanidade. Já em 2007, ele foi eleito uma das Sete Maravilhas do Mundo Moderno.",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[600])),
                        Container(height: 10),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Editar',
                                  style: MyTextSample.button(
                                      context)!), //.copyWith(color: Colors.white)
                            ),
                            Container(width: 10),
                            TextButton(
                              onPressed: () {},
                              child: Text('Excluir',
                                  style: MyTextSample.button(context)!
                                      .copyWith(color: MyColorsSample.primary)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 10),

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

/// returns Radius
BorderRadius radius([double? radius]) {
  return BorderRadius.all(radiusCircular(radius ?? defaultRadius));
}

/// returns Radius
Radius radiusCircular([double? radius]) {
  return Radius.circular(radius ?? defaultRadius);
}

/*Load image from folder assets/images/  */
class ImgSample {
  static String get(String name) {
    return 'assets/images/$name';
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

class MyTextSample {
  static TextStyle? display4(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge;
  }

  static TextStyle? display3(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium;
  }

  static TextStyle? display2(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall;
  }

  static TextStyle? display1(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium;
  }

  static TextStyle? headline(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall;
  }

  static TextStyle? title(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge;
  }

  static TextStyle medium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 18,
        );
  }

  static TextStyle? subhead(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }

  static TextStyle? body2(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  static TextStyle? body1(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium;
  }

  static TextStyle? caption(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }

  static TextStyle? button(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(letterSpacing: 1);
  }

  static TextStyle? subtitle(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall;
  }

  static TextStyle? overline(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall;
  }
}
