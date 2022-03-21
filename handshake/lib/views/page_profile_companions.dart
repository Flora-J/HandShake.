import 'package:flutter/material.dart';
import '../widgets/background_decoration.dart';


class ProfileCompanion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 30,
          title: const Text(
            "Profil",
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
        )
    );
  }
}
