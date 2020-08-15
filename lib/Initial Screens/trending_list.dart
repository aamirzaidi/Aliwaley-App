import 'package:aliwaley/advertise_info.dart';
import 'package:aliwaley/event_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:admob_flutter/admob_flutter.dart';
//import 'package:aliwaley/admob_service.dart';


class Trending extends StatelessWidget {
  static const String id = 'trending';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: double.infinity,
      child: TrendingListGenerator(),
    );
  }
}

class TrendingListGenerator extends StatelessWidget {
  final fireStore=Firestore.instance;

  _launchAdvertisementURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: fireStore.collection('trending_events').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData){
          return Container(child: SpinKitFadingCircle(
            color: Colors.orange,
            size: 40.0,
          ));
        }
        if(snapshot.hasError){
          return Center(child: Text('Something Wrong'),);
        }
        final events = snapshot.data.documents;
        if(events.length==0){
          return Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(child: Text('No Events!!', style: TextStyle(fontSize: 30.0, fontFamily: 'Merienda',),),),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0,),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 4.0,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0, right: 6.0,top : 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(height: 4.0,),
                      Expanded(
                        child: ListView.separated(
                          itemCount: events.length + 1 ,
                          itemBuilder: (context, index){
                            if(index == 0){
                              return StreamBuilder<QuerySnapshot>(
                                stream: fireStore.collection('advertise').snapshots(),
                                builder: (BuildContext context, AsyncSnapshot snapshot){
                                  if(!snapshot.hasData){
                                    return Container(child: SpinKitChasingDots(
                                      color: Colors.orange,
                                      size: 40.0,
                                    ));
                                  }
                                  if(snapshot.hasError){
                                    return Center(child: Text('Something Wrong'),);
                                  }
                                  try{
                                    var adv = snapshot.data.documents[0];
                                    if ((adv!=null && adv.data["imageUrl"] != null)) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top:4.0,bottom:4.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            if(adv.data["adUrl"] == null){
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => AdvertiseInfo()));
                                            }
                                            else{
                                              _launchAdvertisementURL(adv.data["adUrl"]);
                                            }
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            height: 100.0,
                                            width: double.infinity,
                                            child: Image(
                                              fit: BoxFit.scaleDown,
                                              image: NetworkImage(adv.data["imageUrl"]),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Divider(
                                        thickness: 0.0,
                                        height: 0.0,
                                        color: Colors.transparent,
                                      );
                                    }
                                  }catch(error){
                                    print(error);
                                    return Divider(
                                      thickness: 0.0,
                                      height: 0.0,
                                      color: Colors.transparent,
                                    );
                                  }
                                },
                              );
                            }
                            return EventCard(
                              videoURL: events[index-1].data["videoUrl"],
                              channelName: events[index-1].data["channelName"],
                              authorURL: events[index-1].data["authorUrl"],
                              videoTitle: events[index-1].data["title"],
                              thumbnailURL: events[index-1].data["thumbnailUrl"],
                            );
                          },
                          separatorBuilder: (context, index){
                            if (index != 0 && index % 4 == 0){
                              return AdmobBanner(
                                adUnitId: 'ca-app-pub-8718878643967075/2315099230',
                                adSize: AdmobBannerSize.BANNER,
                              );
                            }
                            return Divider(
                              thickness: 0.0,
                              height: 0.0,
                              color: Colors.transparent,
                            );
                          },
                        ),
                      ),],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}