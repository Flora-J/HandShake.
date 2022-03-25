import 'package:flutter/material.dart';
import 'package:handshake/widgets/background_decoration.dart';


class Hobbies extends StatefulWidget {
    static const routeName = '/hobbies';


  @override
  _HobbiesState createState()=> _HobbiesState();

}

class _HobbiesState extends State<Hobbies> {

  String dropdownValue = 'Musique';
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
                          TextField(
                            decoration: InputDecoration(
                              hintText: "De quelle organisation viens-tu ?",
                              hintStyle: TextStyle(fontSize: 18, color: Colors.white)
                            ),
                          ),
                          marginColumn(),
                       SizedBox(height: 20,),
                       _buildRowHobbies(),
                          SizedBox(height: 20,),
                           TextField(
                            decoration: InputDecoration(
                              hintText: "As-tu d'autre loisir ? Si oui nommes les.",
                              hintStyle: TextStyle(fontSize: 18, color: Colors.white, fontStyle: FontStyle.italic),
                            ),
                      ),
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


Widget makeInput({label,obsureText = false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
        ),
      ),
      SizedBox(height: 30,)

    ],
  );
}





