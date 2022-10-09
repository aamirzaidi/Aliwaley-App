import 'package:aliwaley/collections/collections_url.dart';
import 'package:aliwaley/collections/documentaries/list_videos.dart';
import 'package:aliwaley/collections/nohe/nohe_khan_profiles.dart';
import 'package:aliwaley/collections/nohe/nohe_card.dart';
import 'package:flutter/material.dart';
import 'package:aliwaley/collections/series_card.dart';
import 'package:aliwaley/constants.dart';
import 'package:aliwaley/collections/documentary_card.dart';
class CollectionsWidget extends StatelessWidget {
  const CollectionsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(' Nohe & Manqabat',style: TextStyle(fontFamily: 'Gilroy',fontSize: 23.0,color: secondoryColor)),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NoheKhanProfiles()));
                    },
                    child: Text('View All',style: TextStyle(fontFamily: 'Sniglet',fontSize: 19.0,color: secondoryColor))),
              ],
            ),
            Container(
              height: 150.0,
              width: double.infinity,
              color: Colors.transparent,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  NoheCard(name: 'Nadeem Sarwar',image:'assets/nadeem.jpg',
                    spotifyUrl: 'https://open.spotify.com/artist/4n1Lkjq6mDmuro1j3h3YEs?autoplay=true',
                    youtubeUrl: 'https://www.youtube.com/channel/UC2kCC6CFwU3cZFJl9e_FJlQ',
                    expandedTiles: <Widget>[
                      ExpansionTile(
                        title: Text('2020', style: TextStyle(color: secondoryColor),),
                        children: getTiles(context, naddemSarwar2020_Urls,nadeemSarwar2020_Names),
                      ),
                      ExpansionTile(
                        title: Text('2019'),
                        children: getTiles(context, naddemSarwar2019_Urls,nadeemSarwar2019_Names),
                      ),
                      ExpansionTile(
                        title: Text('2018'),
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
                    ],),
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
                      ExpansionTile(
                        title: Text('Nohe 2018'),
                        children: getTiles(context, farhanAliWaris_Nohe2018Urls,farhanAliWaris_Nohe2018Names),
                      ),
                      ExpansionTile(
                        title: Text('Nohe 2017'),
                        children: getTiles(context, farhanAliWaris_Nohe2017Urls,farhanAliWaris_Nohe2017Names),
                      ),
                    ],),
                  NoheCard(name: 'Mir Hasan Mir',image: 'assets/mirhasan.jpg',
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
                      ),
                      ExpansionTile(
                        title: Text('Nohe 2018'),
                        children: getTiles(context, mirhasanNohe_2018Urls,mirhasanNohe_2018Names),
                      ),
                      ExpansionTile(
                        title: Text('Manqabat 2018'),
                        children: getTiles(context, mirhasanManqabat_2018Urls,mirhasanManqabat_2018Names),
                      ),
                      ExpansionTile(
                        title: Text('Nohe 2017'),
                        children: getTiles(context, mirhasanNohe_2017Urls,mirhasanNohe_2017Names),
                      ),
                    ],),
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
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left : 8.0),
                  child: Text('Series',style: TextStyle(fontFamily: 'Gilroy',fontSize: 24.0, color: secondoryColor)),
                ),
              ],
            ),
            Container(
              height: 180.0,
              width: double.infinity,
              color: Colors.transparent,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SeriesCard(name: 'Mukhtarnama',image: AssetImage('assets/mukhtarnama.jpg'),urlList: mukhtarNama,),
                  SeriesCard(name: 'Yousuf-e-Payambar',image: AssetImage('assets/yousufnama.jpg'),urlList: yousufNama,),
                  SeriesCard(name: 'Hazrat Mariam',image: AssetImage('assets/maryamnama.jpg'),urlList: maryamNama,),
                  SeriesCard(name: 'Tiflan-e-Muslim',image: AssetImage('assets/tiflan_e_muslim.jpg'),urlList: tiflan_e_Muslim,),
                  SeriesCardDirect(name: 'Ertrugul Ghazi',image: AssetImage('assets/ertrugul.jpg'),url: 'https://www.youtube.com/watch?v=fa89NxhAKis&list=PLgirwYDDPtS2Tz7K6PZMYi_d8SeXQg-T5',)
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left : 8.0),
                  child: Text('Movies',style: TextStyle(fontFamily: 'Gilroy',fontSize: 24.0, color: secondoryColor)),
                ),
              ],
            ),
            Container(
              height: 180.0,
              width: double.infinity,
              color: Colors.transparent,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  DocumentaryCard(name: 'The Kingdom Of Hazrat Suleman',image: AssetImage('assets/solomon.jpg'),url: 'https://www.youtube.com/watch?v=LHbb0nOrvjQ',),
                  DocumentaryCard(name: 'The Tale Of Heavens',image: AssetImage('assets/heavens.jpg'),url: 'https://www.youtube.com/watch?v=fPPl6lshukE',),
                  DocumentaryCard(name: 'Muhammad: The Messenger of God',image: AssetImage('assets/messenger.png'),url: 'https://www.youtube.com/watch?v=Az7hA-4cro4',),

                ],
              ),
            ),
            SizedBox(height: 25.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(' Documentaries',style: TextStyle(fontFamily: 'Gilroy',fontSize: 23.0,color: secondoryColor)),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListVideos(name: 'Documentaries',urlList: documentaries,)));
                    },
                    child: Text('View All',style: TextStyle(fontFamily: 'Sniglet',fontSize: 19.0,color: secondoryColor))),
              ],
            ),
            Container(
              height: 180.0,
              width: double.infinity,
              color: Colors.transparent,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  DocumentaryCard(name: 'Imam Ali: The Voice of Human Justice',image: AssetImage('assets/imam_ali_doc.jpg'),url: 'https://www.youtube.com/watch?v=WLamm2TUxsE',),
                  DocumentaryCard(name: 'The Government of Imam Mahdi (atf)',image: AssetImage('assets/imam_mehdi_gov_doc.jpg'),url: 'https://www.youtube.com/watch?v=1WXkqzMb1Bw',),
                  DocumentaryCard(name: 'Mary In Islam',image: AssetImage('assets/mary_doc.jpg'),url: 'https://www.youtube.com/watch?v=-bS6QW_g1Nc',),
                  DocumentaryCard(name: 'Death & Beyond - The Journey of the Soul',image: AssetImage('assets/death_doc.jpg'),url: 'https://www.youtube.com/watch?v=TB_jnWUhU3g',),
                  DocumentaryCard(name: 'The Shia of India',image: AssetImage('assets/shia_india_doc.jpg'),url: 'https://www.youtube.com/watch?v=mx19SV3kmis',),
                ],
              ),
            ),
            SizedBox(height: 25.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left : 8.0),
                  child: Text('Ashra-e-Majlis',style: TextStyle(fontFamily: 'Gilroy',fontSize: 24.0, color: secondoryColor)),
                ),
              ],
            ),
            Container(
              height: 180.0,
              width: double.infinity,
              color: Colors.transparent,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SeriesCard(name: 'Maulana Abid Bilgrami',image: AssetImage('assets/abid_bilgrami.jpg'),urlList: abidBilgrami,
                  type: 'Majlis',),
                  SeriesCard(name: 'Maulana Kalbe Jawad',image: AssetImage('assets/kalbe_jawwad.jpg'),urlList: kalbeJawwad,
                      type: 'Majlis'),
                  SeriesCard(name: 'Maulana Syed Hasan Raza',image: AssetImage('assets/hasan_raza.jpg'),urlList: hasanRaza,
                      type: 'Majlis'),
                  SeriesCard(name: 'Maulana Izrahul Hasan',image: AssetImage('assets/izrahul_hasan.jpg'),urlList: izrahulHasan,
                      type: 'Majlis'),
                  SeriesCard(name: 'Maulana Meesam Raza',image: AssetImage('assets/meesum_zaidi.jpg'),urlList: meesamZaidi,
                      type: 'Majlis'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



