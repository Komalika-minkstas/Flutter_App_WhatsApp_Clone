
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/CustomUI/ReplyCard.dart';
import 'package:whatsap_clone/CustomUI/ownMessageCard.dart';
import 'package:whatsap_clone/models/chat_models.dart';


class IndividualPage extends StatefulWidget{
  IndividualPage({Key? key, required this.chatModel}): super(key: key);
  final ChatModel chatModel;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _IndividualPageState();
  }

}
class _IndividualPageState extends State<IndividualPage>{
  bool show=false;
  FocusNode focusNode=FocusNode();
  TextEditingController _controller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        setState((){
          show=false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Image.asset("assets/whatsapp_bac.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 70.0,
            titleSpacing: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back,size: 24),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: new NetworkImage(widget.chatModel.avatarUrl!),
                  )
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.chatModel.name!,style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold
                    )),
                    Text("last seen today at 12:05",style: TextStyle(
                      fontSize: 13,
                    ))
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.videocam)
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.call)
              ),
              PopupMenuButton<String>(
                  onSelected: (value){
                    print(value);
                  },
                  itemBuilder: (BuildContext context){
                    return [
                      PopupMenuItem(child: Text("View contact"),value: "View contact"),
                      PopupMenuItem(child: Text("Media,links and docs"),value: "Media,links and docs"),
                      PopupMenuItem(child: Text("Search"),value: "Search"),
                      PopupMenuItem(child: Text("Mute Notifications"),value: "Mute Notifications"),
                      PopupMenuItem(child: Text("Wallpaper"),value: "Wallpaper"),
                    ];
                  })
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height-140,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end ,
                          children: [
                            Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-60,
                            child: Card(
                              margin: EdgeInsets.only(left: 2,right: 2,bottom: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  controller: _controller,
                                  focusNode: focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type a message",
                                    prefixIcon: IconButton(
                                      icon: Icon(Icons.emoji_emotions_outlined),
                                      onPressed: () {
                                        if(!show){
                                          focusNode.unfocus();
                                          focusNode.canRequestFocus=false;
                                        }
                                        setState(){
                                          show=!show;
                                        }
                                      },
                                    ) ,
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.attach_file),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                backgroundColor: Colors.transparent,
                                                context: context,
                                                builder: (builder) => bottomsheet());
                                            }
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.camera_alt))
                                      ],
                                    ),
                                    contentPadding: EdgeInsets.all(5)
                                  ),
                                )
                            )

                          ),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0,right: 5.0,left: 2),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Color(0xff128C7E),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.mic,color: Colors.white),
                                    ),
                                  )
                              )
                        ],
                      ),
                           show? emojiSelect():Container(),
                ],
                  ),
                  ),
                ],
              ),
              onWillPop: (){
                if(show){
                  setState((){
                    show=false;
                  });
                }
                else{
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }
  Widget bottomsheet(){
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.insert_drive_file,Colors.indigo,"Document"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.camera_alt,Colors.pink,"Camera"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.insert_photo,Colors.purple,"Gallery"),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset,Colors.orange,"Audio"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.location_pin,Colors.green,"Location"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.person,Colors.blue,"Contact"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget iconcreation(IconData icon,Color color,String text){
    return InkWell (
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5,),
          Text(text,style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
  Widget emojiSelect() {
    return EmojiPicker(
        onEmojiSelected: (emoji, category) {
          print(emoji);
          setState(() {
            var emoji;
            _controller.text = _controller.text + emoji.emoji;
          });
        });
  }
}