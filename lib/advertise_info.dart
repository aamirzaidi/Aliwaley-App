import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvertiseInfo extends StatelessWidget {

  launchCaller(String num) async {
    String url = "tel:$num";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Ionicons.ios_arrow_back,color: Colors.white, size: 30.0,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text('Ali Waley',style: TextStyle(fontFamily: 'Merienda',fontSize: 30.0,fontWeight: FontWeight.bold),),
        ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(30.0) )),
        child: Padding(
          padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/advertise.png'),
              SizedBox(height: 15.0,),
              Text('Advertise your business',style: TextStyle(fontFamily:'Sniglet',color: Colors.black,fontSize: 25.0),),
              SizedBox(height: 5.0,),
              Text('Got a business or a youtube channel or any of your work you want the community to know about? \nAdvertise your work here!',style: TextStyle(fontFamily:'AreqRufaa',color: Colors.black87,fontSize: 18.0),),
              SizedBox(height: 5.0,),
              Text('Details :',style: TextStyle(fontFamily:'Sniglet',color: Colors.black,fontSize: 22.0),),
              SizedBox(height: 5.0,),
              Text('A banner Ad of your work like the one above will be shown on the front page of the app for 24 hours.\nOnly one ad can be shown every day. Hence try to book in advance for the day.',style: TextStyle(fontFamily:'AreqRufaa',color: Colors.black87,fontSize: 17.0),),
              SizedBox(height: 4.0,),
              Text('Cost : Only 300₹ for 24 hours.',style: TextStyle(fontFamily:'AreqRufaa',color: Colors.deepOrange,fontSize: 16.0),),
              SizedBox(height: 12.0,),
              Text('Contact No : ',style: TextStyle(fontFamily:'Gilroy',color: Colors.black87,fontSize: 20.0,),),
              Text('Mohd Aamir ',style: TextStyle(fontFamily:'Sniglet',color: Colors.blueGrey,fontSize: 18.0),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                      onTap: (){
                        launchCaller('+917065440285');
                      },
                      child: Text('(+917065440285)',style: TextStyle(fontFamily:'Sniglet',color: Colors.blueGrey,fontSize: 16.0),)),
                  SizedBox(width: 2.0,),
                  Icon(Ionicons.logo_whatsapp, size: 22.0,color: Colors.green,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                      onTap: (){
                        launchCaller('+917291935586');
                      },
                      child: Text('( +917291935586 )',style: TextStyle(fontFamily:'Sniglet',color: Colors.blueGrey,fontSize: 16.0),)),
                  SizedBox(width: 2.0,),
                  Icon(Ionicons.logo_whatsapp, size: 22.0,color: Colors.green,)
                ],
              ),
              SizedBox(height: 14.0,),
              Text('Note : We do not intend to earn any profits from it. It is just a way for us to cover the monthly hosting cost to put the app on server.\nHope you understand.',style: TextStyle(fontFamily:'Merienda',color: Colors.black,fontSize: 14.0),)
            ],
          ),
        ),
      ),

    );
  }
}
