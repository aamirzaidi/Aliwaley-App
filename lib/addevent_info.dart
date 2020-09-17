import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEventInfo extends StatelessWidget {
  
  final fireStore = Firestore.instance;
  String fieldOne, fieldTwo , fieldThree , fieldFour , fieldFive, fieldSix;
  
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left : 15.0, right: 15.0, top: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0,),
                Text('Event Name',style: TextStyle(color: Colors.black87, fontSize: 16.0),),
                TextField(
                  onChanged: (value){
                    fieldOne = value;
                  },
                ),
                SizedBox(height: 10.0,),
                Text('Date',style: TextStyle(color: Colors.black87, fontSize: 16.0),),
                TextField(
                  onChanged: (value){
                    fieldTwo = value;
                  },
                ),
                SizedBox(height: 10.0,),
                Text('Time',style: TextStyle(color: Colors.black87, fontSize: 16.0),),
                TextField(
                  onChanged: (value){
                    fieldThree = value;
                  },
                ),
                SizedBox(height: 10.0,),
                Text('Location',style: TextStyle(color: Colors.black87, fontSize: 16.0),),
                TextField(
                  onChanged: (value){
                    fieldFour = value ;
                  },
                ),
                SizedBox(height: 10.0,),
                Text('Video/channel/profile Link?',style: TextStyle(color: Colors.black87, fontSize: 16.0),),
                TextField(
                  onChanged: (value){
                    fieldFive = value;
                  },
                ),
                SizedBox(height: 10.0,),
                Text('Any other details? (maulana/nauhekhwan/others)',style: TextStyle(color: Colors.black87, fontSize: 16.0),),
                TextField(
                  onChanged: (value){
                    fieldSix = value;
                  },
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  child: Text('Submit Request',style: TextStyle(fontSize: 15.0),),
                      onPressed: ()async {
                        await fireStore.collection('event_requests').add({
                          'fieldOne' : fieldOne,
                          'fieldTwo' : fieldTwo,
                          'fieldThree' : fieldThree,
                          'fieldFour' : fieldFour,
                          'fieldFive' : fieldFive,
                          'fieldSix' : fieldSix,
                        });
                        showDialog(context: context,
                        builder: (dialogContext) {
                          return AlertDialog(
                            title: Text('Request Submitted'),
                            content: Text("SMS 'Event' to 7065440285 for faster results." ),
                            actions: [
                              FlatButton(onPressed: (){
                                Navigator.of(dialogContext , rootNavigator: true).pop();
                              }, child: Text('Close'))
                            ],
                          );
                        }
                        );
                        Navigator.pop(context);
                      },
                ),
                SizedBox(height: 30.0,),
                Text('Or just inform us on: ',style: TextStyle(fontFamily:'Sniglet',color: Colors.black87,fontSize: 20.0),),
                SizedBox(height: 8.0,),
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          launchCaller('+917065440285');
                        },
                        child: Text('+917065440285 ',style: TextStyle(fontFamily:'Sniglet',color: Colors.blueGrey,fontSize: 18.0),)),
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
