import 'package:flutter/material.dart';
import 'package:handshake/views/page_profile_companions.dart';
import 'package:handshake/widgets/background_decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Connection extends StatefulWidget {

  @override
  _connectionState createState() => _connectionState();
  }


class _connectionState extends State<Connection>{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;


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

  @override
  Widget build(BuildContext context) {

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
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: TextField(

                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "password",
                        hintStyle: TextStyle(fontSize: 18, color: Colors.blueAccent, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
                    Container(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 14, 118, 223),
                            onPrimary: Colors.white,
                            elevation: 10,
                        ),
                        onPressed: () async {

                          //print(emailController.text);
                          //print(passwordController.text);

                          try{
                            UserCredential userCredential = await auth.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileCompanion()));


                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }},
                        child: Text(
                          "connexion",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Center(child: Text('Mot de passe oublié ?')),
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
                          onPressed: () {},
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





