import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget{

  final String message;
  final bool belongsToMe;

  MessageBubble(this.message,this.belongsToMe);

  @override
  Widget build (BuildContext context){
    return Row(
      mainAxisAlignment: belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: belongsToMe ? Color.fromRGBO(245, 245, 245, 1) : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: belongsToMe ? Radius.circular(12) : Radius.circular(0),
              bottomRight: belongsToMe ? Radius.circular(0) : Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(1, 1),
              ),
            ]
          ),

          width: 140,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16
          ),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8
          ),
          child: Text(message) 
        ,)
      ]
    );
  }
}