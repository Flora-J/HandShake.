import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget generalBottomNavigationBar(){
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