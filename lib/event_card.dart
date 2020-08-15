import 'package:flutter/material.dart';
import 'video_player/video_page.dart';

class EventCard extends StatelessWidget {
  final videoURL;
  final thumbnailURL;
  final videoTitle;
  final channelName;
  final islive;
  final authorURL;
  EventCard({this.videoURL,this.channelName,this.videoTitle,this.thumbnailURL,this.islive = false,this.authorURL});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return VideoPage(
                videoURL: videoURL,
                title: videoTitle,
                channelName: channelName,
                isLive: islive,
                authorURL: authorURL,
            );
          }));
        },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
            elevation: 6.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 8.0, right:8.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(videoTitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                            SizedBox(height: 10.0,),
                            Text('From $channelName',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Merienda',fontSize: 14.0),),
                            SizedBox(height: 6.0,),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(//for image
                        height: 130.0,
                        child: Image(image: NetworkImage(thumbnailURL)),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black12),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
