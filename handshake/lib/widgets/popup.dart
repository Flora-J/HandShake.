import 'package:flutter/material.dart';
import 'package:handshake/views/chat_select.dart';

class PopupAnnoncements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Souhaitez-vous effectuer cette mission ?'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Commencez par envoyer un message pour briser la glace"),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext) => Chat()));
            },
          child: const Text('Envoyer un message'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Fermer'),
        ),

      ],
    );
  }
}

Widget popupConfirmation(){
  return AlertDialog(
    title: const Text('Titre annonce'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Un bénévole se fera un plaisir de revenir vers vous !"),
      ],
    ),
    actions: <Widget>[
      new ElevatedButton(
        onPressed: () {
          //Navigator.of(context).pop();
        },
        child: const Text('Fermer'),
      ),
    ],
  );

}