import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:handshake/models/users.dart';

import '../models/chat_users.dart';

class StreamUtility{

  DatabaseReference _database = FirebaseDatabase.instance.ref();


  Stream<List<Chat_users>> getUsersStream(){
    final chatUserStream = _database.child('/handShakeDb/user').onValue;
    final results = chatUserStream.map((event) {
      final userMap = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      final userList = userMap.entries.map((element) {
        return Chat_users.fromRTBD(Map<String, dynamic>.from(element.value));
      }).toList();
      return userList;
    });
    return results;

  }

List<Users> GetUser(){
    List<Users> userList = [];
  _database.child('/handShakeDb/user').onValue
      .listen((event) {
    final data = new Map<String, dynamic>.from(event.snapshot.value as dynamic);
    data.forEach((key, value) {
        userList.add(new Users(firstName: value['FirstName'], lastName: value['LastName'], address: value['Address'], postCode: value['CP'], city: value['City'], email: value['Email'], id: key, profilType: value['Profil type']));
           //userList.add (Users.fromRTBD(data));
        if (userList.isEmpty) {
          print('c\'est vide');
        }else
          userList.forEach((element) {
            print(element.profilType);

          });
    });

  });

    return userList;
  }


}

/*
  Future<Users> getUser(String uid) async{

    DatabaseEvent event = await _database.child('/handShakeDb/user').once();
    //DataSnapshot snap = snapshot.snapshot;
    Users user = Users.fromRTBD(event);

    return user; //bug
  }

}*/
