import 'package:firebase_lets_baat/model/user.dart';
import 'package:firebase_lets_baat/page/chat_page.dart';
import 'package:flutter/material.dart';

class ChatHeaderWidget extends StatelessWidget {
  final List<User> users;

  const ChatHeaderWidget({
    @required this.users,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 34),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Text(
            'ChatsApp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 22),
        Container(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.only(right: 22),
                  child: CircleAvatar(
                    radius: 34,
                    child: Icon(Icons.search),
                  ),
                );
              } else {
                return Container(
                  margin: const EdgeInsets.only(right: 22),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChatPage(user: users[index]),
                      ));
                    },
                    child: CircleAvatar(
                      radius: 34,
                      backgroundImage: NetworkImage(user.urlAvatar),
                    ),
                  ),
                );
              }
            },
          ),
        )
      ],
    ),
  );

  ChatPage({required user}) {}
}
