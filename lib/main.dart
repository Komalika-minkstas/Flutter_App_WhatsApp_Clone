import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/NewScreen/landingScreen.dart';
import 'package:whatsap_clone/pages/cameraScreen.dart';
import 'package:whatsap_clone/pages/loginScreen.dart';
import 'package:whatsap_clone/whatsApp_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "WhatsApp",
      theme: new ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff128C7E),
      ),
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}
