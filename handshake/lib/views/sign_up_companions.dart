import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:handshake/widgets/background_decoration.dart';

import '../widgets/textFormField_widget.dart';
import 'hobbies_companions.dart';


class SignupPageCompanions extends StatefulWidget {

  @override
  _SignupPageCompanionsState createState()=> _SignupPageCompanionsState();
}

class _SignupPageCompanionsState extends State<SignupPageCompanions>{

  FirebaseAuth auth = FirebaseAuth.instance;


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


    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final handShakeRef = ref.child('/handShakeDb/user');
    final _formKey = GlobalKey<FormState>();
    

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
                      child: Form(
                        key: _formKey,
                      child: Column(

                        children: [
                          textFormdBasic(nameController,"nom"),
                          textFormdBasic(lastnameController,"prénom"),
                          textFormdBasic(addressController,"adresse"),
                          textFormdBasic(cityController,"ville"),
                          textFormdBasic(cpController,"code postal"),
                          textFormdBasic(emailController,"e-mail"),
                          textFormPassword(passwordController,"mot de passe"),
                          textFormPassword(confirmationPasswordController,"confirmation de votre mot de passe"),
                          
                        ],
                      ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3,left: 3),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 14, 118, 223), elevation: 10),
                          onPressed: () async{
                            if (_formKey.currentState!.validate()) {
                              try {
                                UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }
                              final newEntry = <String, dynamic>{
                                'FirstName': nameController.text,
                                'LastName': lastnameController.text,
                                'Address': addressController.text,
                                'City': cityController.text,
                                'CP': cpController.text,
                                'Email': emailController.text,
                                //'Photo' :
                              };
                              try {
                                // Get information in the data base
                                await handShakeRef.push().set(newEntry);
                                print("entry has been added");
                              } catch (error) {
                                print('Entry has not been added : $error');
                              }
                              Navigator.push(context,MaterialPageRoute(builder: (BuildContext) => HobbiesCompanions()));
                            }
                          },
                          child: Text("Suivant")

                          ),),
                        ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Avez-vous déjà un compte ?"),
                        TextButton(
                          onPressed: () {

                            },

                          child: Text(
                          "Connexion",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        )
                        ,),
                          ),
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







