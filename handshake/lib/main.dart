import 'package:flutter/material.dart';
import 'package:handshake/views/connections.dart';
import 'package:handshake/views/announcement_form.dart';
import 'package:handshake/views/home_page.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/connections': (context) => Connection()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
    );
  }

}
