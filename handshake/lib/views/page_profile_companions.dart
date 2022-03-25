import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handshake/views/connections.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/widgets/button.dart';
import '../widgets/background_decoration.dart';
import '../widgets/logout_button.dart';


class ProfileCompanion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 30,
          title: const Text(
            "Profil Accompagnant",
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
          padding: EdgeInsets.only(top: 10, bottom: 50),
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
                Text("Followers",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),

                SizedBox(
                  height: 12,
                ),
                Container(
                    width: 160,
                    child: elevatedButton2(context, "Voir les offres",  ()=>HomePage()),
                  ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    child: elevatedButton2(context, "Modifier mon profil",  ()=>HomePage()),
                    ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    child: elevatedButton2(context, "Actions effectuées",  ()=>HomePage()),
                    ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: 160,
                    child: elevatedButton2(context, "Chat",  ()=>HomePage()),
                    ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: 160,
                    child: logoutButton(context, '/HomePage', 'Déconnection')
                    ),
              ],
            ),
          ),
        )
    );
  }
}


