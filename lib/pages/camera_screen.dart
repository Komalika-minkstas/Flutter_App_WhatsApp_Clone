import 'package:flutter/material.dart';
import 'package:whatsap_clone/pages/cameraScreen.dart';
import 'package:http/http.dart' as http;

class CameraPage extends StatelessWidget {
  const CameraPage({
    Key? key,
  }) : super(key: key);

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
    return CameraScreen(
      onImageSend: onImageSend,
    );
  }
}
