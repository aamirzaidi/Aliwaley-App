import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportUsInfo extends StatelessWidget {

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
            padding: const EdgeInsets.only(left : 12.0, right: 12.0, top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('About Us',style: TextStyle(fontFamily:'Merienda',color: Colors.black,fontSize: 30.0),),
                SizedBox(height: 20.0,),
                Text('Developed By @CarelessCoders',style: TextStyle(fontFamily:'Sniglet',color: Colors.black,fontSize: 23.0),),
                SizedBox(height: 20.0,),
                Text('Support Us By : ',style: TextStyle(fontFamily:'Sniglet',color: Colors.blueGrey,fontSize: 23.0),),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
                  color: Colors.blueGrey,
                  child: Text('Subscribing us on youtube',style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    _launchURL('https://www.youtube.com/channel/UCqpup921sCCjfTIiYy0CkCw');
                  },
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
                  color: Colors.blueGrey,
                  child: Text('Follow Ali Waley on Instagram',style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    _launchURL('https://www.instagram.com/aliwaleyapp');
                  },
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
                  color: Colors.blueGrey,
                  child: Text('Follow Careless Coders on Instagram',style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    _launchURL('https://www.instagram.com/carelesscoders');
                  },
                ),
                SizedBox(height: 30.0,),
                Text('Help us make the app better',style: TextStyle(fontFamily:'Sniglet',color: Colors.black,fontSize: 23.0),),
                Text('Donate',style: TextStyle(fontFamily:'Sniglet',color: Colors.blueGrey,fontSize: 28.0),),
                SizedBox(height: 8.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        color: Colors.transparent,
                        child: Image.asset('assets/payment/google_pay.png',fit: BoxFit.scaleDown,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        color: Colors.transparent,
                        child: Image.asset('assets/payment/paytm.jpg',fit: BoxFit.scaleDown,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        color: Colors.transparent,
                        child: Image.asset('assets/payment/phone-pe.png',fit: BoxFit.scaleDown,),
                      ),
                    ),
                  ],
                ),
                Text('@',style: TextStyle(fontFamily:'Gilroy',color: Colors.blueGrey,fontSize: 40.0),),
                SizedBox(height: 5.0,),
                GestureDetector(
                    onTap: (){
                      launchCaller('+917065440285');
                    },
                    child: Text('+917065440285',style: TextStyle(fontFamily:'Gilroy',color: Colors.black,fontSize: 20.0),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
