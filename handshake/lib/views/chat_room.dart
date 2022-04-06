import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:handshake/models/message.dart';
import 'package:handshake/services/stream_utility.dart';

class ChatRoom extends StatefulWidget {
  String idAccompanied;
  String idCompanion;
  String nameCompanion;
 String lastNameCompanion;

  ChatRoom({required this.nameCompanion, required this.idAccompanied, required this.idCompanion, required this.lastNameCompanion});

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  final messageController = TextEditingController();
  final authId = FirebaseAuth.instance.currentUser?.uid;
  DatabaseReference _database = FirebaseDatabase.instance.ref();
  late Map <String, dynamic> streamChat = {};
  List <Message> messageList = [];
  final date= DateTime.now();


  void _activateListeners() {
    _database
        .child('/handShakeDb/chat')
        .onValue
        .listen((event) {
      final data = new Map<String, dynamic>.from(
          event.snapshot.value as dynamic);
      data.forEach((key, value) {

        messageList.add(Message(idReceiver: value['id_Receiver'], idSender: value['id_Sender'], content: value['message']));
        print(value);
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
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.nameCompanion,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                         widget.lastNameCompanion,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: /*InkWell(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Column(
            children: [
              Flexible(
                  child: (authId != null)
                  ? FirebaseAnimatedList(
                      query: _database.child('/handShakeDb/chat/id/message').getMessageRef,
                      itemBuilder: null)
                  : Center(child: Text("Chargement"));
              }),
            ],
          ),
        )*/
Stack(
    children:[
      /*StreamBuilder(
        stream: StreamUtility().getMessageStream(),
          builder: (builder, snapshot){
            final tileList = <ListTile>[];
          if (snapshot.hasData){
            final message = snapshot.data as List<Message>;
            tileList.addAll(
              message.map((Message){
                return ListTile(
                  leading: Icon(Icons.abc),
                  title: Text(Message.content),
                );
              }
            ));
          }


      }),*/

      ListView(
        shrinkWrap: true,
        children:[
      //StreamBuilder(builder: )
           ListView.builder(
            itemCount: messageList.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, value){
              return Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                child: Text(messageList[value].content),
              );
            },
            )]),

            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: IconButton(
                        onPressed : () async{
                          streamChat ={
                            'id_Sender': authId,
                            'message': messageController.text,
                            'id_Receiver':widget.idCompanion,
                            'time': date.millisecondsSinceEpoch
                          };
                          try {
                            await _database.child('/handShakeDb/chat').push().set(
                                streamChat);
                            print('message envoyé');
                          }
                          catch(error) {
                            print(error);
                          }

                        },

                        color: Colors.white,
                        icon: Icon(Icons.send),
                      ),
                      backgroundColor: Colors.blue,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
