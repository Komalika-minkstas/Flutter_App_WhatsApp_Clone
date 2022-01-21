import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsap_clone/models/chat_models.dart';


class ButtonCard extends StatelessWidget{
  const ButtonCard({Key? key,required this.name, required this.icon}): super(key: key);
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: Icon(icon,size: 26,color: Colors.white,),
        backgroundColor: Color(0xff25D366),
      ),
      title: Text(name,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      ),
    );
  }

}