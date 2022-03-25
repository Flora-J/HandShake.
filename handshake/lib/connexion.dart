import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handshake/widget/DbTest.dart';
import 'package:passwordfield/passwordfield.dart';

class Connexion extends StatefulWidget{


  @override
  _Connexionstate createState() => _Connexionstate();

}

class _Connexionstate extends State<Connexion>{


  Widget userInput(TextEditingController userInput, String hintTitle, TextInputType keyboardType) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: TextField(
          controller: userInput,
          decoration: InputDecoration(
            hintText: hintTitle,
            hintStyle: TextStyle(fontSize: 18, color: Colors.blueAccent, fontStyle: FontStyle.italic),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }


  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    DatabaseReference Db = FirebaseDatabase.instance.ref();
    FirebaseAuth auth = FirebaseAuth.instance;
    final handShakeRef = Db.child('/handShakeDb');

    String _emailUser="";
    String _passwordUser="";
    String _emailInput = "";
    String _passwordInput="";

Future signIn({required String email, required String password}) async {
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    return null;
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        title: const Text(
          "Connexion",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    userInput(emailController, 'Email', TextInputType.emailAddress),
                    SizedBox(height: 20),
                  Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child:TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(

                        hintStyle: TextStyle(fontSize: 18, color: Colors.blueAccent, fontStyle: FontStyle.italic),
                      ),

                    ),

                  ),
                  ),
                    Container(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {

                          print(emailController.text);
                          print(passwordController.text);

                          try{
                          UserCredential userCredential = await auth.signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DbTest()));


                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }

                          /*await Db.child('handShakeDb/users/email').onValue.listen((event) {
                            final String _emailUserSnap = event.snapshot.value.toString();
                            setState(() {

                              _emailInput =emailController.text;
                              _emailUser = _emailUserSnap;


                            });
                            if (_emailInput == _emailUser)
                              print("les 2 sont identiques");
                            else
                              print ("Ca correspond pas");

                           // print("$_emailInput \n");
                            // print("L'email est : $_emailUser");

                          });


                          await Db.child('handShakeDb/users/password').onValue.listen((event) {
                            final String _passwordUserSnap = event.snapshot.value.toString();
                            setState(() {

                              _passwordInput = passwordController.text;
                              _passwordUser = _passwordUserSnap;

                              print("$_passwordInput \n");
                              print("le code est $_passwordUser");

                            });
                              if (_passwordInput == _passwordUser)
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DbTest()));
                              else
                                print("Mauvais code");
                           });*/




                        },
                        child: Text('Connexion', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white,),),
                      ),
                    ),
                    Center(child: Text('Mot de passe oublié ?'),),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Vous n\'avez pas encore de compte ? ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),),
                        TextButton(
                          onPressed: () {

                            //si Email existe
                              //password == password Email
                                //vers page profil (accompagnant ou accompagné)
                              //message erreur, wrong password
                            // message erreur cet email n'existe pas


                          },
                          child: Text(
                            'S\'enregistrer',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


BoxDecoration fondDecoration() {
  return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.blueAccent,
          Colors.white,
        ],
      ));
}
