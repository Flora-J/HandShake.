import 'package:flutter/material.dart';
import 'package:handshake/views/page_profile_accompanied.dart';
import 'package:handshake/widgets/background_decoration.dart';
import 'package:handshake/widgets/button.dart';

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

//final controller = GroupButtonController();
class _FormAnnounce extends State<FormAnnounce> {
  SingingCharacter? _character = SingingCharacter.courses;

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
          padding: const EdgeInsets.only(top: 30.0, left: 24, right: 24, bottom: 140),
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    //floatingLabelAlignment: FloatingLabelAlignment.center,
                    labelText: 'Titre',
                    //helperStyle: TextStyle()
                  ),
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
                    labelText: 'Description',
                  ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  width: 120,
                  child: elevatedButton(context, "Valider", ()=> ProfileAccompanied()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
