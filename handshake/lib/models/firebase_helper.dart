import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:handshake/models/users.dart';

class FirebaseHelper {

  //Authentification

  final auth = FirebaseAuth.instance;

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

  //Database

  static final entryPoint = FirebaseDatabase.instance.ref();
  final entry_user = entryPoint.child("/handShakeDb/users");

  addUser(String id, Map map) {
    entry_user.child(id).set(map);
  }

  Future<Users?> getUser(String id) async{

    DatabaseEvent event = await entry_user.child(id).once();
    Users user = Users(address: '', city: '', email: '', firstName: '', id: '', imageUrl: '', lastName: '', postCode: '', profilType: '');
    return user; //bug
  }
}