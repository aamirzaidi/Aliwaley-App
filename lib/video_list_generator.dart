import 'package:flutter/material.dart';
import 'event_card.dart';
import 'video_player/video_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class VideoListGenerator extends StatefulWidget {
  final urlList;
  VideoListGenerator({this.urlList});

  @override
  _VideoListGeneratorState createState() => _VideoListGeneratorState();
}

class _VideoListGeneratorState extends State<VideoListGenerator> {
  Future myFuture;

  List<EventCard> listEvents=[];
  Future<EventCard> fillVideoDetails() async {
    for (var url in widget.urlList) {
      var jsonData = await VideoData(userUrl: url).getDetail();
      if(jsonData!=null){
        listEvents.add(
            EventCard(
              videoTitle: jsonData["title"],
              channelName: jsonData["author_name"],
              thumbnailURL: jsonData["thumbnail_url"],
              authorURL: jsonData["author_url"],
              videoURL: url,
            ));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    myFuture = fillVideoDetails();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: myFuture,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          if(snapshot.hasError){
            return Center(child: Text('Something Went Wrong'),);
          }
          return Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 6.0,top : 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 4.0,),
                Expanded(
                  child: ListView.builder(
                      itemCount: widget.urlList.length,
                    itemBuilder: (context, index){
                    return listEvents[index];
                  },
                ),
                ),],
            ),
          );
        }else{
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(child: SpinKitFadingCircle(
                color: Colors.orange,
                size: 40.0,
              )),
              SizedBox(height: 15.0,),
              Text('"Allah Ta’ala Sabr Karne Walon Ke Sath Hai"\n-Al Baqarah V.153', style: TextStyle(color: Colors.black, fontSize: 16.0,fontFamily: 'Merienda'),)
            ],
          );
        }
      },
    );
      }
}