import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../widgets/textfield_widget.dart';
import 'package:handshake/widgets/background_decoration.dart';


class hobbies_accompagned extends StatefulWidget {

  @override
  _hobbies_accompagnedState createState()=> _hobbies_accompagnedState();

}

class _hobbies_accompagnedState extends State<hobbies_accompagned> {

  String dropdownValue = 'Musique';
  final organisationController = TextEditingController();
  final otherHobbieController = TextEditingController();


  get decoration => null;
  @override
  Widget build(BuildContext context) {

    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final handShakeRef = ref.child('/handShakeDb/user');
    final hobbies= handShakeRef.child('/key/hobbies');
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
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'dis-nous en plus sur toi !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 20),
              _buildRowHobbies(),
              SizedBox(height: 20,),
              textFieldBasic(otherHobbieController,"As-tu d'autre loisir ? Si oui, nommes-les"),
              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 14, 118, 223), elevation: 10),
                    onPressed: () async {
                      /*final newEntry = <String, dynamic>{

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
                      ;*/
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/connections', (route) => false);
                    },
                    child: Text(
                      "Inscription",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ), ),
    );
  }

  SizedBox marginColumn() => const SizedBox(height: 20);

  Widget _buildRowHobbies() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("As-tu des loisirs ?", style: TextStyle(fontSize: 18,color: Colors.white)),
        SizedBox(
          width: 30,
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
          items: <String>['Musique', 'Lecture', 'Jeu vidéos', 'Activité en plein air','Séries / Films','Documentaire']
              .map<DropdownMenuItem<String>>((String value) {
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