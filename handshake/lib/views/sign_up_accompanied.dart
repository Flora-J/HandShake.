<<<<<<< Updated upstream:handshake/lib/views/sign_up_accompanied.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
=======
>>>>>>> Stashed changes:handshake/lib/views/sign_up.dart
import 'package:flutter/material.dart';
import '../widgets/textfield_widget.dart';
import 'package:handshake/widgets/background_decoration.dart';

import 'connections.dart';

<<<<<<< Updated upstream:handshake/lib/views/sign_up_accompanied.dart
class SignupPageAccompanied extends StatefulWidget {

  @override
  _SignupPageAccompaniedState createState()=> _SignupPageAccompaniedState();
}


class _SignupPageAccompaniedState extends State<SignupPageAccompanied>{


  @override
=======
class SignupPage extends StatelessWidget {

  @override
>>>>>>> Stashed changes:handshake/lib/views/sign_up.dart
  Widget build(BuildContext context) {

    final nameController = TextEditingController();
    final lastnameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmationPasswordController = TextEditingController();

<<<<<<< Updated upstream:handshake/lib/views/sign_up_accompanied.dart
    FirebaseAuth auth = FirebaseAuth.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final handShakeRef = ref.child('/handShakeDb');
    

=======
>>>>>>> Stashed changes:handshake/lib/views/sign_up.dart
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
<<<<<<< Updated upstream:handshake/lib/views/sign_up_accompanied.dart
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 14, 118, 223), elevation: 10),
                          onPressed: () async{

                            try {
                              UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text
                              );

                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print('The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                            }

                            // Get information in the data base
                            try {
                                await handShakeRef.set({
                                  'FirstName': nameController.text,
                                  'LastName': lastnameController.text,

                                  });
                                print("entry has been added");
                              }catch(error){
                                print('Entry has not been added : $error' );
                              };
                            Navigator.pushNamedAndRemoveUntil(context, '/connections', (route) => false);


                          },
                          child: Text("Inscription")
=======
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
>>>>>>> Stashed changes:handshake/lib/views/sign_up.dart

                          ),),
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






