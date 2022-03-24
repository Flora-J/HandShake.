import 'package:flutter/material.dart';

class Users{
  String firstName;
  String lastName;
  String imageUrl;
  String address;
  int postCode;
  String city;
  String email;
  String password;
  String organization;

  Users ({required this.firstName, required this.lastName, required this.imageUrl, required this.organization, required this.address, required this.postCode, required this.city, required this.email, required this.password});

}