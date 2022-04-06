import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:handshake/models/users.dart';

class FirebaseHelper {

  static final entryPoint = FirebaseDatabase.instance.ref();
  static final entryStorage = FirebaseStorage.instance.ref();

  final auth = FirebaseAuth.instance;
  final entryUser = entryPoint.child("/handShakeDb/user");
  final entryStock = entryStorage.child("/handShakeDb/user");
  final handShakeRef = entryPoint.child('/handShakeDb/announces');
  //final hobbies = entryUser.child('/key/hobbies');

  //FirebaseAuth auth = FirebaseAuth.instance;


  Future<User?> handleSignIn(String email, String mdp) async {
    final User? user = (await auth.signInWithEmailAndPassword(email: email, password: mdp)).user;
    return user;
  }

  Future<bool?> handleLogOut() async {
    await auth.signOut();
    return true;
  }


  Future<User?> create(String email, String mdp, String firstName, String lastName) async {
    final create = await auth.createUserWithEmailAndPassword(email: email, password: mdp);
    final User? user = create.user;
    String? id = user?.uid;
    Map<String, String> map = {
      "FirstName": firstName,
      "LastName": lastName,
      "Id": id!

    };
    addUser(id, map);
    return user;
  }

  void addUser(String id, Map map) {
    entryUser.child(id).set(map);
  }


  Future<String> savePic(File file, Reference reference) async {
    var task = reference.putFile(file);
    var snap = await task;
    return await snap.ref.getDownloadURL();

  Future<Users?> getUser(String id) async{

    DatabaseEvent event = await entryUser.child(id).once();
    Users user = Users(address: '', firstName: '', lastName: '': '', email: '', firstName: '', id: '', imageUrl: '', lastName: '', postCode: '', profilType: '');
    return user; //bug
  }
}
}