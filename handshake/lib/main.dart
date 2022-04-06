import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handshake/views/announcements.dart';
import 'package:handshake/views/connections.dart';
import 'package:handshake/views/home_page.dart';
import 'package:handshake/views/page_profile_accompanied.dart';
import 'package:handshake/views/presentation.dart';
import 'package:handshake/widgets/popup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

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
