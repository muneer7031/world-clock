import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
class Location extends StatefulWidget {
  const Location({ Key? key }) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations =[
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateLoc(index) async{
    WorldTime instance= locations[index];
    await instance.getData();
    Navigator.pop(context,{
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
      });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        backgroundColor: Colors.grey[850],
        
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("CHOOSE A LOCATION"),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding:EdgeInsets.symmetric(vertical: 2.0,horizontal: 4.0) ,
            child: ListTile(
              onTap: (){
                print(locations[index].location);
                updateLoc(index);
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ) ,
              title: Text(locations[index].location),
              
              ),
            );
        }
        )
      ),
    );
  }
}