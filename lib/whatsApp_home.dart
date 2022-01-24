import 'package:flutter/material.dart';
import 'package:whatsap_clone/pages/call_screen.dart';
import 'package:whatsap_clone/pages/camera_screen.dart';
import 'package:whatsap_clone/pages/chat_screen.dart';
import 'package:whatsap_clone/pages/selectContact.dart';
import 'package:whatsap_clone/pages/status_screen.dart';
import 'package:http/http.dart' as http;

import 'models/chat_models.dart';

class WhatsAppHome extends StatefulWidget {
  WhatsAppHome(
      {Key? key,
      required this.chatModels,
      required this.sourceChat,
      required this.onImageSend})
      : super(key: key);
  final List<ChatModel> chatModels;
  final ChatModel sourceChat;
  final Function onImageSend;
  @override
  State<StatefulWidget> createState() => new _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  void onImageSend(String path) async {
    print("Hey there $path");
    var request = http.MultipartRequest(
        "POST", Uri.parse("http://192.168.29.130:5000 /routes/addimage"));
    request.files.add(await http.MultipartFile.fromPath("img", path));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
    });
    http.StreamedResponse response = await request
        .send(); //type of response we get whle callng API -Streamed Response
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: "CHATS"),
            new Tab(text: "STATUS"),
            new Tab(text: "CALLS"),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(child: Text("New Group"), value: "New Group"),
              PopupMenuItem(
                  child: Text("New broadcast"), value: "New broadcast"),
              PopupMenuItem(child: Text("WhatsApp Web"), value: "WhatsApp Web"),
              PopupMenuItem(
                  child: Text("Starred Messages"), value: "Starred Messages"),
              PopupMenuItem(child: Text("Settings"), value: "Settings"),
            ];
          })
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraPage(),
          new ChatScreen(
            chatModels: widget.chatModels,
            sourceChat: widget.sourceChat,
          ),
          new StatusScreen(),
          new CallScreen(),
        ],
      ),
    );
  }
}
