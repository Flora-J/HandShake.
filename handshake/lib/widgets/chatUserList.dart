import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/chat_users.dart';
import '../views/chat_room.dart';


class ChatUserList extends StatefulWidget{
  String id;
  String name;
  String lastName;
  String? photo;

  ChatUserList({
    required this.id,
    required this.name,
    required this.lastName,
    required this.photo,
  });

  @override
  _ChatUserListState createState() => _ChatUserListState();
}

class _ChatUserListState extends State<ChatUserList>{
  final authId = FirebaseAuth.instance.currentUser?.uid;




  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>
          ChatRoom(idCompanion: widget.id,idAccompanied: authId.toString(), nameCompanion: widget.name, lastNameCompanion: widget.lastName ,)));

      },
      child: Container(
        padding: const EdgeInsets.only(left : 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                      //backgroundImage: ,
                      maxRadius: 30
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name, style: const TextStyle(
                              fontSize: 16
                          ),
                          ),
                          SizedBox(height: 6,),
                          Text(widget.lastName,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold
                            ),

                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),


            ),

          ],
        ),

      ),

    );

  }


}