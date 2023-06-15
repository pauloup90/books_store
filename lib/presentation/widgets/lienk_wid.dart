import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURLbac(context ,String url ) async {
   Uri uri = Uri.parse(url);

   launchUrl(uri);

{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Center(child: Text ('cant launch ')) )
    );
  }
}
