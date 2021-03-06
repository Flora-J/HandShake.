class Users {
  String? firstName;
  String? lastName;
  //String? imageUrl;
  String? address;
  String? postCode;
  String? city;
  String? email;
  //String organization;
  String? id;
  String? profilType;
  //Map<int, String> hobbies;

  Users(
      {required this.firstName,
      required this.lastName,
      //required this.imageUrl,
      //required this.organization,
      required this.address,
      required this.postCode,
      required this.city,
      required this.email,
      required this.id,
      required this.profilType
      //required this.hobbies});
      });

  factory Users.fromRTBD(Map<String, dynamic> data) {
    return Users(
        firstName: data['FirstName'],
        lastName: data['LastName'],
        //imageUrl: data['Photo'],
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
  Map toMap() {
    return {
      "userId": id,
      "FirstName": firstName,
      "LastName": lastName,
      "Address": address,
      "CP": postCode,
      "City": city,
      "Email": email,
      "ProfilType": profilType
    };
  }

}
