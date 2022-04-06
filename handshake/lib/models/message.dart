import 'package:firebase_database/firebase_database.dart';

class Message{
  String idReceiver;
  String idSender;
  String content;
  //int time;

  Message({required this.idReceiver, required this.idSender, required this.content}); //required this.time});

  factory Message.fromRTBD(Map<String, dynamic> data){
    return Message(
        idReceiver: data['id_Receiver'],
        idSender: data['id_Sender'],
        content: data['message'],
        //time: data['time'],
    );

  }


}