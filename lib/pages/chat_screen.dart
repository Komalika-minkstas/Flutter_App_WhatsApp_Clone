import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/CustomUI/customCard.dart';
import 'package:whatsap_clone/models/chat_models.dart';
import 'package:whatsap_clone/pages/selectContact.dart';

class ChatScreen extends StatefulWidget{
  ChatScreen({Key? key, required this.chatModels, required this.sourceChat}) : super(key: key);
  final List<ChatModel> chatModels;
  final ChatModel sourceChat;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ChatScreenState();
  }

}
 class ChatScreenState extends State<ChatScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: ListView.builder(
        itemCount: widget.chatModels.length,
        itemBuilder: (contex,i)=>CustomCard(
            chatModel: widget.chatModels[i],
          sourceChat: widget.sourceChat,
        ) ,
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (builder)=>SelectContact()));
        },
      ),
    );
  }
}