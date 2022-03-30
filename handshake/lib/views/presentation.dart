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

  var ImageList = [
    "Accompagnement personnalisé selon le rythme de vie des personnes atteintent de TSA.",
    "Développez votre réseau",
    "Service gratuit et acccesible en quelques clics"
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
                  items: ['images/icons8-charity-64.png', 'images/icons8-community-64.png', 'images/icons8-no-money-64.png'].map((i) {
                    return Builder(
                      builder : (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Image.asset(i),
                              SizedBox(height: 10),
                              if(i == 'images/icons8-charity-64.png')
                                Text("${ImageList[0]}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal,), textAlign: TextAlign.center),
                              if(i == 'images/icons8-community-64.png')
                                Text("${ImageList[1]}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                              if(i == 'images/icons8-no-money-64.png')
                                Text("${ImageList[2]}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal), textAlign: TextAlign.center),
                            ],
                            ),
                        );
                      }
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
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
