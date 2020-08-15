import 'package:flutter/material.dart';
import 'package:aliwaley/video_list_generator.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ListVideos extends StatelessWidget {
  final name;
  final urlList;
  ListVideos({this.name,this.urlList});
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
        child: VideoListGenerator(urlList: urlList,)
      ),
    );
  }
}
