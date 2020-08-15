import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:social_share/social_share.dart';

class VideoPage extends StatefulWidget {
  final videoURL;
  final title;
  final channelName;
  final authorURL;
  final isLive;
  VideoPage({this.videoURL,this.title,this.channelName,this.isLive,this.authorURL});

  @override
  _VideoPageState createState() => _VideoPageState();
}
class _VideoPageState extends State<VideoPage> {
  YoutubePlayerController _controller;

  void runYoutubePlayer(){
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL),
      flags: YoutubePlayerFlags(
        isLive: widget.isLive,
        enableCaption: false,
        autoPlay: false,
      )
    );
  }

  _launchChannelURL() async {
    final url = widget.authorURL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchVideoURL() async {
    final url = widget.videoURL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  void initState() {
    super.initState();
    runYoutubePlayer();
  }
  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
          controller: _controller,
      ),
        builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar:  AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Ionicons.ios_arrow_back,color: Colors.white, size: 30.0,),
              onPressed: (){
                SystemChrome.setPreferredOrientations(DeviceOrientation.values);
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0),bottomRight: Radius.circular(0.0))),
            title: Text('Ali Waley',style: TextStyle(fontFamily: 'Merienda',fontSize: 30.0,fontWeight: FontWeight.bold),),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(0.0),topLeft: Radius.circular(0.0), )),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    player,
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(45.0),bottomLeft: Radius.circular(45.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(child: Text(widget.title,style: TextStyle(fontFamily: 'ReemKufi',color: Colors.white,fontSize: 20.0),)),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Text('From ${widget.channelName}',style: TextStyle(fontFamily: 'ReemKufi',color: Colors.black,fontSize: 20.0),),
                    ),
                    RaisedButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Subscribe on Youtube ',style: TextStyle(fontSize: 15.0),),
                          Icon(FontAwesome.youtube_play),
                        ],
                      ),
                      onPressed: (){
                        _launchChannelURL();
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Facing trouble?',style: TextStyle(fontSize: 20.0,fontFamily: 'ReemKufi',),),
                    RaisedButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Watch on Youtube '),
                          Icon(FontAwesome.youtube_play),
                        ],
                      ),
                      onPressed: (){
                        _launchVideoURL();
                      },
                    ),
                    SizedBox(height: 15.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        GestureDetector(
                            onTap: ()async{
                              SocialShare.shareOptions("Download Aliwaley App from Playstore \n${widget.title} \n ${widget.videoURL}",);
                            },
                            child: Text('Share',style: TextStyle(fontFamily: 'Jaldi',fontWeight: FontWeight.bold,color: Colors.blueGrey,fontSize: 23.0),)),
                        SizedBox(width: 10.0,),
                        GestureDetector(
                            onTap: ()async{
                              SocialShare.shareWhatsapp(
                                  "Download Aliwaley App from Playstore \n${widget.title} \n${widget.videoURL}")
                                  .then((data) {
                                print(data);
                              });
                            },
                            child: Icon(FontAwesome.whatsapp,color: Colors.green,)),
                        IconButton(
                          icon: Icon(Entypo.info_with_circle,color: Colors.blue,),
                          onPressed: (){
                            showModalBottomSheet(context: context, builder: (BuildContext context)
                            {
                             return Container(
                               height: 160.0,
                               color: Colors.black87,
                               width: double.infinity,
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   child: SingleChildScrollView(
                                     child: Text('This video is run using the youtube API services. Autoplay and background play are disabled as per youtube API guideleines.\nIf you own the youtube channel, any view count from here will be updated on youtube also.\nHowever,if you still have issues with your video being here, contact us and we will remove it from the app.\nThank you.'
                                     ,style: TextStyle(color: Colors.white,fontFamily: 'Sniglet',fontSize: 15.0),),
                                   ),
                                 ),
                               ),
                             );
                            }
                            );
                          },
                        )
                      ],
                    ),

                  ],
                ),
          ),
        );
        }
    );
  }
}