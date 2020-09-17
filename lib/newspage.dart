import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Ionicons.ios_arrow_back,size: 29.0,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text('Ali Waley', style: TextStyle(
            fontFamily: 'Merienda',
            fontSize: 32.0,
            fontWeight: FontWeight.bold),),
        actions: [
          IconButton(icon: Icon(FontAwesome.newspaper_o), onPressed: null)
        ],
        bottom: PreferredSize(preferredSize: Size.fromHeight(35.0),
          child:
          Text('News',style: TextStyle(fontFamily: 'Sniglet',fontSize: 28.0,color: Colors.white),),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0))),
      ),
    );
  }
}
