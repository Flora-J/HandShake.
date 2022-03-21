import 'package:flutter/material.dart';
import 'package:handshake/views/connections.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        padding: const EdgeInsets.only(top: 0),
        width: size.width,
        height: size.height,
        decoration: fondDecoration(),
        child: Column(children: [
          Container(
            child: _logo(size),
          ),
          Container (
            child: _titleDecoration("La fleur bleue de l'épanouissement \n des autistes"),
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            key: const Key("selectionContainer"),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 130,
                    child: _elevatedButton("S'inscrire"),
                  ),
                  SizedBox(
                    width: 130,
                    child: _elevatedButton("Se connecter"),
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

  Widget _logo(Size size) {
    return Image.asset (
      "images/logo-handshake.png",
      fit: BoxFit.contain,
      height: size.shortestSide,
      width: size.shortestSide,
      alignment: Alignment.center,
    );
  }

  Widget _titleDecoration(String text) {
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

  Widget _elevatedButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 14, 118, 223), elevation: 10),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Connection()));
      },
      child: Text(
        text,
      ),
    );
  }
}
