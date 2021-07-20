import 'package:flutter/material.dart';
import 'package:world_clock/screeens/Home.dart';
import 'package:world_clock/screeens/Loading.dart';
import 'package:world_clock/screeens/Location.dart';
void main() {
  runApp(
    MaterialApp(
      title: 'WORLD CLOCK',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => Loading(),
        '/home' : (context) => Home(),
        '/location' : (context) => Location(),
      },
    )
  );
}
 