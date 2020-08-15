import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class AddEventInfo extends StatelessWidget {

  launchCaller(String num) async {
    String url = "tel:$num";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL(String url) async {
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left : 12.0, right: 12.0, top: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Organising an event? Tell us here.',style: TextStyle(fontFamily:'Sniglet',color: Colors.black,fontSize: 22.0),),
                SizedBox(height: 5.0,),
                Text('Fill the following form or/and contact us on following number, and we will be updating your event soon.',style: TextStyle(fontFamily:'AreqRufaa',color: Colors.black87,fontSize: 20.0),),
                SizedBox(height: 10.0,),
                RaisedButton(
                  color: Colors.blueGrey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Text('Form',style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    _launchURL('https://docs.google.com/forms/d/e/1FAIpQLScR9J0XOJom-a2mhexAU49kV258A_tc-RsqGOVxHJ3hQCyKZA/viewform?usp=sf_link');
                  },
                ),
                SizedBox(height: 16.0,),
                Text('Or just inform us on: ',style: TextStyle(fontFamily:'Sniglet',color: Colors.black87,fontSize: 20.0),),
                SizedBox(height: 8.0,),
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          launchCaller('+917065440285');
                        },
                        child: Text('+917065440285, ',style: TextStyle(fontFamily:'Sniglet',color: Colors.blueGrey,fontSize: 18.0),)),
                    SizedBox(width: 3.0,),
                    Icon(Ionicons.logo_whatsapp, size: 23.0,color: Colors.green,)
                  ],
                ),
                SizedBox(height: 8.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    GestureDetector(
                        onTap: (){
                          launchCaller('+917042986244');
                        },
                        child: Text('+917291935586',style: TextStyle(fontFamily:'Sniglet',color: Colors.blueGrey,fontSize: 18.0),)),
                    SizedBox(width: 3.0,),
                    Icon(Ionicons.logo_whatsapp, size: 23.0,color: Colors.green,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
