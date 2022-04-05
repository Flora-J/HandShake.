import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handshake/models/trial_announce.dart';
import 'package:handshake/models/trial_users.dart';
import 'package:handshake/services/stream_utility.dart';
import 'package:handshake/widgets/background_decoration.dart';
import 'package:handshake/widgets/popup.dart';

import '../models/users.dart';
import '../widgets/bottomNavigationBar.dart';

class AnnoucementDisplay extends StatefulWidget {
  @override
  State<AnnoucementDisplay> createState() => _AnnoucementDisplayState();

}

class _AnnoucementDisplayState extends State<AnnoucementDisplay> {
  final _database = FirebaseDatabase.instance.ref();
  final authId = FirebaseAuth.instance.currentUser?.uid;


  List<TrialAnnounce> listAnnounces =[];


  void _activateListeners() {
    _database
        .child('/handShakeDb/announces')
        .onValue
        .listen((event) {


      final data = new Map<String, dynamic>.from(event.snapshot.value as dynamic);
      data.forEach((key, value) {
        //if (value['UserId'] == authId)
        listAnnounces.add(new TrialAnnounce(userId: value['UserId'], id: key, title: value['Titre'], date: value['Date'], hour: value['Horaire'], activity: value['activité'], description: value['descriptif']));

        setState(() {
          //TrialUsers.MyUser(event).forEach((element) {
           // print(element.userId);
         // });


        });

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
            "Annonces",
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
        bottomNavigationBar: generalBottomNavigationBar(context),
        body: Container(
          decoration: fondDecoration(),
     child: Column(
     children : [
       Expanded(
              child : ListView.builder(
                padding: EdgeInsets.all(10),
                  itemCount: listAnnounces.length,
                  shrinkWrap: true,
                  itemBuilder: (context, value){
                    return TrialAnnounce(title: listAnnounces[value].title, date: listAnnounces[value].date, hour: listAnnounces[value].hour, activity: listAnnounces[value].activity, description: listAnnounces[value].description, id: listAnnounces[value].id, userId: listAnnounces[value].userId,);

                      //Announces(key: listAnnounces[value].key, title: listAnnounces[value].title, hour: listAnnounces[value].hour, description: listAnnounces[value].description, activity: listAnnounces[value].activity, date: listAnnounces[value].date )
                        //.missionDescription(context);


              }),
        ),
        ])));
  }
}





