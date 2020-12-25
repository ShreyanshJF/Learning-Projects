import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_loc.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/loc' : (context) => ChooseLoc(),
    },
  ));
}
