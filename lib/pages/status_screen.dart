import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsap_clone/CustomUI/contactCard.dart';
import 'package:whatsap_clone/models/chat_models.dart';

class StatusScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts=[
      ChatModel(
          name: "Dev Stack",
          status: "A full Stack Developer"
      ),
      ChatModel(
          name: "Dev Stack",
          status: "A full Stack Developer"
      ),
      ChatModel(
          name: "Dev Stack",
          status: "A full Stack Developer"
      ),
      ChatModel(
          name: "Dev Stack",
          status: "A full Stack Developer"
      ),
    ];
    // TODO: implement build
    return Scaffold(
      body: InkWell(
        onTap: () {},
        child: Column(
          children: [
            ListTile(
              leading: Container(
                height: 50,
                width: 50,
                child: Stack(
                  children: [
                    CircleAvatar(
                    radius: 30,
                    child: SvgPicture.asset("assets/person.svg",color: Colors.white,height: 30,width: 30,),
                    backgroundColor: Colors.blueGrey[200],
                  ),
                Positioned(
                    bottom: 0,
                    right: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 11,

                        child: Icon(Icons.add, color: Colors.white,size: 18,)),
                )
                  ]
                ),
              ),

              title: Text(
                "My Status",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                    "Tap to add a status",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  )
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Color(0xfff2efe9),
              width: MediaQuery.of(context).size.width,
              child: Text("Recent Updates",style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff006400)),),
              ),
          ],
        ),
      ),

      floatingActionButton:Padding(
        padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: new Icon(
                        Icons.edit,
                        color: Colors.black87,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 8,),
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).accentColor,
                    child: new Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ]
            ),
          )
      );
  }
}