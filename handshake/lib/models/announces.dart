import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Announces{
  String title;
  String date;
  String hour;
  String activity;
  String description;

  Announces({required this.title, required this.date, required this.hour, required this.activity, required this.description });



 factory Announces.fromRTBD(Map<String, dynamic> data){
    return Announces(
      title: data['Titre'],
      activity: data['activité'],
      date: data['Date'],
      hour: data['Horaire'],
      description: data['descriptif']
    );
  }

/*   String missionDescription(){
    return '''
    $title \n
    $activity \n
    $date \n
    $hour \n
    $description
    ''';
  }*/
  Widget missionDescription(){
    return Text('''
    $title \n
    $activity \n
    $date \n
    $hour \n
    $description
    ''');
  }



}
