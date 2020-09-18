import 'package:aliwaley/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:aliwaley/collections/collections_page.dart';
import 'package:aliwaley/Initial Screens/upcoming_events.dart';
import 'package:aliwaley/Initial Screens/trending_list.dart';
import '../advertise_info.dart';
import '../supportus_info.dart';
import 'package:aliwaley/Initial Screens/oganisation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:aliwaley/newspage.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> with TickerProviderStateMixin{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
//    Admob.initialize('ca-app-pub-8718878643967075~5132834268');
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showOverlayNotification((context) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: SafeArea(
              child: ListTile(
                leading: SizedBox.fromSize(
                    size: const Size(40, 40),
                    child: ClipOval(
                        child: Container(
                          color: Colors.black,
                        ))),
                title: Text(message['notification']['title']),
                subtitle: Text(message['notification']['body']),
                trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      OverlaySupportEntry.of(context).dismiss();
                    }),
              ),
            ),
          );
        }, duration: Duration(milliseconds: 10000));
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  int selectedIndex = 0;
  final tabs = [
    Trending(),
    UpcomingEvents(),
    Organisation(),
    CollectionsWidget(),
  ];

  String selectedIndexName(){
    switch(selectedIndex){
      case 0 : return 'Trending';
      case 1 : return 'Events';
      case 2 : return 'Organisation';
      case 3 : return 'Collection';
      default : return 'Ali Waley';
    }
  }


  @override
  Widget build(BuildContext context) {
    var y = MediaQuery.of(context).size.height;

    return Scaffold(
    bottomNavigationBar:FancyBottomNavigation(
      circleColor: Colors.orange,
      inactiveIconColor: Colors.black87,
      textColor: Colors.black87,
      tabs: [
        TabData(iconData: MaterialCommunityIcons.fire, title: "Trending"),
        TabData(iconData: MaterialIcons.event_note, title: "Events"),
        TabData(iconData: Octicons.organization, title: "Organisation"),
        TabData(iconData: MaterialIcons.collections, title: "Collection")
      ],
      onTabChangedListener: (position) {
        setState(() {
          selectedIndex = position;
        });
      },
    ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: DrawerIcon(),
        backgroundColor: Colors.transparent,
        title: Text('Ali Waley', style: TextStyle(
            fontFamily: 'Merienda',
            fontSize: 32.0,
            fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: IconButton(icon: Icon(FlutterIcons.newspaper_o_faw,color: Colors.white,), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
            }),
          ),
//          Text('NEWS',style: TextStyle(color: Colors.white,fontSize: y*0.02,fontWeight: FontWeight.bold),)

        ],
        bottom: PreferredSize(preferredSize: Size.fromHeight(35.0),
          child:
          Text(selectedIndexName(),style: TextStyle(fontFamily: 'Sniglet',fontSize: 28.0,color: Colors.white),),
        ),
      ),
      drawer: Drawer(
        child: Container(
          height: double.infinity,
          width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(60.0)),
              color: Colors.white,
            ),
            child : Column(
              children: <Widget>[
                DrawerHeader(
                  child: null,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage('assets/karbala.jpeg'),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
//                Divider(color: Colors.black,),
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('News',style: TextStyle(fontFamily: 'Gilroy',color: Colors.black,fontSize: 18.0),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
                      },
                    ),
                    ListTile(
                      title: Text('Advertise Your Work',style: TextStyle(fontFamily: 'Gilroy',color: Colors.black,fontSize: 18.0),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdvertiseInfo()));
                      },
                    ),
                    ListTile(
                      title: Text('About Us',style: TextStyle(fontFamily: 'Gilroy',color: Colors.black,fontSize: 18.0),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SupportUsInfo()));
                      },
                    ),
                    ListTile(
                      title: Text('Rate & Review',style: TextStyle(fontFamily: 'Gilroy',color: Colors.black,fontSize: 18.0),),
                      onTap: (){
                        launchURL('https://play.google.com/store/apps/details?id=com.carelesscoders.aliwaley');
                      },
                    ),
                  ],
                ),
                SizedBox(height: y*0.05,),
                Padding(
                  padding: const EdgeInsets.only(left:30.0, right:30.0),
                  child: Divider(thickness: 2.0,color: Colors.blueGrey,),
                ),
                Text('Live Like Ali. Die Like Hussain.',style: TextStyle(fontFamily: 'Sniglet',fontSize: 15.5,color: Colors.blueGrey),),
                Text('Made In India.',style: TextStyle(fontFamily: 'Sniglet',fontSize: 15.5,color: Colors.blueGrey),),
              ],
            ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),topLeft: Radius.circular(40.0))),
        child: tabs[selectedIndex],
      ),);
  }
}

class DrawerIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(icon : Icon(FrinoIcons.f_sort,color: Colors.white,size: 30.0,),
    onPressed: (){
      Scaffold.of(context).openDrawer();
    },
    );
  }
}

