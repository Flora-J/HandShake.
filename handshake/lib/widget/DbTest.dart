import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DbTest extends StatefulWidget {

  @override
  _DbTeststate createState() => _DbTeststate();

}


class _DbTeststate extends State<DbTest>{
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  String _data = "C'est ici";

  @override
  Widget build(BuildContext context) {
    final handShakeRef = ref.child('/handShakeDb');


    return Scaffold(
        appBar: AppBar(
        leading: const Icon(Icons.handshake_outlined),
    centerTitle: true,
    title: const Text(
    "HandShake",
    style: TextStyle(
    fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
    ),
    backgroundColor: Colors.blue,
    ),
    body:Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //save information in the database with error return
          ElevatedButton(onPressed:() async{
            try {
              await handShakeRef.set({
                'Email': 'bbbb@bbbb.fr',
                'Password': '6789'
              });
              print("entry has been added");
            }catch(error){
              print('Entry has not been added : $error' );
            };
            },
          child: Text("enregistrer"
          ),

          ),
          SizedBox(
            height: 10,
          ),
          //Delete the database
          ElevatedButton(onPressed: ()async{
            await handShakeRef.remove();
            print("Deleted");
          }
              , child: Text(
                "Supprimer"
              ),
          ),
          //Read the database
          ElevatedButton(onPressed: ()async {
            await ref
                .child("handShakeDb/Email")
                .onValue
                .listen((event) {
              final String _email = event.snapshot.value.toString();
              setState(() {
                _data = _email;
              });
            });
          },
             child: Text(
                "afficher"
            ),
          ),
          Text(_data)
        ],
      ),

    )


    );

  }


}