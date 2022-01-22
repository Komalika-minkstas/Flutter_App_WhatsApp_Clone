import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/CustomUI/buttonCard.dart';
import 'package:whatsap_clone/CustomUI/callScreenCard.dart';
import 'package:whatsap_clone/CustomUI/contactCard.dart';
import 'package:whatsap_clone/models/chat_models.dart';
import 'package:whatsap_clone/pages/createGroup.dart';
import 'package:whatsap_clone/pages/selectContact.dart';
import 'package:whatsap_clone/pages/selectContactForCalls.dart';

class CallScreen extends StatefulWidget {
  CallScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CallScreenState();
  }
}

class _CallScreenState extends State<CallScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<ChatModel> contacts=[
      ChatModel(
          name: "Dev Stack",
          time: "20 January,21:23"
      ),
      ChatModel(
          name: "Dev Stack",
          time: "10 January,21:23"
      ),
      ChatModel(
          name: "Dev Stack",
          time: "5 January,21:23"
      ),
      ChatModel(
          name: "Dev Stack",
          time: "4 January,21:23"
      ),
    ];
    return Scaffold(

      body: ListView.builder(
        itemBuilder: (context,i){
          return CallScreenCard(contact: contacts[i]);
        },
        itemCount: contacts.length,
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.add_call,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (builder)=>SelectContactForCall()));
        },
      ),
    );
  }

}