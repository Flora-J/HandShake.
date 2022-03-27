
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handshake/views/home_page.dart';


Widget myBottomBar (BuildContext context) {
  return BottomNavigationBar(
    unselectedItemColor: Colors.blue,

    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: 'Home'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Chat'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.exit_to_app_outlined),
          label: 'deconnection'
      )

    ],
    onTap: (index){
      switch (index){
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => HomePage()));
          break;

        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => HomePage()));
          break;

        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => HomePage()));
          break;
      }

    },

  );
}
//}