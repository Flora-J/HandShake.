import 'package:flutter/material.dart';
import 'package:handshake/views/page_profile_companions.dart';
import 'package:handshake/widgets/background_decoration.dart';
import 'package:handshake/widgets/button.dart';

class Connection extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                    PasswordField(
                      backgroundColor: Colors.white,
                      errorMessage: '''
                      - Une majuscule
                      - Une minuscule
                      - Un chiffre
                      - Un caractère spécial
                      - Un minimun de 8 caractères
                      ''',
                      hintText: 'Mot de passe',
                      inputDecoration: PasswordDecoration(
                        hintStyle: TextStyle(
                          color: Colors.blueAccent,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                        ),
                        inputPadding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      border: PasswordBorder(
                        border: OutlineInputBorder(
                            borderSide:
                            const BorderSide(width: 0, color: Colors.white),
                            borderRadius: BorderRadius.circular(25.7)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(width: 0, color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(width: 0, color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      child: elevatedButton(context, "Connexion",  ()=>ProfileCompanion()),
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



