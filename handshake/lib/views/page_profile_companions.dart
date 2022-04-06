import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/widgets/button.dart';
import '../models/users.dart';
import '../widgets/background_decoration.dart';
import '../widgets/bottomNavigationBar.dart';
import '../widgets/logout_button.dart';
import 'announcements.dart';
import 'chat_select.dart';


class ProfileCompanion extends StatefulWidget {
  @override
  State<ProfileCompanion> createState() => _ProfileCompanionState();


}

class _ProfileCompanionState extends State<ProfileCompanion>{

  final _database = FirebaseDatabase.instance.ref();
  final authId = FirebaseAuth.instance.currentUser?.uid;


  List<Users> listUsers =[];
  late String name = "";

  void _activateListeners() {
    _database
        .child('/handShakeDb/user')
        .onValue
        .listen((event) {


      final data = new Map<String, dynamic>.from(event.snapshot.value as dynamic);
      data.forEach((key, value) {
        listUsers.add(Users(firstName: value['FirstName'], lastName:  value['LastName'], address:  value['Address'], postCode:  value['CP'], city:  value['City'], email:  value['Email'], id: key, profilType:  value['Profil type']));
        print(value);

        for (int i=0; i<listUsers.length; i++){
          if (listUsers[i].id == authId){
            name = listUsers[i].firstName.toString();
          }}


        setState(() {


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
        bottomNavigationBar: generalBottomNavigationBar(context),
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
                  height: 12,
                ),
                Text(name,
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
                    child: elevatedButton2(context, "Voir les offres",  ()=>AnnoucementDisplay()),
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
                    child: elevatedButton2(context, "Chat",  ()=>Chat()),
                    ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: 160,
                    child: logoutButton(context, '/', 'Déconnection')
                    ),
              ],
            ),
          ),
        )
    );
  }
}


