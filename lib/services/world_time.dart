
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  String location;
  String time='';
  String flag;
  String url;
  bool isDaytime=true;
  WorldTime({required this.location ,required this.flag ,required this.url});
  Future<void> getData() async{
  try {
    var urs = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
    Response response = await get(urs);
    Map data=jsonDecode(response.body);
    // print(data);  
    String datetime = data['datetime'];
    String offset1 = data['utc_offset'].substring(1,3);
    String offset2 = data['utc_offset'].substring(4,6);
    // print(datetime);
    // print(offset);
    DateTime now = DateTime.parse(datetime);
    now=now.add(Duration(hours:int.parse(offset1),minutes: int.parse(offset2)));
    // print(now);
    isDaytime= now.hour > 6 && now.hour < 19 ? true : false ;
    time=DateFormat.jm().format(now);

  
  } catch (e) {
    print('An error was caught. the error is $e');
    time='NO TIME DUE TO ERROR';
  }
  }
}