import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/CustomUI/buttonCard.dart';
import 'package:whatsap_clone/CustomUI/contactCard.dart';
import 'package:whatsap_clone/models/chat_models.dart';
import 'package:whatsap_clone/pages/createGroup.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SelectContactState();
  }
}

class _SelectContactState extends State<SelectContact>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Select Contact",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold)),
            Text("256 contacts",style: TextStyle(fontSize: 13),)
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search,size: 26,),onPressed: () {},),
          PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(child: Text("Invite a friend"),value: "Invite a friend"),
                  PopupMenuItem(child: Text("Contacts"),value: "Contacts"),
                  PopupMenuItem(child: Text("Refresh"),value: "Refresh"),
                  PopupMenuItem(child: Text("Help"),value: "Help"),
                ];
              })
        ],
      ),
      body: ListView.builder(
          itemBuilder: (context,i){
            if(i==0){
              return InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (builder)=>CreateGroup()));
                },
                  child: ButtonCard(icon: Icons.group,name: "New group"));
            }
            if(i==1){
              return ButtonCard(icon: Icons.person_add,name: "New contact");
            }
            return ContactCard(contact: contacts[i-2],);
          },
          itemCount: contacts.length+2,
      ),
    );
  }
  
}