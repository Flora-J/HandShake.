import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Announces{
  String title;
  String date;
  String hour;
  String activity;
  String descrition;

  Announces({required this.title, required this.date, required this.hour, required this.activity, required this.descrition });



 factory Announces.fromRTBD(Map<String, dynamic> data){
    return Announces(
      title: data['Titre'],
      activity: data['activité'],
      date: data['Date'],
      hour: data['Horaire'],
      descrition: data['descriptif']
    );
  }

   String missionDescription(){
    return '''
    $title \n
    $activity \n
    $date \n
    $hour \n
    $descrition
    ''';
  }



}
