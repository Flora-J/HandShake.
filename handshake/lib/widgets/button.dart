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

Widget elevatedButton2(BuildContext context, String text, Widget Function() createPage) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 250, 250, 250),
          elevation: 10,
          shadowColor: Color.fromARGB(255, 14, 118, 223),
          ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext) => createPage()
        )
        );
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.blue),
      ),
    );
  }