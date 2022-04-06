import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handshake/views/chat_select.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/views/page_profile_accompanied.dart';

Widget generalBottomNavigationBar(BuildContext context){
  int index=0;
  List<dynamic> pages = [
    HomePage(),

  ];

  return BottomNavigationBar(
    unselectedItemColor: Colors.blueAccent,
    currentIndex: index,
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil'),

      BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat'),
      BottomNavigationBarItem(
          icon: Icon(Icons.monitor),
          label: 'Profil')
    ],onTap: (value){
      switch(value){
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => HomePage()));
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => Chat()));
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => ProfileAccompanied()));
          break;
      }

  },


  );

}
