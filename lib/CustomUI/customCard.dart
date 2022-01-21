import 'package:whatsap_clone/models/chat_models.dart';
import 'package:whatsap_clone/pages/individualPage.dart';
import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key, required this.chatModel})
      : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (contex)  => new IndividualPage(
            chatModel: chatModel,
        )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: new NetworkImage(chatModel.avatarUrl!),
              ),
            title: Text(
        chatModel.name!,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.done_all),
          SizedBox(
            width: 3,
          ),
          Text(
            chatModel.message!,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
      trailing: Text(chatModel.time!),
    ),
    Padding(
    padding: const EdgeInsets.only(right: 20, left: 80),
    child: Divider(
    thickness: 1,
    ),
    ),
        ],
      ),
    );
  }
}