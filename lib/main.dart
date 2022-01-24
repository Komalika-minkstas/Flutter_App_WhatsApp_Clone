import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/NewScreen/landingScreen.dart';
import 'package:whatsap_clone/pages/cameraScreen.dart';
import 'package:whatsap_clone/pages/loginScreen.dart';
import 'package:whatsap_clone/whatsApp_home.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(new MyApp());
}

void onImageSend(String path) async {
  print("Hey there $path");
  var request = http.MultipartRequest(
      "POST", Uri.parse("http://192.168.29.130:5000/routes/addimage"));
  request.files.add(await http.MultipartFile.fromPath("img", path));
  request.headers.addAll({
    "Content-type": "multipart/form-data",
  });
  http.StreamedResponse response = await request
      .send(); //type of response we get whle callng API -Streamed Response
  print(response.statusCode);
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
      home: LoginScreen(
        onImageSend: onImageSend,
      ),
    );
  }
}
