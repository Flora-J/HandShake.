import 'package:flutter/material.dart';
import 'package:handshake/models/chatusersModel.dart';
import 'package:handshake/widget/conversationList.dart';

class Chat extends StatefulWidget {
  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Matthieu", messagetext: "Bah alors Matthieu", imageUrl: "handshake/images/logo-handshake.png" , time: "now")
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.handshake_outlined),
        centerTitle: true,
        title: const Text(
          "HandShake",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
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
                      style:
                      TextStyle(fontSize: 32, fontWeight: FontWeight.w100),
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
            child:TextField(

              textAlignVertical: TextAlignVertical.center,
              autocorrect: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_rounded
                ),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          ),
              hintText: "Recherche",

              hintStyle: TextStyle(

              color: Colors.grey.shade300
              ),



    ),
    onTap: (){

    },
          ),
          ),
            ListView.builder(itemCount: chatUsers.length,
            shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
              return ConversationList(name: chatUsers[index].name, messageText: chatUsers[index].messagetext, imageUrl: chatUsers[index].imageUrl, time: chatUsers[index].time, isMessageRead: (index==0 || index==3)?true:false);
              },

            )

          ],
        ),
      ),
    );
  }
}
