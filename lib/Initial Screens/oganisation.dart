import 'package:aliwaley/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Organisation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:5.0),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('organisation').snapshots(),
                builder: (BuildContext context,snapshot){
                  if(!snapshot.hasData){
                    return Container(child: SpinKitFadingCircle(
                      color: Colors.red,
                      size: 40.0,
                    ));
                  }
                  if(snapshot.hasError){
                    return Center(child: Text('Something Wrong'),);
                  }
                  var orgData = snapshot.data.docs;
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        itemCount: orgData.length,
                        itemBuilder: (context, index) {
                          String img1 = orgData[index].get('img1');
                          String img2 = orgData[index].get('img2');
                          String img3 = orgData[index].get('img3');
                          String img4 = orgData[index].get('img4');
                          String img5 = orgData[index].get('img5');
                          return Padding(
                            padding: const EdgeInsets.only(top : 12.0),
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              color: Colors.transparent,
                                  child: Column(
                                    children: [
                                      CarouselSlider(
                                       items: [
                                         Image(image: NetworkImage(img1),),
                                         Image(image: NetworkImage(img2),),
                                         Image(image: NetworkImage(img3),),
                                         Image(image: NetworkImage(img4),),
                                         Image(image: NetworkImage(img5),),
                                       ],
                                        options: CarouselOptions(
                                         aspectRatio: 16/9,
                                         viewportFraction: 1.0,
                                         initialPage: 0,
                                         enableInfiniteScroll: false,
                                         reverse: false,
                                         autoPlay: true,
                                         autoPlayInterval: Duration(seconds: 3),
                                         autoPlayAnimationDuration: Duration(milliseconds: 700),
                                         autoPlayCurve: Curves.easeInOutCubic,
                                         enlargeCenterPage: true,
                                         scrollDirection: Axis.horizontal,
                                       ),
                         ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 12.0,top: 6.0),
                                        child: Text(orgData[index].get('title'),style: TextStyle(color: Colors.black,fontSize: 20.0,fontFamily: 'Gilroy'),),
                                      ),
                                    ],
                                  ),
                                ),
                          );
                        }
                    );
                }
                ),
                SizedBox(height: 5.0,),
                Image.asset('assets/father.jpg'),
                SizedBox(height: 10.0,),
                Icon(FontAwesome.quote_left),
                Padding(
                  padding: const EdgeInsets.only(right:12.0, left: 12.0,top:4.0,bottom: 4.0),
                  child: Text('Father to the orphans of Kufa, Imam Ali(a.s) used to visit them, comfort them and never let any of them sleep empty stomach...\nHow well are we following our Imam(a.s)?',style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Sniglet'),),
                ),
                Icon(FontAwesome.quote_right),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text('We will be conducting non-profitable charity events in the future to help the needy.\nIf you want to take part in the volunteer activities, join the group from the link down below and we will keep you posted about any upcoming events.',style: TextStyle(color: Colors.black87,fontSize: 18.0,fontFamily: 'Gilroy'),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(onPressed: (){
                    launchURL('https://chat.whatsapp.com/LQarpkbsYNICDoCcu79sAZ');
                  },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                    color: Colors.green,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Join Group',style: TextStyle(color: Colors.white),),
                        SizedBox(width: 2.0,),
                        Icon(FontAwesome.whatsapp,color: Colors.white,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
    );
  }
}

