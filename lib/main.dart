import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:joaoapp/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'João - Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.white,
        accentColorBrightness: Brightness.light,
        backgroundColor: Color.fromRGBO(33, 33, 33, 1),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Theme.of(context).primaryColor,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        )
      ),
      home: ChatScreen(),
    );
  }
}