import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../widgets/textfield_widget.dart';
import 'package:handshake/widgets/background_decoration.dart';

class HobbiesCompanions extends StatefulWidget {
  @override
  _HobbiesCompanionsState createState() => _HobbiesCompanionsState();
}

class _HobbiesCompanionsState extends State<HobbiesCompanions> {
  String dropdownValue = 'Musique';
  final organisationController = TextEditingController();
  final otherHobbieController = TextEditingController();

  get decoration => null;

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final handShakeRef = ref.child('/handShakeDb/user');
    final hobbies = handShakeRef.child('/key/hobbies');
    List<String> activite = [];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 30,
        title: const Text(
          "Loisirs",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: fondDecoration(),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Dis-nous en plus sur toi !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              textFieldBasic(
                  organisationController, "De quelle organisation viens-tu ?"),
              marginColumn(),
              SizedBox(
                height: 20,
              ),
              _buildRowHobbies(),
              SizedBox(
                height: 20,
              ),
              textFieldBasic(otherHobbieController,
                  "As-tu d'autre loisir ? Si oui, nommes-les"),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black))),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
<<<<<<< HEAD
                      activite.add(dropdownValue);
                      activite.add(otherHobbieController.text);

                      try {
                        await hobbies.set(
                          {
                            'Organisation': organisationController.text,
                            'Activité 1': activite[0],
                            'Activité 2': activite[1]
                          },
                        );
=======
                      final newEntry = <String, dynamic>{
                        'Organisation': organisationController.text,
                        'Activité 1': dropdownValue,
                        'Activité 2': otherHobbieController,
                        //'Photo' :
                      };
                      try {
                        // Get information in the data base
                        handShakeRef.push().set(newEntry);
>>>>>>> link-announces
                        print("entry has been added");
                      } catch (error) {
                        print('Entry has not been added : $error');
                      }
                      ;
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/connections', (route) => false);
                    },
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      "Suivant",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(dropdownValue)
            ],
          ),
        ),
      ),
    );
  }

  SizedBox marginColumn() => const SizedBox(height: 20);

  Widget _buildRowHobbies() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("As-tu des loisirs ?",
            style: TextStyle(fontSize: 18, color: Colors.white)),
        SizedBox(
          width: 50,
        ),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>[
            'Musique',
            'Lecture',
            'Jeu vidéos',
            'Activité en plein air',
            'Séries / Films',
            'Documentaire'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
