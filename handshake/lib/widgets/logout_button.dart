import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Widget logoutButton (BuildContext context, String destPage, String text){
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 250, 250, 250),
  elevation: 10,
  shadowColor: Color.fromARGB(255, 14, 118, 223),
  ),
  onPressed: () async{
  await FirebaseAuth.instance.signOut();
  Navigator.pushNamedAndRemoveUntil(context, destPage, (route) => false);


  },
  child: Text(
  text,
  style: TextStyle(color: Colors.blue)),
  );



}
