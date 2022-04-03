import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:handshake/models/chat_users.dart';
import 'package:handshake/widgets/background_decoration.dart';
import 'package:handshake/widgets/bottomNavigationBar.dart';


class Chat extends StatefulWidget {
  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  final _database = FirebaseDatabase.instance.ref();
  List<Chat_users> chatUsers = [];

  void _activateListeners() {
    _database
        .child('/handShakeDb/user')
        .onValue
        .listen((event) {

      final data = new Map<String, dynamic>.from(event.snapshot.value as dynamic);
      data.forEach((key, value) {
        chatUsers.add(new Chat_users(name: value['FirstName'], photo: value['Photo'], key:key, lastName: value['LastName']));

        //print(chatUsers[0].key);
        //print(chatUsers[1].key);
        //print(chatUsers[0].photo);

        setState(() {
          print(key);
          print(chatUsers[0].name);
          print(chatUsers[0].lastName);
          print(chatUsers[0].photo);

        });

      });
    });

  }
  @override
  void initState() {
    super.initState();
    _activateListeners();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        title: const Text(
          "Mes conversations",
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
      bottomNavigationBar: generalBottomNavigationBar(context),
      body: Container(
        decoration: fondDecoration(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Conversations",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w100),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 2, bottom: 2),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blueAccent,
                        ),
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Add New",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  autocorrect: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_rounded),
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Recherche",
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                  ),
                  onTap: () {},
                ),
              ),
           /*  ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16, bottom: 350),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, value) {
                  return;
                },
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
