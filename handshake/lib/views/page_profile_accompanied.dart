import 'package:flutter/material.dart';
import 'package:handshake/views/announcement_form.dart';
import 'package:handshake/views/chat_select.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/widgets/bottomNavigationBar.dart';
import 'package:handshake/widgets/button.dart';

import '../widgets/background_decoration.dart';
import 'announcements.dart';


class ProfileAccompanied extends StatelessWidget {

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
        bottomNavigationBar: generalBottomNavigationBar(context),
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
                  height: 12,
                ),
                    //Expanded(//child:
                  Column(
                          children: [
                            Text("Followers",
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
                    child: elevatedButton2(context, "Chat",  ()=>Chat()),
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


