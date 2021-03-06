import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget textFieldBasic (TextEditingController userInput, String hintTitle){
  return(Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: TextField(
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

Widget textFieldPassword (TextEditingController userInput, String hintTitle){
  return(Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: TextField(
        controller: userInput,
        obscureText: true,
        decoration: InputDecoration(
          //prefixIcon: icon,
          hintText: hintTitle,
          hintStyle: TextStyle( fontSize: 18, color: Colors.blueAccent, fontStyle: FontStyle.italic),
        ),
        //keyboardType: keyboardType,
      ),
    ),
  )
  );
}