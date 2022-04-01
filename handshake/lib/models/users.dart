class Users {
  String firstName;
  String lastName;
  String? imageUrl;
  String? address;
  String? postCode;
  String? city;
  String email;
  String organization;
  String Id;
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
      required this.Id
      //required this.hobbies});
      });

  factory Users.fromRTBD(Map<String, dynamic> data) {
    return Users(
        firstName: data['FirstName'],
        lastName: data['LastName'],
        imageUrl: data['Photo'],
        organization: data['Organization'],
        address: data['Address'],
        postCode: data['CP'],
        city: data['City'],
        email: data['Email'],
        Id: data['Id']
        //hobbies: data['Hobbies']);
    );
  }
}
