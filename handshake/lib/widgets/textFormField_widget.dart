import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget textFormdBasic (TextEditingController userInput, String hintTitle){

  return(Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: TextFormField(
        validator: (userInput) {
          if (userInput == null || userInput.isEmpty){
            return 'Champs obligatoire';
          }
          return null;
        },
        controller: userInput,
        decoration: InputDecoration(
          hintText: hintTitle,

          hintStyle: TextStyle(fontSize: 18, color: Colors.blueAccent, fontStyle: FontStyle.italic),
        ),
        //keyboardType: keyboardType,
      ),
    ),
  )
  );
}
Widget textFormPassword (TextEditingController userInput, String hintTitle){

  return(Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: TextFormField(
        obscureText: true,
        validator: (userInput) {
          if (userInput == null || userInput.isEmpty){
            return 'Champs obligatoire';
          }else if(userInput.length <= 5) {
            return 'Mot de passe trop court';
          }return null;
        },
        controller: userInput,
        decoration: InputDecoration(
          hintText: hintTitle,
          hintStyle: TextStyle(fontSize: 18, color: Colors.blueAccent, fontStyle: FontStyle.italic),
        ),
        //keyboardType: keyboardType,
      ),
    ),
  )
  );
}
