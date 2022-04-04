import 'package:firebase_database/firebase_database.dart';

import '../models/chat_users.dart';

class StreamUtility{

  DatabaseReference _Database = FirebaseDatabase.instance.ref();


  Stream<List<Chat_users>> getUsersStream(){
    final chatUserStream = _Database.child('/handShakeDb/user').onValue;
    final results = chatUserStream.map((event) {
      final userMap = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      final userList = userMap.entries.map((element) {
        return Chat_users.fromRTBD(Map<String, dynamic>.from(element.value));
      }).toList();
      return userList;
    });
    return results;
  }




}