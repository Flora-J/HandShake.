import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:flutter_application_1/Page2Interactive.dart';

class Page1Interactive extends StatefulWidget {
  @override
  //State<StatefulWidget> createState() {
  //return Page1InteractionState();
  //}
  Page1InteractionState createState() => Page1InteractionState();
}

class Page1InteractionState extends State<Page1Interactive> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //Page2Interactive page2 = Page2Interactive();


    return Scaffold(
      key: const Key("Scaffoll"),
      appBar: AppBar(
        elevation: 30,
        title: const Text(
          "Accueil",
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 80),
        width: size.width,
        height: size.height,
        decoration: fondDecoration(),
        child: Column(children: [
          Container(
            key: const Key("iconContainer"),
            margin: const EdgeInsets.only(top:0),
            child: logo(size),
          ),
          Container (
            key: const Key("TextContainer"),
            child: TitleDecoration("La fleur bleue de l'épanouissement \n des autistes"),
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            key: const Key("selectionContainer"),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: elevatedButton("S'inscrire", size),
                  ),
                  Container(
                    child: elevatedButton("Se connecter", size),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }

  BoxDecoration fondDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.blueAccent,
        Colors.white,
      ],
    ));
  }

  Image logo(Size size) {
    return Image.asset (
      "images/logo-handshake.png",
      fit: BoxFit.contain,
      height: size.shortestSide,
      width: size.shortestSide,
      alignment: Alignment.center,
    );
  }

  Text TitleDecoration(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.blueGrey,
        fontStyle: FontStyle.italic,

      ),
    );
  }

  ElevatedButton elevatedButton(String text, var size) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 14, 118, 223), elevation: 10),
      onPressed: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => page2));
      },
      child: Text(
        text,
      ),
    );
  }
}
