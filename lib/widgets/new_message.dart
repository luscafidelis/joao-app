
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget{
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage>{
  
  final _controller = TextEditingController();
  String _enteredMessage = '';

  Future <void> _sendMessage() async{
    //FocusScope.of(context).unfocus();
    //final user = await FirebaseAuth.instance.currentUser!();

    FirebaseFirestore.instance.collection('chat').add(
      {
        'text': _enteredMessage,
        'createdAt': Timestamp.now(),
        'userID': 'test-user'
      }
    );    
    _controller.clear();

  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enviar mensagem!'
              ),
              onChanged: (value){
                setState(() {
                  _enteredMessage= value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send)
          )
        ]),
    );
  }
}