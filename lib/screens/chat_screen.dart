import 'package:flutter/material.dart';
import 'package:joaoapp/widgets/messages.dart';
import 'package:joaoapp/widgets/new_message.dart';

class ChatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('João, assistente no YouTube'),
        actions: <Widget>[
          TextButton(
            child: Text("Ajustes"),
            onPressed: (){},
          )
        ],
      ),
      body:Container(
        child: Column(
          children: <Widget>[
            Expanded(child: Messages()),
            NewMessage()
          ],
        ),
      ),
        
    );
  }
}