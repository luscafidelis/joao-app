import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joaoapp/model/time_ago.dart';

class MessageBubble extends StatelessWidget{

  final String message;
  final String username;
  final bool belongsToMe;
  final Timestamp sentOn;

  MessageBubble(this.message, this.username, this.belongsToMe, this.sentOn);

  @override
  Widget build (BuildContext context){
    return Row(
      mainAxisAlignment: belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: belongsToMe ? Colors.grey[400] : Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: belongsToMe ? Radius.circular(12) : Radius.circular(0),
              bottomRight: belongsToMe ? Radius.circular(0) : Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.2,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ]
          ),

          width: MediaQuery.of(context).size.width * 0.75,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16
          ),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8
          ),
          child: Column(
            crossAxisAlignment: belongsToMe ? CrossAxisAlignment.end: CrossAxisAlignment.start,
            children: <Widget>[
              
              //Remetente
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: belongsToMe ?
                Row(
                  mainAxisAlignment: belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [                   

                    //Nome
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(username,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(33, 33, 33, 1),
                        ), 
                      ),
                    ),

                    //Avatar
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: belongsToMe ? Colors.redAccent : Colors.redAccent,
                      child: belongsToMe ?
                       const Icon(Icons.face_outlined, color: Colors.white):
                       const Icon(Icons.tag_faces_sharp, color: Colors.white)                           
                    )
                  ],

                  

                ):
                Row(
                  mainAxisAlignment: belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [

                    //Avatar
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: belongsToMe ? Colors.grey : Colors.redAccent,
                      child: belongsToMe ?
                       const Icon(Icons.face_outlined, color: Colors.white):
                       const Icon(Icons.tag_faces_sharp, color: Colors.white)                           
                    ),

                    //Nome
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(username,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(33, 33, 33, 1),
                        ), 
                      ),
                    )
                  ],
                )
                
                ,
              ),

              //Mensagem
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  message,
                  textAlign: TextAlign.start,
                  style: TextStyle(                                                  
                    color: Color.fromRGBO(33, 33, 33, 1),
                    fontSize: 14   
                  ),
                   
                ),
              ),
              Text(
                TimeAgo.timeAgoSinceDate(sentOn.toDate().toString()),
                style: TextStyle(
                  color: Color.fromRGBO(100, 100, 100, 1),
                  fontSize: 10
                )),
            ],
          ) 
        ,)
      ]
    );
  }
}