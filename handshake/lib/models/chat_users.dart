import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Chat_users{

  DatabaseReference _Database = FirebaseDatabase.instance.ref();

  String key;
  String name;
  String lastName;
  String? photo;

  Chat_users({
    required this.key,
    required this.name,
    required this.lastName,
  required this.photo,
  });

  factory Chat_users.fromRTBD(Map<String, dynamic> data){
    return Chat_users(
        key : data['key'],
        lastName: data['LastName'],
        name: data['FirstName'],
        photo: data['Photo']);

  }

}