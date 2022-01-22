import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsap_clone/pages/cameraView.dart';
import 'package:whatsap_clone/pages/videoView.dart';


List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget{
  const CameraScreen({Key? key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CameraScreenState();
  }

}
class _CameraScreenState extends State<CameraScreen>{
   bool isRecording=false;
   bool flash=false;
   bool cameraFront=true;
   double transform=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController=CameraController(cameras![0], ResolutionPreset.high);
    cameraValue= _cameraController.initialize();
  }
  @override
  void dispose(){
    super.dispose();
    _cameraController.dispose();
  }
  late CameraController _cameraController;
  late Future<void> cameraValue;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
              builder: (context,snapshot) {
              if(snapshot.connectionState==ConnectionState.done){
                return Container(
                  height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: CameraPreview(_cameraController));
              }
              else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(flash? Icons.flash_on:Icons.flash_off,color:Colors.white,size: 28,),
                        onPressed: (){
                          setState(() {
                            flash=!flash;
                          });
                          flash? 
                          _cameraController.setFlashMode(FlashMode.torch):
                          _cameraController.setFlashMode(FlashMode.off);
                        },),
                      GestureDetector(
                        onLongPress: () async {
                          await _cameraController.startVideoRecording();
                          setState(() {
                            isRecording = true;
                          });
                        },
                        onLongPressUp: () async {
                          XFile videopath =
                          await _cameraController.stopVideoRecording();
                          setState(() {
                            isRecording = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => VideoView(
                                    path: videopath.path,
                                  )));
                        },
                        onTap: () {
                          if (!isRecording) takePhoto(context);
                        },
                        child: isRecording
                            ? Icon(
                          Icons.radio_button_on,
                          color: Colors.red,
                          size: 80,
                        )
                            : Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      IconButton(
                        icon: Transform.rotate(
                          angle: transform,
                          child: Icon(Icons.flip_camera_ios,color:Colors.white,size: 28,)),
                          onPressed: () async {
                          setState(() {
                            cameraFront=!cameraFront;
                            transform=transform+pi;
                          });
                          int cameraPos=cameraFront?0:1;
                          _cameraController=CameraController(cameras![cameraPos], ResolutionPreset.high);
                          cameraValue= _cameraController.initialize();
                        },)
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Hold for video, tap for photo",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void takePhoto(BuildContext context) async {

    XFile path= await _cameraController.takePicture();
    Navigator.push(context, MaterialPageRoute(builder: (builder)=>CameraView(path: path.path)));
  }
}