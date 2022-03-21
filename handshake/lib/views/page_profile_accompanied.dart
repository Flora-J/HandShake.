import 'package:flutter/material.dart';


class ProfilAccompagne extends StatelessWidget {

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.teal,//backgroundImage: NetworkImage(),
                ),
                SizedBox(
                    height: 8,
                ),
                Text(
                    "Vert",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "@vert",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            Text("Followers",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                            ),
                            ),
                            Text(
                              "255K",
                              style: TextStyle(
                              fontSize: 16,
                            ),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
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

