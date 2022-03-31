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
  List<Announces> listAnnounces =[];

  void _activateListeners() {
    _database
        .child('/handShakeDb/announces')
        .onValue
        .listen((event) {

      final data = new Map<String, dynamic>.from(event.snapshot.value as dynamic);
      data.forEach((key, value) {
        listAnnounces.add(new Announces(title: value['Titre'], hour: value['Horaire'], description: value['descriptif'], activity: value['activité'], date: value['Date']));
        print(value);
        print(key);
      });
      setState(() {
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
              ListView.builder(
                  itemCount: listAnnounces.length,
                  shrinkWrap: true,
                  itemBuilder: (context, value){
                    return Announces(title: listAnnounces[value].title, hour: listAnnounces[value].hour, description: listAnnounces[value].description, activity: listAnnounces[value].activity, date: listAnnounces[value].date )
                        .missionDescription(context);
              }),
        ]),
        );
  }
}

/*Widget _announceList(List list){
  return ListView.builder(
    itemCount: list.length,
    shrinkWrap: true,
    padding: const EdgeInsets.only(top: 16, bottom: 350),
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return list(
          : chatUsers[index].name,
          messageText: chatUsers[index].messagetext,
          imageUrl: chatUsers[index].imageUrl,
          time: chatUsers[index].time,
          isMessageRead: (index == 0 || index == 10) ? true : false);
    },
  )


  }*/




