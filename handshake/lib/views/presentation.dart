import 'dart:core';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:handshake/extensions.dart';
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
  final ImageList = [
    "Accompagnement personnalisé selon le rythme de vie des personnes atteintent de TSA.",
    "Développez votre réseau",
    "Service gratuit et acccesible en quelques clics"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          padding: 30.0.top + 30.0.bottom,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                //padding: EdgeInsets.only(top: 0, bottom: 0),
                height: 100,
                child: logo(size),
              ),
              SizedBox(height: 20),
              Container(
                child: Center(
                  child: CarouselSlider(
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        height: 400),
                    items: [
                      'images/solidarite.png',
                      'images/community.png',
                      'images/no-money.png'
                    ].map((i) {
                      BoxFit.fitHeight;

                      var text = "";
                      if (i == 'images/solidarite.png') {
                        text = ImageList[0];
                      } else if (i == 'images/community.png') {
                        text = ImageList[1];
                      } else if (i == 'images/no-money.png') {
                        text = ImageList[2];
                      }

                      return Builder(builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.transparent
                          ),
                          child: Column(
                            children: [
                              Image.asset(i),
                              SizedBox(height: 10),
                              Text(text,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        );
                      });
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
      ),
    );
  }
}
