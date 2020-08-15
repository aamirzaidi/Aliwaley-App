import 'package:flutter/material.dart';
import 'package:aliwaley/video_player/video_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aliwaley/video_player/video_page.dart';
import 'package:aliwaley/constants.dart';

class DocumentaryCard extends StatelessWidget {
  final name;
  final image;
  final url;
  DocumentaryCard({this.name,this.image,this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        Fluttertoast.showToast(
          msg: "Loading...",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0,
        );
        var jsonData = await VideoData(userUrl: url).getDetail();
        String videoTitle = jsonData["title"];
        String channelName = jsonData["author_name"];
        String authorURL =  jsonData["author_url"];
        String videoURL =  url;
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return VideoPage(
            videoURL: videoURL,
            title: videoTitle,
            channelName: channelName,
            authorURL: authorURL,
            isLive: false,
          );
        }));



      },
      child: Padding(
        padding: EdgeInsets.only(right: 3.0),
        child: Card(
          elevation: 4.0,
          color: primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
          child: Container(
            height: 120.0,
            width: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    height: 100.0,
                    width: double.infinity,
                    child: Image(image: image ?? AssetImage('assets/zulfikar.png'),),
                  ),
                  Flexible(child: Text(' $name',style: TextStyle(fontFamily: 'Jaldi',fontSize: 18.0,color: secondoryColor),)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


