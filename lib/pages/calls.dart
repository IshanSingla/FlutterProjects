import 'package:flutter/material.dart';
import 'call_item_page.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callItemData.length,
      itemBuilder: (context, i) => Column(
        children: <Widget>[
          const Divider(
            height: 2.0,
          ),
          ListTile(
            leading: CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage:  NetworkImage(callItemData[i].avatarUrl),
            ),
            title: Text(
              callItemData[i].name,
              style:  const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:  Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    Icon(Icons.call_received, color: callItemData[i].colorItem,),
                    const SizedBox(width: 10.0,),
                    Text(
                      callItemData[i].time,
                      style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                  ],
                )
            ),
            trailing: Icon(Icons.call, color: Theme.of(context).primaryColor,),
          )
        ],
      ),
    );
  }
}
