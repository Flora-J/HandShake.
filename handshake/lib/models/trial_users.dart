import 'package:firebase_database/firebase_database.dart';

class TrialUsers {
  String? firstName;
  String? lastName;
  String? address;
  String? postCode;
  String? city;
  String? email;
  String? userId;
  String? profilType;

  static List<TrialUsers> MyUser(DatabaseEvent event) {
    List<TrialUsers> list = [];
    Map? map = event.snapshot.value as Map?;

    map?.forEach((key, value) {
      TrialUsers user = new TrialUsers();
      user.userId = key;
      user.firstName = value!["FirstName"];
      user.lastName = value["LastName"];
      user.address = value["Address"];
      user.postCode = value["CP"];
      user.city = value["City"];
      user.email = value["Email"];
      //userId = map!["UserId"];
      user.profilType = value["ProfilType"];
      list.add( user);
    });

  return list;

  }

  Map toMap() {
    return {
      "userId": userId,
      "FirstName": firstName,
      "LastName": lastName,
      "Address": address,
      "CP": postCode,
      "City": city,
      "Email": email,
      "ProfilType": profilType
    };
  }

  static Future<List<TrialUsers>> getUsers() async{
    final _database = FirebaseDatabase.instance.ref();

    DatabaseEvent event = await _database.child('/handShakeDb/user').once();
    //DataSnapshot snap = snapshot.snapshot;
    return MyUser(event);

  }


}