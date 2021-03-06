import 'package:flutter/material.dart';

import 'package:handshake/views/page_profile_accompanied.dart';
import 'package:handshake/views/page_profile_companions.dart';
import 'package:handshake/views/sign_up_accompanied.dart';
import 'package:handshake/views/sign_up_companions.dart';
import 'package:handshake/widgets/button.dart';
import 'package:handshake/widgets/logo.dart';

import '../widgets/background_decoration.dart';

class PreRegistration extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 30,
          title: const Text(
            "Pré-enregistrement",
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
            padding: const EdgeInsets.only(top: 0),
        width: size.width,
        height: size.height,
            decoration: fondDecoration(),
            child: Container(
              alignment: Alignment.center,
              child: Column(children: [
          Container(
            child: logo(size),
          ),
          Container(
            margin: EdgeInsets.only(top: 70),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(

                    width: 140,
                    child: elevatedButton(context, "Accompagné(e)", ()=>SignupPageAccompanied()),
                  ),
                  SizedBox(
                    width: 140,
                    child: elevatedButton(context, "Accompagnant", ()=>SignupPageCompanions()),

                  ),
                ]),
          ),
        ]),
      ),
    ),
    );
  }
}