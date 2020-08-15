import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'video_player/video_page.dart';

class TrendingEventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return VideoPage();
          }));
        },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Card(
            elevation: 6.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.white,
              ),
              height: 240.0,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      height: 140.0,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blueGrey,),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Timing',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('Place',style: TextStyle(fontWeight: FontWeight.bold),),
                              Row(
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text('Share ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey,fontSize: 20.0),),
                                  Icon(FontAwesome.whatsapp,color: Colors.green,),
                                  Icon(SimpleLineIcons.social_facebook,color: Color(0xFF4267B2),),
                                  Icon(FontAwesome.telegram,color: Color(0xFF30A7DB),),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              RaisedButton(
//                          padding: EdgeInsets.all(0.0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text('Watch ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                    Icon(Icons.remove_red_eye,color: Colors.black,)
                                  ],
                                ),
                                onPressed: (){},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                ),
              ),
            ),
        ),),
    );
  }
}
