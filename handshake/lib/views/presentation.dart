import 'package:flutter/material.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/widgets/button.dart';
import 'package:handshake/widgets/logo.dart';

import '../widgets/background_decoration.dart';
import '../widgets/sizebox.dart';

class PresentationPage extends StatefulWidget {
  PresentationPage({Key? key}) : super(key: key);

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 30,
          title: const Text(
            "Accueil",
          ),
          centerTitle: true,
        ),
        body: Container(
          //padding: const EdgeInsets.only(top: 0),
          //width: size.width,
          //height: size.height,
          decoration: fondDecoration(),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 24, right: 24, bottom: 10),
                child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 0),
                  height: 80,
                  child: logo(size),
                ),
                columnSize(),
                Container(
                  child: Image.asset("images/icons8-charity-64.png"),
                    ),
                    Text('Accompagnement adapté au rythme des personnes atteintes de TSA.', textAlign: TextAlign.left, style: TextStyle (fontStyle: FontStyle.italic)),
                columnSize(),
                Container(
                  child: Image.asset("images/icons8-community-64.png"),
                    ),
                    Text('Restez en contact avec nos bénévoles dûement séléctionnés.', textAlign: TextAlign.right, style: TextStyle (fontStyle: FontStyle.italic)),
                columnSize(),
                Container(
                  child: Image.asset("images/icons8-no-money-64.png"),
                    ),
                    Text('Service gratuit et accessible en quelques clics.',textAlign: TextAlign.left ,style: TextStyle (fontStyle: FontStyle.italic)),
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
        ));
  }

  /* Widget _titleDecoration(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.blueGrey,
        fontStyle: FontStyle.italic,
      ),
    );
  } */

}
