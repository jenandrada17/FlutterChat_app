import 'package:flutter/material.dart';
import 'LoginPage.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App!!",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  } 
}


