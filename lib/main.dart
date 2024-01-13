import 'package:chat_app/chat_page.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LoginPage.dart';

void main() {
  runApp(Provider(
      create: (BuildContext context) => AuthService(),
      child: ChatApp()));
}

class ChatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App!!",
      theme: ThemeData(
          canvasColor: Colors.transparent,
          primaryColor: BrandColor.primaryColor,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.black)), // Change primaryColor to the desired color
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
      // home: ChatPage(),
    );
  } 
}


