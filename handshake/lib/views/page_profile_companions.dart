import 'package:flutter/material.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/widgets/button.dart';
import '../widgets/background_decoration.dart';


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
                Container(
                      height: 40,
                      child: elevatedButton(context, "Voir les offres",  ()=>HomePage()),
                    ),
              ],
            ),
          ),
        )
    );
  }
}
