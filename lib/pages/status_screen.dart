import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsap_clone/CustomUI/contactCard.dart';
import 'package:whatsap_clone/CustomUI/statusPage/headStatus.dart';
import 'package:whatsap_clone/CustomUI/statusPage/otherStatus.dart';
import 'package:whatsap_clone/models/chat_models.dart';

class StatusScreen extends StatefulWidget {
  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            child: Icon(Icons.camera_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            HeadOwnStatus(),
            label("Recent updates"),
            OtherStatus(
              name: "Karishma",
              time: "01:23",
              imageName: "assets/di.jpg",
              Seen: false,
              statusNum: 1,
            ),
            OtherStatus(
              name: "Shraddha",
              time: "00:50",
              imageName: "assets/shraddha.jpg",
              Seen: false,
              statusNum: 3,
            ),
            OtherStatus(
              name: "Mumma",
              time: "00:45",
              imageName: "assets/mumma.jpeg",
              Seen: false,
              statusNum: 2,
            ),
            OtherStatus(
              name: "Tarun",
              time: "00:10",
              imageName: "assets/tarun.jpg",
              Seen: false,
              statusNum: 4,
            ),
            SizedBox(
              height: 10,
            ),
            label("Viewed updates"),
            OtherStatus(
              name: "Shraddha",
              time: "00:50",
              imageName: "assets/shraddha.jpg",
              Seen: true,
              statusNum: 3,
            ),
            OtherStatus(
              name: "Mumma",
              time: "00:45",
              imageName: "assets/mumma.jpeg",
              Seen: true,
              statusNum: 3,
            ),
            OtherStatus(
              name: "Tarun",
              time: "00:10",
              imageName: "assets/tarun.jpg",
              Seen: true,
              statusNum: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String labelName) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          labelName,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
