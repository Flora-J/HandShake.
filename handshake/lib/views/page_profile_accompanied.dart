import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:handshake/models/Users.dart';
import 'package:handshake/views/announcement_form.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/widgets/button.dart';

import '../widgets/background_decoration.dart';


class ProfileAccompanied extends StatefulWidget {



  @override
  _ProfileAccompaniedState createState() => _ProfileAccompaniedState();
}
class _ProfileAccompaniedState extends State<ProfileAccompanied>{

  String _firstName="";
  FirebaseAuth auth = FirebaseAuth.instance;
  //DatabaseReference ref = FirebaseDatabase.instance.ref();
  final handShakeRef = FirebaseDatabase.instance.ref().child('/handShakeDb');
  late StreamSubscription _userInformationStream;

/*  @override
  void iniState(){
      super.initState();
      _activateListener();

  }

  void _activateListener() {
    _userInformationStream = handShakeRef.onValue.listen((event) {
          final data = new Map<String, dynamic>.from(event.snapshot.value);
          final firstName = Users.fromRTBD(data);
          //data['Firstname'] as String;

          setState(() {
            _firstName = '$firstName';
          });

        });
  }*/



  @override
  Widget build(BuildContext context) {





    return Scaffold(
        appBar: AppBar(
          elevation: 30,
          title: const Text(
            "Profil Accompagné(e)",
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
        body: Container(
        decoration: fondDecoration(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.teal,//backgroundImage: NetworkImage(),
                ),
                SizedBox(
                    height: 8,
                ),
                Text(
                    _firstName,
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            Text("Followers",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                            ),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: 180,
                    child: elevatedButton2(context, "Déposer une annonce",  ()=>FormAnnounce()),
                  ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: 180,
                    child: elevatedButton2(context, "Modifier mon profil",  ()=>HomePage()),
                    ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: 180,
                    child: elevatedButton2(context, "Annonces effectuées",  ()=>HomePage()),
                    ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: 180,
                    child: elevatedButton2(context, "Chat",  ()=>HomePage()),
                    ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: 180,
                    child: elevatedButton2(context, "Déconnexion",  ()=>HomePage()),
                    ),
              ],
            ),
          ),
        )
    );
  }


}


