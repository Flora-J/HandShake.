import 'package:flutter/material.dart';
import 'package:handshake/models/chatusersModel.dart';
import 'package:handshake/widgets/background_decoration.dart';
import 'package:handshake/widgets/conversationList.dart';

class Chat extends StatefulWidget {
  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Matthieu",
        messagetext: "Bah alors Matthieu",
        imageUrl: "images/logo-handshake.png",
        time: "now"),
    ChatUsers(
        name: "Matthieu",
        messagetext: "Pourquoi?",
        imageUrl: "images/logo-handshake.png",
        time: "Yesterday"),
    ChatUsers(
        name: "Florence",
        messagetext: "Bah alors !!",
        imageUrl: "images/logo-handshake.png",
        time: "22-03-2022"),
    ChatUsers(
        name: "Florence",
        messagetext: "Matthieu !!",
        imageUrl: "images/logo-handshake.png",
        time: "24-03-2022"),
    ChatUsers(
        name: "Matt",
        messagetext: "C'est pour quoi ?",
        imageUrl: "images/logo-handshake.png",
        time: "25-03-2022"),
    ChatUsers(
        name: "Matthieu",
        messagetext: "Bah alors Matthieu",
        imageUrl: "images/logo-handshake.png",
        time: "now"),
    ChatUsers(
        name: "Matthieu",
        messagetext: "Bah alors Matthieu",
        imageUrl: "images/logo-handshake.png",
        time: "now"),
    ChatUsers(
        name: "Matthieu",
        messagetext: "Bah alors Matthieu",
        imageUrl: "images/logo-handshake.png",
        time: "now"),
    ChatUsers(
        name: "Matthieu",
        messagetext: "Bah alors Matthieu",
        imageUrl: "images/logo-handshake.png",
        time: "now"),
    ChatUsers(
        name: "Matthieu",
        messagetext: "Bah alors Matthieu",
        imageUrl: "images/logo-handshake.png",
        time: "now"),
  ];

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
              ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16, bottom: 350),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ConversationList(
                      name: chatUsers[index].name,
                      messageText: chatUsers[index].messagetext,
                      imageUrl: chatUsers[index].imageUrl,
                      time: chatUsers[index].time,
                      isMessageRead: (index == 0 || index == 10) ? true : false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
