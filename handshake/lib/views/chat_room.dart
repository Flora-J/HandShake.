
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handshake/models/chat_users.dart';

class ChatRoom extends StatefulWidget{

  DatabaseReference _database = FirebaseDatabase.instance.ref();
  List <Chat_users> chatUser = [];

  @override
  _ChatRoomState createState() => _ChatRoomState();

}

class _ChatRoomState extends State<ChatRoom>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarChat(),

    );


  }




}


AppBar appBarChat (){

  return AppBar(elevation: 30,
    title: Text('Chat'),
    centerTitle: true,

  );
}