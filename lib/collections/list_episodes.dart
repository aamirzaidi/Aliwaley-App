import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:aliwaley/video_player/video_page.dart';
import 'package:aliwaley/video_player/video_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListEpisodes extends StatelessWidget {
  final name;
  final episodesList;
  final type;
  ListEpisodes({this.name,this.episodesList,this.type });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Ionicons.ios_arrow_back,color: Colors.white, size: 30.0,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text('Ali Waley',style: TextStyle(fontFamily: 'Merienda',fontSize: 30.0,fontWeight: FontWeight.bold),),
        bottom: PreferredSize(preferredSize: Size.fromHeight(44.0),
          child: Text(name,style: TextStyle(fontFamily: 'Jaldi',fontSize: 30.0,color: Colors.white),),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(30.0) )),
        child: ListView.builder(itemBuilder: (context, index){
          return ListTile(
            onTap: ()async{
              Fluttertoast.showToast(
                msg: "Loading...",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16.0,
              );
              var jsonData = await VideoData(userUrl: episodesList[index]).getDetail();
              String videoTitle = jsonData["title"];
              String channelName = jsonData["author_name"];
              String authorURL =  jsonData["author_url"];
              String videoURL =  episodesList[index];
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
            leading: Icon(AntDesign.play, color: Colors.black,),
            title: Text('$type ${index+1}',style: TextStyle(fontSize: 22.0),),
          );
        },itemCount: episodesList.length,),
      ),
    );
  }
}
