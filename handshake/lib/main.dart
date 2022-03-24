import 'package:flutter/material.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/views/announcement_form.dart';
import 'package:handshake/views/sign_up.dart';
import 'package:handshake/views/hobbies.dart';



Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Hobbies(),
    );
  }

}
