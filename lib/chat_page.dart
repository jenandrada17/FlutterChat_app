import 'dart:convert';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //initiate state of messages
  List<ChatMessageEntity> _messages = [];

  // List<ChatMessageEntity> _messages = [
  //   ChatMessageEntity(
  //     author: Author(userName: 'sendUser'), createdAt: 20231226, id: '1', text: 'First text' ),
  //   ChatMessageEntity(
  //     author: Author(userName: 'receivedUser'), createdAt: 20231227, id: '2', text: 'Second text', imageUrl: 'https://www.pngmart.com/files/13/Cartoon-Character-PNG-Transparent-Picture.png' ),
  //   ChatMessageEntity(
  //     author: Author(userName: 'sendUser'), createdAt: 20231228, id: '3', text: 'Third text' )
  // ];

  _loadInitialMessages() async {
    rootBundle.loadString('assets/mock_messages.json').then((response){
      final List<dynamic> decodedList = jsonDecode(response) as List;

      final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem){
        return ChatMessageEntity.fromJson(listItem);
      }).toList();

      print(_chatMessages.length);

      setState(() {
        _messages = _chatMessages;
      });
    }).then((_) {
      print('done!');
    });

    print('Something');
  }

  onMessageSent(ChatMessageEntity entity){
    _messages.add(entity);
    setState(() {});
  }

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = context.watch<AuthService>().getUserName();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Hi $username'),
        actions: [
          IconButton(
              onPressed: (){
                context.read<AuthService>().updateUserName("sendUser"); 
              },
              icon: Icon(Icons.abc)),
          IconButton(
              onPressed: (){
                context.read<AuthService>().logoutUser();
                // Navigator.pop(context);  //Go to previous page
                // Navigator.maybePop(context);  //Dont close if it is the only screen (stay on screen)
                // Navigator.pushNamed(context, '/');
                // Navigator.popAndPushNamed(context, '/');
                Navigator.pushReplacementNamed(context, '/');
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
                itemBuilder: (context, index){
              return ChatBubble(
                  alignment: _messages[index].author.userName == context.read<AuthService>().getUserName()
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  entity: _messages[index]);
            })),
          ChatInput(onSubmit: onMessageSent),
        ],
      ),
    );
  }
}
