import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/views/page_profile_accompanied.dart';

Widget generalBottomNavigationBar(){
  int index=0;
  List<Widget> pages = [
    HomePage(),
    ProfileAccompanied()
  ];

  return BottomNavigationBar(
    unselectedItemColor: Colors.blueAccent,
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil'),

      BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'chat'),
      BottomNavigationBarItem(
          icon: Icon(Icons.monitor),
          label: 'profil')
    ],


  );

}
