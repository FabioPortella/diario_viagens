// ignore_for_file: constant_identifier_names

import 'package:diario_viagens/shared/app_images.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

double defaultRadius = 8.0;
const double _cardWidth = 115;

class CardBasicRoute extends StatefulWidget {
  const CardBasicRoute({super.key});

  @override
  CardBasicRouteState createState() => CardBasicRouteState();
}

class CardBasicRouteState extends State<CardBasicRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(height: 25),
            //..................................................................card view 1
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          //ImgSample.get('relaxing-man.png'),
                          AppImages.paisagem1,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        Container(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(height: 5),
                              Text("Cards Title 1",
                                  style: MyTextSample.title(context)!
                                      .copyWith(color: MyColorsSample.grey_80)),
                              Container(height: 5),
                              Text("Sub title",
                                  style: MyTextSample.body1(context)!
                                      .copyWith(color: Colors.grey[500])),
                              Container(height: 10),
                              Text(MyStringsSample.card_text,
                                  maxLines: 2,
                                  style: MyTextSample.subhead(context)!
                                      .copyWith(color: Colors.grey[700])),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 5),

            //..................................................................card view 2
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    AppImages.paisagem2,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Cards Title 2",
                          style:
                              TextStyle(fontSize: 24, color: Colors.grey[800]),
                        ),
                        Container(height: 10),
                        Text(MyStringsSample.card_text,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700])),
                        Row(
                          children: <Widget>[
                            const Spacer(),
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.transparent),
                              child: const Text(
                                "SHARE",
                                style: TextStyle(color: MyColorsSample.accent),
                              ),
                              onPressed: () {},
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.transparent),
                              child: const Text(
                                "EXPLORE",
                                style: TextStyle(color: MyColorsSample.accent),
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(height: 5)
                ],
              ),
            ),
            Container(height: 5),

            //..................................................................card view row
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      onTap: () {},
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(left: 16, right: 16, top: 8),
                            child: Text(
                              "Today Sales report",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              /*style: primaryTextStyle(
                        color: appStore.textPrimaryColor,
                      )*/
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Feb 27, 2020', //style: secondaryTextStyle(color: appStore.textSecondaryColor),
                                ),
                                Icon(Icons
                                    .date_range), //, color: appStore.iconColor
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(width: 2),
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      onTap: () {},
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(left: 16, right: 16, top: 8),
                            child: Text(
                              "Today Sales report",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              /*style: primaryTextStyle(
                        color: appStore.textPrimaryColor,
                      )*/
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Feb 27, 2020', //style: secondaryTextStyle(color: appStore.textSecondaryColor),
                                ),
                                Icon(Icons
                                    .date_range), //, color: appStore.iconColor
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 5),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              color: MyColorsSample.primaryDark,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Card Background",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Container(height: 10),
                        Text(MyStringsSample.card_text,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[200])),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent),
                    child: const Text(
                      "LISTEN NOW",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(height: 5),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    //color: Colors.teal[800],
                    color: MyColorsSample.primary,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: const Text(
                            "Today Event \nLive",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 0.5,
                          height: 0,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 15,
                            ),
                            const Text(
                              "March 19, 2023",
                              style: TextStyle(color: Colors.white),
                            ),
                            const Spacer(),
                            IconButton(
                              icon:
                                  const Icon(Icons.event, color: Colors.white),
                              onPressed: () {},
                            ),
                            Container(
                              width: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(width: 2),
                Expanded(
                  flex: 1,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    color: MyColorsSample.primary,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 15,
                            ),
                            const Text(
                              "Call",
                              style: TextStyle(color: Colors.white),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.call, color: Colors.white),
                              onPressed: () {},
                            ),
                            Container(
                              width: 4,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: const Text(
                            "John Smith \nTek",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 10),

            //..................................................................outline card view
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: MyColorsSample.accent,
                  width: 1,
                ),
              ),
              elevation: 0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    AppImages.paisagem3,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Card Outlined",
                          style:
                              TextStyle(fontSize: 24, color: Colors.grey[800]),
                        ),
                        Container(height: 10),
                        Text(MyStringsSample.card_text,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]))
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.transparent),
                        child: const Text(
                          "SHARE",
                          style: TextStyle(color: MyColorsSample.accent),
                        ),
                        onPressed: () {},
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.transparent),
                        child: const Text(
                          "EXPLORE",
                          style: TextStyle(color: MyColorsSample.accent),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(height: 5)
                ],
              ),
            ),
            Container(height: 5),
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
                      "Card Outlined",
                      style: TextStyle(fontSize: 24, color: Colors.grey[800]),
                    ),
                    Container(height: 10),
                    Text(MyStringsSample.card_text,
                        style:
                            TextStyle(fontSize: 15, color: Colors.grey[700])),
                    Container(height: 10),
                  ],
                ),
              ),
            ),
            Container(height: 5),

            //..................................................................divider card view
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    AppImages.paisagem1,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Card Title",
                            style: MyTextSample.headline(context)!
                                .copyWith(color: MyColorsSample.grey_80)),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Text("Sub title",
                              style: MyTextSample.medium(context)
                                  .copyWith(color: MyColorsSample.grey_80)),
                        ),
                        Text(MyStringsSample.card_text,
                            style: MyTextSample.subhead(context)!
                                .copyWith(color: MyColorsSample.grey_40)),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Divider(height: 1),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Tonight's availability",
                            style: MyTextSample.medium(context)
                                .copyWith(color: MyColorsSample.grey_80)),
                        Container(height: 5),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300],
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                              ),
                              child: const Text("5:30PM",
                                  style:
                                      TextStyle(color: MyColorsSample.grey_60)),
                              onPressed: () {},
                            ),
                            Container(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300],
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                              ),
                              child: const Text("7:30PM",
                                  style:
                                      TextStyle(color: MyColorsSample.grey_60)),
                              onPressed: () {},
                            ),
                            Container(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300],
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                              ),
                              child: const Text("8:00PM",
                                  style:
                                      TextStyle(color: MyColorsSample.grey_60)),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  /* Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.transparent),
                      child: Text("RESERVE", style: TextStyle(color: MyColorsSample.primary),),
                      onPressed: (){},
                    ),
                  ),
                  Container(height: 5)*/
                ],
              ),
            ),
            Container(height: 10),
            //.................................................................

            //..................................................................gradient card view
            gradientCardSample(),

            Container(height: 10),
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
                        Text("TRAVEL",
                            style: MyTextSample.button(context)!
                                .copyWith(color: MyColorsSample.grey_20)),
                        Container(height: 5),
                        Text("5 eats cheap",
                            style: MyTextSample.headline(context)!
                                .copyWith(color: MyColorsSample.grey_80)),
                        Container(height: 15),
                        Text(MyStringsSample.middle_lorem_ipsum,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[600])),
                        Container(height: 10),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('VIEW ENTRY',
                                  style: MyTextSample.button(
                                      context)!), //.copyWith(color: Colors.white)
                            ),
                            Container(width: 10),
                            TextButton(
                              onPressed: () {},
                              child: Text('LEARN MORE',
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
            Container(height: 5),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppImages.paisagem3,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      FloatingActionButton.extended(
                        heroTag: "fab1",
                        backgroundColor: MyColorsSample.primary,
                        label: const Text('ADD ENTRY',
                            style: TextStyle(color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          if (kDebugMode) {
                            print('Clicked');
                          }
                        },
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("TRAVEL",
                            style: MyTextSample.button(context)!
                                .copyWith(color: MyColorsSample.grey_20)),
                        Container(height: 5),
                        Text("Special Menu",
                            style: MyTextSample.headline(context)!
                                .copyWith(color: MyColorsSample.grey_80)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(height: 10),
            SizedBox(
              height: 240,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  elevation: 2,
                  margin: const EdgeInsets.all(0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(AppImages.paisagem1, fit: BoxFit.cover),
                      Container(
                        margin: const EdgeInsets.all(20),
                        alignment: Alignment.bottomRight,
                        child: Image.asset(AppImages.paisagem3,
                            width: 60, height: 60),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Spacer(),
                                Image.asset(AppImages.paisagem3,
                                    color: Colors.white,
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 30),
                              ],
                            ),
                            Container(height: 10),
                            Text("4111111111111111",
                                style: MyTextSample.headline(context)!.copyWith(
                                    color: Colors.white,
                                    fontFamily: "monospace")),
                            Container(height: 10),
                            Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("EXPIRE",
                                        style: MyTextSample.body1(context)!
                                            .copyWith(
                                                color: MyColorsSample.grey_10)),
                                    Container(height: 5),
                                    Text("11/22",
                                        style: MyTextSample.subhead(context)!
                                            .copyWith(
                                                color: Colors.white,
                                                fontFamily: "monospace")),
                                  ],
                                ),
                                Container(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("CVV",
                                        style: MyTextSample.body1(context)!
                                            .copyWith(
                                                color: MyColorsSample.grey_10)),
                                    Container(height: 5),
                                    Text("568",
                                        style: MyTextSample.subhead(context)!
                                            .copyWith(
                                                color: Colors.white,
                                                fontFamily: "monospace")),
                                  ],
                                ),
                                Container(width: 40)
                              ],
                            ),
                            Container(height: 25),
                            Text("John Smith",
                                style: MyTextSample.subhead(context)!.copyWith(
                                    color: Colors.white,
                                    fontFamily: "monospace")),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            const Cards(),
            const CardStatelessWidget(),
            const CardInkWellWidget(),
          ],
        ),
      ),
    );
  }

  Widget gradientCardSample() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF846AFF),
              Color(0xFF755EE8),
              Colors.purpleAccent,
              Colors.amber,
            ],
          ),
          borderRadius: radius(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Family Card',
                      style: MyTextSample.headline(context)!.copyWith(
                          color: Colors.white,
                          fontFamily:
                              "monospace")), //, style: boldTextStyle(color: Colors.white, size: 20)
                  const Spacer(),
                  Stack(
                    children: List.generate(
                      2,
                      (index) => Container(
                        margin: EdgeInsets.only(left: (15 * index).toDouble()),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: radius(100), color: Colors.white54),
                      ),
                    ),
                  )
                ],
              ),
              Text('4111 7679 8689 9700',
                  style: MyTextSample.subhead(context)!
                      .copyWith(color: Colors.white, fontFamily: "monospace"))
            ],
          ),
          const Text('\$3,000',
              style: TextStyle(fontSize: 24, color: Colors.white))
        ],
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

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: _cardWidth,
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.more_vert),
                    ),
                    SizedBox(height: 35),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Elevated"),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: _cardWidth,
            child: Card(
              color: Theme.of(context).colorScheme.surfaceVariant,
              elevation: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.more_vert),
                    ),
                    SizedBox(height: 35),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Filled"),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: _cardWidth,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.more_vert),
                    ),
                    SizedBox(height: 35),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Outlined"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardStatelessWidget extends StatelessWidget {
  const CardStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class CardInkWellWidget extends StatelessWidget {
  const CardInkWellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: double.infinity,
            height: 100,
            child: Center(child: Text('A card that can be tapped')),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
/*Load image from folder assets/images/
 */
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

class MyStringsSample {
  static const String lorem_ipsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam efficitur ipsum in placerat molestie.  Fusce quis mauris a enim sollicitudin"
      "\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam efficitur ipsum in placerat molestie.  Fusce quis mauris a enim sollicitudin";
  static const String middle_lorem_ipsum =
      "Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase.";
  static const String card_text =
      "Cards are surfaces that display content and actions on a single topic.";
}
