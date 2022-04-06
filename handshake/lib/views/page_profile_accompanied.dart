import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:handshake/models/firebase_helper.dart';
import 'package:handshake/models/users.dart';
import 'package:handshake/views/announcement_form.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/widgets/bottomNavigationBar.dart';
import 'package:handshake/widgets/button.dart';
import 'package:handshake/widgets/custom_image.dart';

import '../widgets/background_decoration.dart';
import 'announcements.dart';

class ProfileAccompanied extends StatefulWidget {

  @override
  State<ProfileAccompanied> createState() => _ProfileAccompniedState();

}

class _ProfileAccompniedState extends State<ProfileAccompanied> {

  Users? me;
  String? firstName;
  String? lastName;

  User? user = FirebaseHelper().auth.currentUser;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return (me == null)
    ? const Center(child: Text("Non identifié"))
    : Scaffold(
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
        bottomNavigationBar: generalBottomNavigationBar(context),
        body: Container(
        decoration: fondDecoration(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(me?.imageUrl, me?.initiales, MediaQuery.of(context).size.width / 5),
                /* CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.teal,//backgroundImage: NetworkImage(),
                ), */
                SizedBox(
                    height: 8,
                ),
                Text(
                    "Vert",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                    //Expanded(//child:
                  Column(
                          children: [
                            Text(me!.fullName(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                            ),
                            ),
                          ],
                        ),
                    //),

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
                    child: elevatedButton2(context, "Annonces effectuées",  ()=>AnnoucementDisplay()),
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

  Future<void> _getUser() async{
    final firebaseUser = await FirebaseHelper().getUser(user!.uid);
    setState(() {
      me = firebaseUser;
    });
  }

}


