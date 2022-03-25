import 'package:flutter/material.dart';
import 'package:handshake/views/page_profile_accompanied.dart';
import 'package:handshake/widgets/background_decoration.dart';
import 'package:handshake/widgets/button.dart';
import 'package:intl/intl.dart';

enum SingingCharacter {
  courses,
  aidesMenageres,
  accompagnementMedical,
  apprentissage,
  activitees
}

class FormAnnounce extends StatefulWidget {

  @override
  State<FormAnnounce> createState() => _FormAnnounce();
}

class _FormAnnounce extends State<FormAnnounce> {
  SingingCharacter? _character = SingingCharacter.courses;

  //String _var = '';

  TextEditingController timeinput = TextEditingController();

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        title: const Text(
          "Formulaire Annonce",
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: fondDecoration(),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    labelText: 'Titre',
                  ),
                ),
                Column(
                    children: [
                        TextField(
                          controller: timeinput, //editing controller of this TextField
                          decoration: InputDecoration(
                            icon: Icon(Icons.timelapse_rounded), //icon of text field
                                  labelText: "Mettez l'heure", //label text of field
                                  labelStyle: TextStyle(color: Colors.blueGrey)
                          ),
                          readOnly: true,  //set it true, so that user will not able to edit text
                          //Text( child: ElevatedButton()),
                          onTap: () async {
                            TimeOfDay? pickedTime =  await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                              builder: (BuildContext context, Widget? child) {
                                return MediaQuery(
                                    data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                    child: child!)
                              },
                              );

                              if(pickedTime != null ){
                                //print(pickedTime.format(context));   //output 10:51 PM
                                DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                //converting to DateTime so that we can further format on different pattern.
                                //print(parsedTime); //output 1970-01-01 22:53:00.000
                                String formattedTime = DateFormat('HH:mm').format(parsedTime);
                                //print(formattedTime); //output 14:59:00
                                //DateFormat() is from intl package, you can format the time on any pattern you need.
                                setState(() {
                                  timeinput.text = formattedTime; //set the value of text field.
                                  });
                                /*}else{
                                print("Time is not selected");*/
                                }
                              },
                        ),
                    ListTile(
                      title: const Text('Courses'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.courses,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Aides ménagères'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.aidesMenageres,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Accompagnement médical'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.accompagnementMedical,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Apprentissage'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.apprentissage,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Activitées'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.activitees,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    TextField(
                      maxLines: null,
                      // maxLength: 1000,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 30),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        labelText: 'Description'),
                    ),
                    SizedBox(height: 40,),
                    SizedBox(
                      width: 120,
                      child: elevatedButton(context, "Valider", ()=> ProfileAccompanied()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
