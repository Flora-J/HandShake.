import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handshake/models/announces.dart';

class AnnoucementDisplay extends StatefulWidget {
  @override
  State<AnnoucementDisplay> createState() => _AnnoucementDisplayState();

}

class _AnnoucementDisplayState extends State<AnnoucementDisplay> {
  final _database = FirebaseDatabase.instance.ref();

  String titleMission = "titre de la mission";
  String dateMission = "date de la mission";
  String heureMission = "heure de la mission";
  String mission = "mission";
  String fetch="annonce";
  List<Announces> list =[];


  void _activateListeners() {

    _database
        .child('/handShakeDb/announces')
        .onValue
        .listen((event) {

      final data = new Map<String, dynamic>.from(event.snapshot.value as dynamic);
      data.forEach((key, value) {
        list.add(new Announces(title: value['Titre'], hour: value['Horaire'], descrition: value['descriptif'], activity: value['activité'], date: value['Date']));
        print(value);
        print(key);

      });
      setState(() {
        fetch= list.toString();


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
        body: ListView(
          shrinkWrap: true,
            children: [
              Text(list[2].descrition),
             SizedBox(
                 height: 20,),
        ]),
        );
  }
}



