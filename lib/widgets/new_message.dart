import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewMessage extends StatefulWidget{
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage>{
  
  final _controller = TextEditingController();
  String _enteredMessage = '';

  Future <void> _sendMessage() async{
    Timestamp sentON = Timestamp.now();

    if(_enteredMessage.trim().isNotEmpty){
      Future<http.Response> resposta =  http.post(
        Uri.parse('https://joao-bot-api.herokuapp.com/init'));

      resposta.whenComplete(() async {
        final response = await http.post(Uri.parse('https://joao-bot-api.herokuapp.com/conversation'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'message': _enteredMessage       
        }),
      );      
      FirebaseFirestore.instance.collection('chat').add(
          {
            'text': _enteredMessage,
            'createdAt': sentON,
            'userID': 'test-user',
            'user': 'Lucas',
            'type': 'message'
          }
        );
      if (response.statusCode == 200) {
        

        //Decodifica a mensagem
        final msg = jsonDecode(response.body);

        if(msg.containsKey('video')){
          FirebaseFirestore.instance.collection('chat').add(
            {
              'text': msg['msg'],
              'createdAt': Timestamp.now(),
              'userID': 'joao',
              'user': 'João',
              'type': 'video',
              'video': msg['video'].replaceAll('https://www.youtube.com/watch?v=','')
            } 
          );
        }else{
          FirebaseFirestore.instance.collection('chat').add(
            {
              'text': msg['msg'],
              'createdAt': Timestamp.now(),
              'userID': 'joao',
              'user': 'João',
              'type': 'message'
            } 
          );
        }
      }
        
      });

      _controller.clear();
      FocusScope.of(context).unfocus(); 
            
    }
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10, bottom: 5),
              padding: EdgeInsets.only(bottom: 20,left: 15, right: 15),
              child: Semantics(
                label: 'Digite uma mensagem',
                child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Digite uma mensagem',
                      labelStyle: TextStyle(color: Colors.white)
                    ),
                    onChanged: (value){
                      setState(() {
                        _enteredMessage= value;
                      });
                    },
                  ),
              ),
            ),
            ),
          IconButton(
            onPressed: _sendMessage,
            icon: Icon(Icons.send),
            color: Colors.white,
          )
        ]
      ),                    
      color: Colors.grey[900],      

    );
  }
}