import 'package:firebase_lets_baat/model/user.dart';
import 'package:firebase_lets_baat/widget/messages_widget.dart';
import 'package:firebase_lets_baat/widget/new_message_widget.dart';
import 'package:firebase_lets_baat/widget/profile_header_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final User user;

  const ChatPage({
    @required this.user,
    Key key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    extendBodyBehindAppBar: true,
    backgroundColor: Colors.black,
    body: SafeArea(
      child: Column(
        children: [
          ProfileHeaderWidget(name: widget.user.name),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.lightblue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: MessagesWidget(idUser: widget.user.idUser),
            ),
          ),
          NewMessageWidget(idUser: widget.user.idUser)
        ],
      ),
    ),
  );
}

class Colors {
}


