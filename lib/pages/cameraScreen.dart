import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController=CameraController(cameras![0], ResolutionPreset.high);
    cameraValue= _cameraController.initialize();
  }
  late CameraController _cameraController;
  Future<void>? cameraValue;
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
                return CameraPreview(_cameraController);
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
                        icon: Icon(Icons.flash_off,color:Colors.white,size: 28,),
                        onPressed: (){},),
                      InkWell(
                        onTap: (){},
                        child: Icon(Icons.panorama_fish_eye,color:Colors.white,size: 70,),
                      ),
                      IconButton(
                        icon: Icon(Icons.flip_camera_ios,color:Colors.white,size: 28,),
                        onPressed: (){},)
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

}