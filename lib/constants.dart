import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Color primaryColor = Colors.white;
Color secondoryColor = Colors.black;

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
