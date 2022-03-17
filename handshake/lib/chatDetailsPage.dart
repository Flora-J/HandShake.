import 'package:flutter/material.dart';

class ChatDetailsPage extends StatefulWidget{

  @override
 ChatDetailsPageState createState() => ChatDetailsPageState();
}

class ChatDetailsPageState extends State<ChatDetailsPage>{
  @override
  Widget build(BuildContext context) {
    return(
    Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back_ios_new_rounded)
              )],
          ),
        ),

        ),
      ),
      body: Container(

      ),
    )
    );
  }



}