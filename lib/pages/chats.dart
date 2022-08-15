import 'package:flutter/material.dart';
import '../models/chat_modal.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: dummyData.length,
      itemBuilder: (context,i)=> Column(
        children: <Widget>[
          const Divider(
            height: 2.0,
          ),
          ListTile(
            leading: CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(dummyData[i].avatarUrl),
            ),

            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(dummyData[i].name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(dummyData[i].time,
                  style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14.0),
                )
              ],
            ),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                dummyData[i].message,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),

    );
  }
}

