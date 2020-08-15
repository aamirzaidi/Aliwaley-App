import 'package:aliwaley/collections/nohe/nohe_card.dart';
import 'package:aliwaley/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:aliwaley/collections/collections_url.dart';
import 'package:aliwaley/video_player/video_data.dart';
import 'package:aliwaley/video_player/video_page.dart';

void sendVideoData(String url, BuildContext context)async{
  try{
    var jsonData = await VideoData(userUrl: url).getDetail();
    String videoTitle = jsonData["title"];
    String channelName = jsonData["author_name"];
    String authorURL =  jsonData["author_url"];
    String videoURL =  url;
    Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPage(
      videoURL: videoURL,
      title: videoTitle,
      channelName: channelName,
      authorURL: authorURL,
      isLive: false,
    )));
  }catch(e){
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Some Error occured'),));
  }
}

List<Widget> getTiles(BuildContext context, List<String> listUrls,List<String> listNames){
  List<Widget> listTiles = [];
  for(var index =0; index<listUrls.length;index++){
    listTiles.add(ListTile(
      title: Text(listNames[index], style: TextStyle(color: secondoryColor),),
      onTap: (){
        sendVideoData(listUrls[index], context);
      },
    ));
  }
  return listTiles;
}

class NoheKhanProfiles extends StatelessWidget {
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
        title: Text('Profiles'),
        bottom: PreferredSize(preferredSize: Size.fromHeight(10.0), child: Container(),),
      ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
          ),
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NoheCard(name: 'Nadeem Sarwar',image:'assets/nadeem.jpg',
                      spotifyUrl: 'https://open.spotify.com/artist/4n1Lkjq6mDmuro1j3h3YEs?autoplay=true',
                      youtubeUrl: 'https://www.youtube.com/channel/UC2kCC6CFwU3cZFJl9e_FJlQ',
                      expandedTiles: <Widget>[
                        ExpansionTile(
                          title: Text('2019', style: TextStyle(color: secondoryColor),),
                          children: getTiles(context, naddemSarwar2019_Urls,nadeemSarwar2019_Names),
                        ),
                        ExpansionTile(
                          title: Text('2018' , style: TextStyle(color: secondoryColor),),
                          children: getTiles(context, naddemSarwar2018_Urls, nadeemSarwar2018_Names),
                        ),
                        ExpansionTile(
                          title: Text('2017' , style: TextStyle(color: secondoryColor),),
                          children: getTiles(context, nadeemSarwar2017_Urls, nadeemSarwar2017_Names),
                        ),
                        ExpansionTile(
                          title: Text('2016' , style: TextStyle(color: secondoryColor),),
                          children: getTiles(context, nadeemSarwar2016_Urls, nadeemSarwar2016_Names),
                        ),
                        ExpansionTile(
                          title: Text('2015' , style: TextStyle(color: secondoryColor),),
                          children: getTiles(context, nadeemSarwar2015_Urls, nadeemSarwar2015_Names),
                        ),

                      ]
                  ),//Nadeem Sarwar
                  NoheCard(name: 'Farhan Ali Waris',image: 'assets/farhan.jpg',
                    spotifyUrl: 'https://open.spotify.com/artist/0GExDLTku55jr7DeXwcGqW?autoplay=true',
                    youtubeUrl: 'https://www.youtube.com/channel/UC7o6_9PaatOjXSjN7kCdsww',
                    expandedTiles: <Widget>[
                      ExpansionTile(
                        title: Text('Manqabat 2020'),
                        children: getTiles(context, farhanAliWaris_Manqabat2020Urls,farhanAliWaris_Manqabat2020Names),
                      ),
                      ExpansionTile(
                        title: Text('Nohe 2020'),
                        children: getTiles(context, farhanAliWaris_Nohe2020Urls,farhanAliWaris_Nohe2020Names),
                      ),
                      ExpansionTile(
                        title: Text('Nohe 2019'),
                        children: getTiles(context, farhanAliWaris_Nohe2019Urls,farhanAliWaris_Nohe2019Names),
                      ),
                    ],
                  ),
                  NoheCard(name: 'Mir Hasan Mir', image: 'assets/mirhasan.jpg',
                      spotifyUrl: 'https://open.spotify.com/artist/0ApeLYMnXgzWgg4biedrTs?autoplay=true',
                      youtubeUrl: 'https://www.youtube.com/channel/UC_qRtpijKZ-iipmWYCndLrA',
                      expandedTiles: <Widget>[
                        ExpansionTile(
                          title: Text('Nohe 2020'),
                          children: getTiles(context, mirhasanNohe_2020Urls,mirhasanNohe_2020Names),
                        ),
                        ExpansionTile(
                          title: Text('Manqabat 2020'),
                          children: getTiles(context, mirhasanManqabat__2020Urls,mirhasanManqabat__2020Names),
                        ),
                        ExpansionTile(
                          title: Text('Nohe 2019'),
                          children: getTiles(context, mirhasanNohe_2019Urls,mirhasanNohe_2019Names),
                        ),
                        ExpansionTile(
                          title: Text('Manqabat 2019'),
                          children: getTiles(context, mirhasanManqabat_2019Urls,mirhasanManqabat_2019Names),
                        )
                      ]),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NoheCard(
                    name: 'Shadman Raza',image: 'assets/shadmanraza.jpg',
                    spotifyUrl: 'https://open.spotify.com/artist/2yr1tWhtQbXAufFFiIptpq?autoplay=true',
                    youtubeUrl: 'https://www.youtube.com/channel/UCK0dVsshzzDsa6jl6c0bvWw',
                    expandedTiles: <Widget>[
                      ExpansionTile(
                        title: Text('Nohe 2019'),
                        children: getTiles(context, shadmanRaza_2019NoheUrl,shadmanRaza_2019NoheNames),
                      ),
                      ExpansionTile(
                        title: Text('Nohe 2018'),
                        children: getTiles(context, shadmanRaza_2018NoheUrl,shadmanRaza_2018NoheNames),
                      ),

                    ],
                  ),
                  NoheCard(name: 'Mesum Abbas',image: 'assets/mesum.jpg',
                    spotifyUrl: 'https://open.spotify.com/artist/53pfcaa4u4fEOlh9KV6VCq?autoplay=true',
                    youtubeUrl: 'https://www.youtube.com/channel/UCL5nRC6B1hTJIIzkselavTQ',
                    expandedTiles: <Widget>[
                      ExpansionTile(
                        title: Text('Nohe 2020'),
                        children: getTiles(context, mesumAbbasNohe_2020Urls,mesumAbbasNohe_2020Names),
                      ),
                      ExpansionTile(
                        title: Text('Nohe 2019'),
                        children: getTiles(context, mesumAbbasNohe_2019Urls,mesumAbbasNohe_2019Names),
                      ),
                      ExpansionTile(
                        title: Text('Nohe 2018'),
                        children: getTiles(context, mesumAbbasNohe_2018Urls,mesumAbbasNohe_2018Names),
                      ),
                      ExpansionTile(
                        title: Text('Nohe 2017'),
                        children: getTiles(context, mesumAbbasNohe_2017Urls,mesumAbbasNohe_2017Names),
                      )
                    ],),
                  NoheCard(name: 'Syed Raza Abbas',image: 'assets/syedrazaabbaszaidi.jpg',
                    spotifyUrl: 'https://open.spotify.com/artist/0e3HxI3XNymGT0Fu1KCmPU?autoplay=true',
                    youtubeUrl: 'https://www.youtube.com/channel/UCo_vF_Hjw4NV0mEixbeRgew',
                    expandedTiles: <Widget>[
                      ExpansionTile(
                        title: Text('Manqabat 2020'),
                        children: getTiles(context, syedRazaAbbasZaidi_manqabat2020_Urls,syedRazaAbbasZaidi_manqabat2020_Names),
                      ),
                      ExpansionTile(
                        title: Text('Nohe 2019'),
                        children: getTiles(context, syedRazaAbbasZaidi_Nohe2019_Urls,syedRazaAbbasZaidi_Nohe2019_Names),
                      ),
                      ExpansionTile(
                        title: Text('Manqabat 2019'),
                        children: getTiles(context, syedRazaAbbasZaidi_manqabat2019_Urls,syedRazaAbbasZaidi_manqabat2019_Names),
                      ),
                      ExpansionTile(
                        title: Text('Nohe 2018'),
                        children: getTiles(context, syedRazaAbbasZaidi_Nohe2018_Urls,syedRazaAbbasZaidi_Nohe2018_Names),
                      ),
                    ],),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NoheCard(name: 'Irfan Haider', image: 'assets/irfanhaider.jpg',
                    spotifyUrl: 'https://open.spotify.com/artist/3QzQ1knoElghoU5Y1wS3vA?autoplay=true',
                    youtubeUrl: 'https://www.youtube.com/channel/UCyuXnbyfx_cUN8Cf-Sp9f3A',
                    expandedTiles: <Widget>[
                      ExpansionTile(
                        title: Text('Nohe 2020'),
                        children: getTiles(context, irfanHaider_Nohe2020Urls,irfanHaider_Nohe2020Names),
                      ),
                    ],
                  ),
                  NoheCard(
                    name: 'Ali Safdar',image: 'assets/alisafdar.jpg',
                    spotifyUrl: 'https://open.spotify.com/artist/1E4MFADWYDrUjRE7fdvw9P?autoplay=true',
                    youtubeUrl: 'https://www.youtube.com/channel/UCpQwwkXn2p76KUvI1PySjNw',
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}