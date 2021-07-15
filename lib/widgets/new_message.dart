
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget{
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage>{
  
  final _controller = TextEditingController();
  String _enteredMessage = '';

  Future <void> _sendMessage() async{

    FirebaseFirestore.instance.collection('chat').add(
      {
        'text': _enteredMessage,
        'createdAt': Timestamp.now(),
        'userID': 'test-user',
        'user': 'Lucas',
        'type': 'message'
      }
    );    
    _controller.clear();
    FocusScope.of(context).unfocus();

  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
          ),
          IconButton(
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send)
          )
        ]),
    );
  }
}