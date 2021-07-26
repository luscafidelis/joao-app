import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joaoapp/model/time_ago.dart';

class OptionsBubble extends StatelessWidget{

  final String message;
  final String username;
  final bool belongsToMe;
  final Timestamp sentOn;
  final List<dynamic> options;  

  OptionsBubble(this.message, this.username, this.belongsToMe, this.sentOn, this.options);

  Future <void> _answerMessage(answer) async{

    FirebaseFirestore.instance.collection('chat').add(
      {
        'text': answer,
        'createdAt': Timestamp.now(),
        'userID': 'test-user',
        'user': 'Lucas',
        'type': 'message'
      }
    ); 
  }

  @override
  Widget build (BuildContext context){
    return Row(
      mainAxisAlignment: belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: belongsToMe ? Colors.grey : Colors.grey[100],            
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
                          color: Color.fromRGBO(33, 33, 33, 1)
                        ), 
                      ),
                    ),

                    //Avatar
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: belongsToMe ? Colors.grey : Colors.redAccent,
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
                          color: Color.fromRGBO(33, 33, 33, 1)
                        ), 
                      ),
                    )
                  ],
                )
                
                ,
              ),

              //Mensagem
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //Mensagem
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        message,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color.fromRGBO(33, 33, 33, 1)
                        ),
                      ),
                    ),
                    
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 45),
                        primary: Colors.redAccent,
                        onPrimary: Colors.white),
                      onPressed: (){_answerMessage(options[0]);}, child: Text(options[0])),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 45),
                        primary: Colors.redAccent,
                        onPrimary: Colors.white),
                      onPressed: (){_answerMessage(options[1]);}, child: Text(options[1])),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 45),
                        primary: Colors.redAccent,
                        onPrimary: Colors.white),
                      onPressed: (){_answerMessage(options[2]);}, child: Text(options[2])),                    
                  ]
                )
                ),

              //Data de envio da mensagem
              Text(
                TimeAgo.timeAgoSinceDate(sentOn.toDate().toString()),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 10,                  
                )),
            ],
          ) 
        ,)
      ]
    
    );
  }
}