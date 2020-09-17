import 'package:aliwaley/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:aliwaley/constants.dart';

class NoheKhanPage extends StatelessWidget {
  final name;
  final image;
  final expandedTiles;
  final spotifyUrl;
  final youtubeUrl;
  NoheKhanPage({@required this.name, this.image = 'assets/zulfikar.png', this.expandedTiles, this.spotifyUrl, this.youtubeUrl });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 10.0,
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Ionicons.ios_arrow_back,color: Colors.white, size: 30.0,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('$name'),
        bottom: PreferredSize(preferredSize: Size.fromHeight(10.0), child: Container(),),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top : 12.0, left: 6.0, right :6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: name,
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                    maxRadius: 100.0,
                ),
              ),
              SizedBox(height: 20.0,),
              (spotifyUrl != null && youtubeUrl != null )? Text('Listen On:', style: TextStyle(fontSize: 22.0,color: Colors.blueGrey ,fontFamily: 'Gilroy',fontWeight: FontWeight.bold),) : SizedBox(height: 0,width: 0,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      spotifyUrl != null ? Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: IconButton(icon: Icon(Entypo.spotify,color: Colors.green,size: 30.0,),
                        onPressed: (){
                          launchURL(spotifyUrl);
                        },
                        ),
                      ) : SizedBox(width: 0,height: 0,),
                      spotifyUrl != null ? Text('Spotify',style: TextStyle(color: Colors.black54,fontFamily: 'Sniglet',fontSize: 12.5),)
                      : SizedBox(width: 0,height: 0,),
                    ],
                  ),
                  Column(
                    children: [
                      youtubeUrl != null ? Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: IconButton(icon: Icon(AntDesign.youtube,color: Colors.red,size: 30.0,),
                          onPressed: (){
                          launchURL(youtubeUrl);
                          },
                        ),
                      ): SizedBox(width: 0,height: 0,),
                      spotifyUrl != null ? Text('Youtube',style: TextStyle(color: Colors.black54,fontFamily: 'Sniglet',fontSize: 12.5),)
                          : SizedBox(width: 0,height: 0,),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Expanded(
                child: expandedTiles!=null ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: ListView(
                    children: expandedTiles
                  ),
                ) : Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Center(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Updating Soon!',style: TextStyle(color: Colors.grey,fontSize: 17.0),),
                      Text('Check for update',style: TextStyle(color: Colors.grey,fontSize: 16.0),),
                    ],
                  )
                ),
              ),
              ),],
          ),
        ),
      )
    );
  }
}
