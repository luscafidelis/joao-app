import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joaoapp/widgets/message_bubble.dart';

class Messages extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt',descending: true).snapshots(),
      builder: (ctx, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }

        final chatDocs = snapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          shrinkWrap: true,
          itemCount: chatDocs.length,
          itemBuilder: (ctx,i) => MessageBubble(
            chatDocs[i]['text'],
            chatDocs[i]['user'],
            chatDocs[i]['userID'] == 'test-user'? true : false,
            chatDocs[i]['createdAt'])
        );
      }
    );
  }
}