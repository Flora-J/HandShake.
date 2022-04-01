class Users {
  String firstName;
  String lastName;
  String? imageUrl;
  String? address;
  int? postCode;
  String? city;
  String email;
  String? password;
  String? organization;
  String profilType;
  //Map<int, String> hobbies;

  Users(
      {required this.firstName,
      required this.lastName,
      required this.imageUrl,
      required this.organization,
      required this.address,
      required this.postCode,
      required this.city,
      required this.email,
      required this.password,
      this.profilType = 'Accompagné',
      //required this.hobbies});
      });
  factory Users.fromRTBD(data) {
    return Users(
        firstName: data['FirstName'],
        lastName: data['LastName'],
        imageUrl: data['Photo'],
        organization: data['Organization'],
        address: data['Address'],
        postCode: data['CP'],
        city: data['City'],
        email: data['Email'],
        password: data['Password'],
        profilType: data['Profil type']);
        //hobbies: data['Hobbies']);
  }
}
