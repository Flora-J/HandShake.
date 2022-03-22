import 'package:flutter/material.dart';

Widget elevatedButton(BuildContext context, String text, Widget Function() createPage) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 14, 118, 223), elevation: 10),
      onPressed: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (BuildContext) => createPage()
        )
        );
      },
      child: Text(
        text,
      ),
    );
  }