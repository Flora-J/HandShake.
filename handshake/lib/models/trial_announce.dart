import 'package:flutter/material.dart';
import 'package:handshake/widgets/popup.dart';

import '../models/chat_users.dart';
import '../views/chat_room.dart';


class TrialAnnounce extends StatefulWidget{
  String? userId;
  String? id;
  String title;
  String date;
  String hour;
  String activity;
  String description;

  TrialAnnounce({
    required this.userId,
    required this.id,
    required this.title,
    required this.date,
    required this.hour,
    required this.activity,
    required this.description
  });
  factory TrialAnnounce.fromRTBD(Map<String, dynamic> data){
    return TrialAnnounce(
        userId: data['UserId'],
        id: data['key'],
        title: data['Titre'],
        activity: data['activité'],
        date: data['Date'],
        hour: data['Horaire'],
        description: data['descriptif']
    );
  }

  @override
  _TrialAnnounceState createState() => _TrialAnnounceState ();
}

class _TrialAnnounceState extends State<TrialAnnounce>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return  GestureDetector(
      onTap: (){

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
                              color: Colors.black,
                                  fontWeight: FontWeight.bold
                          ),
                          ),
                          Text(widget.activity,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,

                            ),


                          ),
                          Text(widget.date,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                            )),
                          Text (widget.hour,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  )),
                          Text (widget.description,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  )),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed:(){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => popupConfirmation(context, Text('Souhaitez-vous effectuer cette mission '+widget.activity+' le '+widget.date+' ?'),"Commencez par envoyer un message pour briser la glace"));
                            },
                            child: Text('Accepter'))

                        ],
                      ),
                    ),
                          )),


    );
  }
}