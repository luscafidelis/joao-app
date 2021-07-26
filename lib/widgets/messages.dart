import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joaoapp/widgets/bubble_message.dart';
import 'package:joaoapp/widgets/bubble_choices.dart';
import 'package:joaoapp/widgets/bubble_video.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
        return Semantics(
          label: 'Lista de mensagens',
          child: ListView.builder(
            semanticChildCount: chatDocs.length,
            reverse: true,
            shrinkWrap: true,
            itemCount: chatDocs.length,
            itemBuilder: (ctx,i) {
        
              if(chatDocs[i]['type'] == 'choice')
                return Semantics(
                  child: OptionsBubble(
                    chatDocs[i]['text'],
                    chatDocs[i]['user'],
                    chatDocs[i]['userID'] == 'test-user'? true : false,
                    chatDocs[i]['createdAt'],
                    chatDocs[i]['options']),
                );
        
              if(chatDocs[i]['type'] == 'video')
                return VideoBubble(
                  chatDocs[i]['text'],
                  chatDocs[i]['user'],
                  chatDocs[i]['userID'] == 'test-user'? true : false,
                  chatDocs[i]['createdAt'],
                  new YoutubePlayerController(
                    initialVideoId: chatDocs[i]['video'],
                    params: YoutubePlayerParams(
                        autoPlay: false,
                        mute: false,
                        enableCaption: true,
                        showControls: true,
                        showFullscreenButton: true,
                    ),
                  )
                );
        
              return MessageBubble(
                chatDocs[i]['text'],
                chatDocs[i]['user'],
                chatDocs[i]['userID'] == 'test-user'? true : false,
                chatDocs[i]['createdAt']);
            } 
          ),
        );
      }
    );
  }
}
