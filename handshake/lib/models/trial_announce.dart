import 'package:flutter/material.dart';

import '../models/chat_users.dart';
import '../views/chat_room.dart';


class TrialAnnounce extends StatefulWidget{
  //String key;
  String title;
  String date;
  String hour;
  String activity;
  String description;

  TrialAnnounce({
    //required this.key,
    required this.title,
    required this.date,
    required this.hour,
    required this.activity,
    required this.description
  });

  @override
  _TrialAnnounceState createState() => _TrialAnnounceState ();
}

class _TrialAnnounceState extends State<TrialAnnounce>{



  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: GestureDetector(
      onTap: (){
        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>
          //  ChatRoom()));

      },

      child : Container(
        padding: const EdgeInsets.only(left : 16, right: 16, top: 10, bottom: 10),
                        child:
                          Card(
                            child: Padding(
                            padding: EdgeInsets.all(50),
                            child: Column(
                      children: [
                          Text(widget.title,
                              style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                          Text(widget.activity,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold
                            ),


                          ),
                          Text(widget.date,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold)),
                          Text (widget.hour,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold)),
                          Text (widget.description,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold)),

                        ],
                      ),
                    ),
                          )),


    ));
  }
}