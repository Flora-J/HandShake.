import 'package:flutter/material.dart';
import '../widgets/textfield_widget.dart';
import 'package:handshake/widgets/background_decoration.dart';

import 'connections.dart';

class SignupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController();
    final lastnameController = TextEditingController();
    final addressController = TextEditingController();
    final cityController = TextEditingController();
    final cpController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmationPasswordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //resizeToAvoidBottomPadding: false,
     appBar: AppBar(
        elevation: 30,
        title: const Text(
          "Inscription",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
             decoration: fondDecoration(),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        SizedBox(height: 20,)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        children: [
                          textFieldBasic(nameController,"nom"),
                          textFieldBasic(lastnameController,"prénom"),
                          textFieldBasic(addressController,"adresse"),
                          textFieldBasic(cityController,"ville"),
                          textFieldBasic(cpController,"code postal"),
                          textFieldBasic(emailController,"e-mail"),
                          textFieldPassword(passwordController,"mot de passe"),
                          textFieldPassword(confirmationPasswordController,"confirmation de votre mot de passe"),
                          
                        ],
                      ),
                    ),
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
                          child: Text("Inscription",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,

                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Avez-vous déjà un compte ?"),
                        TextButton(
                          onPressed: () { 
                             Navigator.push(context, 
          MaterialPageRoute(builder: (BuildContext) => Connection()));
                           },
                          child: Text(
                          "Connexion",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        )
                        ,),),
                      ],
                    )
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

class Children {
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
              color: Colors.grey,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
        ),
      ),
      SizedBox(height: 30,)

    ],
  );
}





