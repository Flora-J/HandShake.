import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/widgets/button.dart';
import 'package:handshake/widgets/logo.dart';

import '../widgets/background_decoration.dart';

class PresentationPage extends StatefulWidget {
  PresentationPage({Key? key}) : super(key: key);

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  final List imageList = [
    {"title": "Accompagnement personnalisé selon le rythme de vie des personnes atteintent de TSA.", "url": "images/icons8-charity-64.png"},
    {"title": "Déveloopez votre réseau", "url": "images/icons8-community-64.png"},
    {"title": "Service gratuit et acccesible en quelques clics", "url": "images/icons8-no-money-64.png"}
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        title: const Text(
          "Bienvenue",
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: fondDecoration(),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 0),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 0, bottom: 0),
              height: 80,
              child: logo(size),
            ),
            SizedBox(height: 50),
            Container(
              child: Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      height: 300),
                  items: imageList.map((item) {
                    return GridTile(
                      child: Image.asset(
                        item["url"],
                        width: 500,
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                      footer: Container(
                        padding: EdgeInsets.all(15),
                        color: Colors.transparent,
                        child: Text(
                          item["title"],
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 130,
                      child: elevatedButton(
                          context, "Commencer", () => HomePage()),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
