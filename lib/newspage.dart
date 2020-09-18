import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class NewsPage extends StatelessWidget {
  List<Color> getGradientColor(index) {
    if (index == 0) {
      return [Colors.black, Colors.blueAccent];
    } else if (index == 1) {
      return [Colors.black, Colors.red];
    } else if (index == 2) {
      return [Colors.black, Colors.green];
    } else if (index == 3) {
      return [Colors.black, Colors.amber];
    } else if (index % 4 == 0) {
      return [Colors.black, Colors.blueGrey];
    } else if (index % 5 == 0) {
      return [Colors.black, Colors.cyan];
    } else if (index % 6 == 0) {
      return [Colors.black, Colors.deepPurpleAccent];
    } else if (index % 3 == 0) {
      return [Colors.black, Colors.blue.shade900];
    } else if (index % 2 == 0) {
      return [Colors.black, Colors.brown];
    } else {
      return [Colors.black, Colors.redAccent];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Ionicons.ios_arrow_back,
            size: 29.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'Ali Waley',
          style: TextStyle(
              fontFamily: 'Merienda',
              fontSize: 32.0,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: Icon(FontAwesome.newspaper_o), onPressed: null)
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child: Text(
            'News',
            style: TextStyle(
                fontFamily: 'Sniglet', fontSize: 28.0, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return NewsCard(
                title:
                    "Google to remove PayTM, other apps that facilitate sports betting",
                imageUrl:
                    'https://img.etimg.com/thumb/msid-78178703,width-294,resizemode-4,imgsize-611188/latest-daily-news-and-updates-september18.jpg',
                description:
                    "On Friday detected 96,424 new coronavirus infections in the past 24 hours, pushing the country's tally to 5.2 million, data from the Union health ministry showed. On Friday, the health ministry said 1,174 people died of coronavirus in the last 24 hours, taking total mortalities from the disease to 84,372.",
                gradientColors: getGradientColor(index),
                arrowColor: getGradientColor(index)[1],
              );
            }),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  NewsCard(
      {@required this.title,
      @required this.imageUrl,
      this.description = 'No Description',
      @required this.gradientColors,
      this.arrowColor = Colors.blueAccent});

  final title;
  final imageUrl;
  final description;
  final gradientColors;
  final arrowColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        elevation: 5.0,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: 135,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradientColors,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              fontFamily: 'Gilroy'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 135,
                      color: Colors.transparent,
                      child: Image(
                        image: NetworkImage(
                          imageUrl,
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ExpandChild(
              arrowSize: 30.0,
              arrowColor: arrowColor,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                        left: BorderSide(color: arrowColor, width: 10.0),
                        right: BorderSide(color: arrowColor, width: 10.0))),
                width: double.infinity,
                child: Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 100.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        description,
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 16.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
