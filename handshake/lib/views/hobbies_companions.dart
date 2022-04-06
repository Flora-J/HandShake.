import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../widgets/textFormField_widget.dart';
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

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final handShakeRef = ref.child('/handShakeDb/user');
    //final hobbies = handShakeRef.child('/key/hobbies');
    //List<String> activite = [];

    return Scaffold(
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
          padding: EdgeInsets.only(top: 40),
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
              Form(
                key: _formKey,
                child: Column(
                children:[

                textFormBasicOrg(
                  organisationController, "De quelle organisation viens-tu ?"),
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
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 14, 118, 223), elevation: 10),
                    onPressed: () {

                      if (_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Validé')),
                        );
                      }
                      /*final newEntry = <String, dynamic>{
                        'Organisation': organisationController.text,
                        'Activité 1': dropdownValue.toString(),
                        'Activité 2': otherHobbieController.text,
                        //'Photo' :
                      };
                      try {
                        // Get information in the data base
                        handShakeRef.push().set(newEntry);
                        print("entry has been added");
                      } catch (error) {
                        print('Entry has not been added : $error');
                      }
                      ;*/ if (_formKey.currentState!.validate()) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/connections', (route) => false);
                      } },
                    child: Text(
                      "Inscription",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ]),
    )));
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
