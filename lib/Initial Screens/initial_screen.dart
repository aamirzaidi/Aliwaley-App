import 'package:aliwaley/constants.dart';
import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:aliwaley/collections/collections_page.dart';
import '../addevent_info.dart';
import 'package:aliwaley/Initial Screens/upcoming_events.dart';
import 'package:aliwaley/Initial Screens/trending_list.dart';
import '../advertise_info.dart';
import '../supportus_info.dart';
import 'package:admob_flutter/admob_flutter.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> with TickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    Admob.initialize('ca-app-pub-8718878643967075~5132834268');
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    var y = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        heroTag: null,
        child: Icon(
          MaterialCommunityIcons.fire, size: 40.0, color: Colors.orange,),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CollectionsPage();
          }));
        },
        backgroundColor: Colors.black,
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
        bottom: PreferredSize(preferredSize: Size.fromHeight(50.0),
          child: Column(//why used column , remove it maybe??
            children: <Widget>[
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(text: 'Trending',),
                  Tab(text: 'Events',),
                ],
              )
            ],
          ),
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
                      title: Text('Collection',style: TextStyle(fontFamily: 'Gilroy',color: Colors.black,fontSize: 18.0),),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return CollectionsPage();
                        }));
                      },
                    ),
                    ListTile(
                      title: Text('Add an event',style: TextStyle(fontFamily: 'Gilroy',color: Colors.black,fontSize: 18.0),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddEventInfo()));
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
        child: TabBarView(
          children: <Widget>[
            Trending(),
            UpcomingEvents(),
          ],
        ),
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