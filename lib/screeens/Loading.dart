import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
 const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time='Loading';
  void getTime() async {
   WorldTime instance= WorldTime(flag: 'india.png',location: 'Kolkata' ,url:'Asia/Kolkata' );
  //  instance.getData();
   await instance.getData();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime
    });

  }
  @override
  void initState() {
  
    super.initState();
    getTime();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      // appBar: AppBar(
        // title: Text("LOADING SCREEN"),
        // centerTitle: true,
        // brightness: Brightness.dark,
      // ),
      body: Container(
        color: Colors.black ,
        padding: EdgeInsets.all(50.0),
        child:SpinKitWanderingCubes(
  color: Colors.white,
  size: 80.0,
),
        
        ),
      ),
    );
  }
}