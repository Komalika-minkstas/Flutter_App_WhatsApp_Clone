import 'package:flutter/material.dart';
import 'package:whatsap_clone/CustomUI/buttonCard.dart';
import 'package:whatsap_clone/models/chat_models.dart';
import 'package:whatsap_clone/whatsApp_home.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.onImageSend}) : super(key: key);
  final Function onImageSend;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatModels = [
    new ChatModel(
        name: "Karishma",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 1,
        status: "seen",
        avatarUrl:
            "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"),
    new ChatModel(
        name: "Komalika",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 2,
        status: "seen",
        avatarUrl:
            "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"),
    new ChatModel(
        name: "Shraddha",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 3,
        status: "seen",
        avatarUrl:
            "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"),
    new ChatModel(
        name: "Tarun",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 4,
        status: "seen",
        avatarUrl:
            "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"),
    new ChatModel(
        name: "Anurag",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 5,
        status: "seen",
        avatarUrl:
            "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"),
    new ChatModel(
        name: "Mumma",
        message: "You looked amazing today",
        time: "15:30",
        isGroup: false,
        id: 6,
        status: "seen",
        avatarUrl:
            "https://qphs.fs.quoracdn.net/main-qimg-ac7d5daa6d546a312bc7c5217b368677-lq"),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
          itemCount: chatModels.length,
          itemBuilder: (context, i) => InkWell(
                onTap: () {
                  sourceChat = chatModels.removeAt(i);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => WhatsAppHome(
                                chatModels: chatModels,
                                sourceChat: sourceChat,
                                onImageSend: widget.onImageSend,
                              )));
                },
                child:
                    ButtonCard(name: chatModels[i].name!, icon: Icons.person),
              )),
    );
  }
}
