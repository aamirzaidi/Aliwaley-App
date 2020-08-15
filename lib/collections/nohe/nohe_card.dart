import 'package:aliwaley/collections/nohe/nohe_khan_page.dart';
import 'package:aliwaley/constants.dart';
import 'package:flutter/material.dart';

class NoheCard extends StatelessWidget {
  final name;
  final image;
  final expandedTiles;
  final spotifyUrl;
  final youtubeUrl;
  NoheCard({@required this.name, this.image = 'assets/zulfikar.png', @required this.expandedTiles, this.spotifyUrl, this.youtubeUrl });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NoheKhanPage(
                  name: name,image: image, expandedTiles: expandedTiles,spotifyUrl: spotifyUrl,youtubeUrl: youtubeUrl,)));
              },
              child: Hero(
                tag: name,
                child: CircleAvatar(
                  backgroundImage: AssetImage(image),
                  maxRadius: 50.0,
                ),
              ),
            ),
            SizedBox(height: 8.0,),
            Text('$name', style: TextStyle(color: secondoryColor),),
          ],
        ),
      ),
    );
  }
}
