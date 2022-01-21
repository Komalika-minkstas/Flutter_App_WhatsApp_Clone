import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/CustomUI/customCard.dart';
import 'package:whatsap_clone/models/chat_models.dart';

class ChatScreen extends StatefulWidget{
  ChatScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ChatScreenState();
  }

}
 class ChatScreenState extends State<ChatScreen>{
  List<ChatModel> dummyData=[
    new ChatModel(
        name: "Karishma",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 1,
        status: "seen",
        avatarUrl: "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"
    ),
    new ChatModel(
        name: "Karishma",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 1,
        status: "seen",
        avatarUrl: "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"
    ),
    new ChatModel(
        name: "Karishma",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 1,
        status: "seen",
        avatarUrl: "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"
    ),
    new ChatModel(
        name: "Karishma",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 1,
        status: "seen",
        avatarUrl: "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"
    ),
    new ChatModel(
        name: "Karishma",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 1,
        status: "seen",
        avatarUrl: "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"
    ),
    new ChatModel(
        name: "Karishma",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 1,
        status: "seen",
        avatarUrl: "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (contex,i)=>CustomCard(
            chatModel: dummyData[i],
        ) ,
      ),
    );
  }
}