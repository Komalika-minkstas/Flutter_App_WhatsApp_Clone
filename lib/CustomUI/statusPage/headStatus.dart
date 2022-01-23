import 'package:flutter/material.dart';

class HeadOwnStatus extends StatelessWidget {
  HeadOwnStatus({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/Sonal.jpg"),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.greenAccent,
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      title: Text(
        "My status",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        "Tap to add a status",
        style: TextStyle(fontSize: 13, color: Colors.grey[900]),
      ),
    );
  }
}
