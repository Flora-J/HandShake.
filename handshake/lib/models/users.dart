import 'package:firebase_database/firebase_database.dart';

class Users {
  late String firstName;
  late String lastName;
  late String? imageUrl;
  late String? address;
  late String? postCode;
  late String? city;
  late String email;
  //String organization;
  late String id;
  late String profilType;
  late String initiales;
  //Map<int, String> hobbies;

  Users(
      {required this.firstName,
      required this.lastName,
      this.imageUrl,
      required this.initiales,
      //required this.organization,
      this.address,
      this.postCode,
      this.city,
      required this.email,
      required this.id,
      required this.profilType
      //required this.hobbies});
      });

  factory Users.fromRTBD(Map<String, dynamic> data) {
    return Users(
        firstName: data['FirstName'],
        lastName: data['LastName'],
        imageUrl: data['Photo'],
        initiales: data['Init'],
        //organization: data['Organization'],
        address: data['Address'],
        postCode: data['CP'],
        city: data['City'],
        email: data['Email'],
        id: data['Id'],
        profilType: data ['Profil type']
        //hobbies: data['Hobbies']);
    );
  }

  MyUser(DataSnapshot snap) {
    id = snap.key!;
    Map? map = snap.value as Map?;
    firstName = map?["FirstName"];
    lastName = map?["LastName"];
    imageUrl = map?["Photo"];
    if (firstName != null && firstName.length > 0) {
      initiales = firstName[0];
    }
    if (lastName != null && lastName.length > 0) {
      if (initiales != null) {
        initiales += lastName[0] ;
      } else {
        initiales = lastName[0];
      }
    }
    //return initiales! ;
  }

  /* Map toMap() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Photo": imageUrl,
      "Id": id
    };
  } */

  String fullName() {
    return "$firstName $lastName";
  }
}
