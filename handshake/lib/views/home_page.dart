import 'package:flutter/material.dart';
import 'package:handshake/widgets/logo.dart';
import '../widgets/background_decoration.dart';
import 'connections.dart';
import 'package:handshake/widgets/button.dart';

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
            child: logo(size),
          ),
          Container (
            child: _titleDecoration("La fleur bleue de l'épanouissement \n des autistes"),
          ),
          Container(
            margin: EdgeInsets.only(top: 120),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 130,
                    child: elevatedButton(context, "S'inscrire", ()=>Connection()),
                  ),
                  SizedBox(
                    width: 130,
                    child: elevatedButton(context, "Se connecter", ()=>Connection()),
                  ),
                ]),
          ),
        ]),
      ),
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

}
