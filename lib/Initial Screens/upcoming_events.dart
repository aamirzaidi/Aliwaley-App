import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:aliwaley/addevent_info.dart';
import 'package:aliwaley/advertise_info.dart';

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: UpcomingListGenerator(),
      );
  }
}

class UpcomingListGenerator extends StatelessWidget {
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
      stream: fireStore.collection('upcoming_events').snapshots(),
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
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                Text('Organising an event? ',style: TextStyle(fontFamily: 'Sniglet',fontSize: 18.5),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddEventInfo()));
                    },
                  child: Container(
                    padding: EdgeInsets.only(top:4.0, right:10.0,left: 10.0,bottom: 4.0),
                    child: Text('Tell us',style: TextStyle(fontFamily: 'Sniglet',fontSize: 18.0,color: Colors.white),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.black45,
                    ),
                  ),
                )
                ],
              ),
              SizedBox(height: 4.0,),
              Expanded(
                child: ListView.separated(
                  itemCount: events.length+1,
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
                            var adv = snapshot.data.documents[1];
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
                                    child: AspectRatio(
                                      aspectRatio: 3.0,
                                      child: Image(
                                        fit: BoxFit.scaleDown,
                                        image: NetworkImage(adv.data["imageUrl"]),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }else {
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
                  final time = events[index-1].data['time'];
                  final date = events[index-1].data['date'];
                  final location = events[index-1].data['location'];
                  final eventName = events[index-1].data['event_name'];
                  final locationLink = events[index-1].data['locationLink'] ?? 'Offline';
                  final imageUrl = events[index-1].data['imageUrl'];
                  return UpcomingEventCard(
                    time: time,
                    date: date,
                    location: location,
                    eventName: eventName,
                    locationLink: locationLink,
                    imageUrl: imageUrl,
                  );
                },
                  separatorBuilder: (context, index){
                    if (index != 0 && index % 3 == 0){
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
              ),
            ],
          ),
        );
      },
    );
  }
}

class UpcomingEventCard extends StatelessWidget {
  final eventName;
  final time;
  final date;
  final location;
  final locationLink;
  final imageUrl;
  UpcomingEventCard({this.time,this.location,this.date,this.eventName, this.locationLink,this.imageUrl});

  _launchChannelURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
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
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                        color: Colors.transparent,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('$eventName',style: TextStyle(fontFamily: 'ArefRuqaa',fontWeight: FontWeight.bold,fontSize: 23.0,color: Colors.red),),
                          SizedBox(height: 6.0,),
                          Text('$time',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.blueAccent),),
                          SizedBox(height: 4.0,),
                          Text('$date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,color: Colors.lightBlueAccent),),
                          SizedBox(height: 4.0,),
                          Text('$location',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 15.0),),
                          RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            child: Text( locationLink=='Offline' ? 'Offline':'Go To Link',style: TextStyle(color: locationLink=='Offline' ? Colors.black: Colors.deepOrange), ),
                            onPressed: () async{
                              if(locationLink=='Offline')
                              {}
                              else{
                                _launchChannelURL(locationLink);
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(//for image
                      height: 120.0,
                      child: Image(image: imageUrl == null ?  AssetImage('assets/zulfikar.png'): NetworkImage(imageUrl), fit: BoxFit.scaleDown,) ,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

