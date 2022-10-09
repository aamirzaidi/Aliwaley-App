import 'dart:convert';
import 'package:http/http.dart' as http;

class VideoData{
  final userUrl;
  VideoData({this.userUrl});

  Future<dynamic> getDetail() async {
    var embedUrl = Uri.parse("https://www.youtube.com/oembed?url=$userUrl&format=json");
    //store http request response to res variable
    var res = await http.get(embedUrl);
    print("get youtube detail status code: " + res.statusCode.toString());

    try {
      if (res.statusCode == 200) {
        //return the json from the response
        return json.decode(res.body);
      } else {
        //return null if status code other than 200
        return null;
      }
    } on FormatException catch (e) {
      print('invalid JSON' + e.toString());
      //return null if error
      return null;
    }
  }
}