import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget textFieldBasic (TextEditingController userInput, String hintTitle){

  bool _isEmpty=true;

  return(Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty){
              return 'Texte obligatoire';
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