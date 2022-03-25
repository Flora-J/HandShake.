import 'package:flutter/material.dart';
import '../widgets/textfield_widget.dart';
import 'package:handshake/widgets/background_decoration.dart';


class Hobbies extends StatefulWidget {
  
  @override
  _HobbiesState createState()=> _HobbiesState();

}

class _HobbiesState extends State<Hobbies> {

  String dropdownValue = 'Musique';
  final organisationController = TextEditingController();
  final otherHobbieController = TextEditingController();

  get decoration => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
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
                'Bienvuenue à HandShake, dis-nous en plus sur toi !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 20),
              textFieldBasic(organisationController,"De quelle organisation viens-tu ?"),
              marginColumn(),
              SizedBox(height: 20,),
              _buildRowHobbies(),
              SizedBox(height: 20,),
              textFieldBasic(otherHobbieController,"As-tu d'autre loisir ? Si oui, nommes-les"),
              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.only(top: 3,left: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black)
                      )
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height:60,
                    onPressed: (){},
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Text("Suivant",style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 16,
                    ),),
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
          width: 500,
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