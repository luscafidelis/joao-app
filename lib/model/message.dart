import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String type;
  final String video;
  final String message;
  final String username;
  final bool belongsToMe;
  final Timestamp sentOn;  
  final List<dynamic> options;

    Message({
      required this.belongsToMe,
      required this.username,
      required this.message,      
      required this.options,
      required this.sentOn,
      required this.video,
      required this.type,
    });

    factory Message.fromJson(Map<String, dynamic> json) {
      return Message(
        type: json['type'],
        video: json['video'],        
        sentOn: json['sentOn'],        
        message: json['message'],
        options: json['options'],
        username: json['username'],
        belongsToMe: json['belongsToMe'],
      );
  }
}