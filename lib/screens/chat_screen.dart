import 'package:flutter/material.dart';
import 'package:joaoapp/widgets/messages.dart';
import 'package:joaoapp/widgets/new_message.dart';
import 'package:open_settings/open_settings.dart';

class ChatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Semantics(
      label:'Conversa com o João',
      child: Scaffold(
        appBar: AppBar(
          title: Text('João - Chatbot'),
          actions: <Widget>[          
            TextButton(
              child: Text("Acessibilidade"),            
              onPressed: (){
                OpenSettings.openAccessibilitySetting();
              },            
            )
          ],
          backgroundColor: Colors.grey[900],
          titleTextStyle: TextStyle(color: Colors.white),
          toolbarTextStyle: TextStyle(color: Colors.white),
        ),
        body:Container(
          child: Column(
            children: <Widget>[
              Expanded(child: Messages()),
              NewMessage(),
            ],
          ),
        ),
        
      ),
    );
  }
}