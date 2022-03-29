import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnnoucementDisplay extends StatefulWidget {
  @override
  State<AnnoucementDisplay> createState() => _AnnoucementDisplayState();

/* @override
  _AnnoucementDisplayState createState() => _AnnoucementDisplayState();*/

}

class _AnnoucementDisplayState extends State<AnnoucementDisplay> {
  final _database = FirebaseDatabase.instance.ref();

  String titleMission = "titre de la mission";
  String dateMission = "date de la mission";
  String heureMission = "heure de la mission";
  String mission = "mission";

  void _activateListeners() {
    _database
        .child('/handShakeDb/announces')
        .onValue
        .listen((event) {
      final announce = new Map<String, dynamic>.from(event.snapshot.value as dynamic);
      final title = announce['Titre'] as String;
      final date = announce['Date'];
      final hour = announce['Horaire'];
      final activity = announce['activité'];
      setState(() {
        titleMission = 'titre de l\'annonce : $title';
        dateMission = 'Date : $date';
        mission = 'Activité : $activity';
        heureMission = "Heure: $hour";
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 30,
          title: const Text(
            "Formulaire Annonce",
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
            child: Column(children: [
          Text('$titleMission'),
          Text('$mission'),
          Text('$dateMission'),
          Text('$heureMission'),
              /*FutureBuilder(future: _database.child('/handShakeDb/announces').get(),
                  builder: (context, snapshot){
                if (snapshot.hasData){

                }

                  }*/

              //)
        ]),
        )
    );
  }
}
