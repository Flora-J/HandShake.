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

Widget popupConfirmation(BuildContext context, Text titre, String texte){
  return AlertDialog(
    title: titre,
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(texte),
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