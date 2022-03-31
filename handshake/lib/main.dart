import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:handshake/accueil.dart';
import 'package:handshake/connexion.dart';
import 'package:handshake/tchat.dart';
import 'package:handshake/widget/DbTest.dart';

import 'package:flutter/services.dart';
import 'package:handshake/views/connections.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/views/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

}


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/HomePage' : (context) => HomePage(),
        '/connections': (context) => Connection()
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: PresentationPage(),
    );
  }
}
