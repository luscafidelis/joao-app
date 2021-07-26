import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:joaoapp/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Semantics(label: 'João',child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: MaterialApp(
        title: 'João - Chatbot',
        themeMode: ThemeMode.system,
    
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.redAccent,
          accentColor: Colors.grey[900],
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey,
            accentColor: Colors.redAccent,
          ).copyWith(),    
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black12,
          accentColor: Colors.redAccent,
          primarySwatch: Colors.grey,
          
        ),      
        home: ChatScreen(),
      ),
    );
  }
}