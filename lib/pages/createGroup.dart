import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/CustomUI/avatarCard.dart';
import 'package:whatsap_clone/CustomUI/buttonCard.dart';
import 'package:whatsap_clone/CustomUI/contactCard.dart';
import 'package:whatsap_clone/models/chat_models.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CreateGroupState();
  }
}

class _CreateGroupState extends State<CreateGroup>{
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
  List<ChatModel> groups=[];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("New Group",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold)),
            Text("Add Participants",style: TextStyle(fontSize: 13),)
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search,size: 26,),onPressed: () {},),

        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
          itemBuilder: (context,i){
            if(i==0){
              return Container(
              height: groups.length>0?90:10,
              );
    }
            return InkWell(
              onTap: (){
                if(contacts[i-1].select==false){
                  setState((){
                    contacts[i-1].select=true;
                    groups.add(contacts[i-1]);
                  });
                }
                else{
                  setState((){
                    contacts[i-1].select=false;
                    groups.remove(contacts[i-1]);
                  });
                }
              },
                child: ContactCard(contact: contacts[i-1],));
          },
          itemCount: contacts.length+1,
        ),
          groups.length>0?
          Column(
            children: [
              Container(
                height: 75,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: contacts.length,
                    itemBuilder: (context,i) {
                    if(contacts[i].select==true){
                      return InkWell(
                        onTap: () {
                          setState(() {
                            groups.remove(contacts[i]);
                            contacts[i].select=false;
                          });
                        },
                          child: AvatarCard(contact: contacts[i]));
                    }
                    else{
                      return Container();
                    }
                    }
                ),
              ),
              Divider(
                thickness: 1,
              )
            ],
          ):Container()
        ],
      ),
    );
  }

}