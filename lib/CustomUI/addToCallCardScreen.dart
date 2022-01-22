import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsap_clone/models/chat_models.dart';


class AddtoCallScreenCard extends StatelessWidget{
  const AddtoCallScreenCard({Key? key,required this.contact}): super(key: key);
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        child: CircleAvatar(
          radius: 23,
          child: SvgPicture.asset("assets/person.svg",color: Colors.white,height: 30,width: 30,),
          backgroundColor: Colors.blueGrey[200],
        ),
      ),
      title: Text(contact.name!,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      ),
      subtitle: Text(contact.status!,
        style: TextStyle(
            fontSize: 13
        ),),
      trailing:
      Row(
          mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.call,color: Colors.teal,)),
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam,color: Colors.teal,)),
        ],
      ),

    );
  }
}