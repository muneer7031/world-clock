import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Map data={};
   
  @override
 
  Widget build(BuildContext context) {
    data=data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;
    // print(data);
    String bgimg=  data['isDaytime'] ? 'mday.jpeg' : 'mnight.jpeg';
    Color bgcol= data['isDaytime'] ? Color.fromARGB(255, 108, 108, 121) : Color.fromARGB(255, 175, 41, 69);
    return SafeArea(
      child:Scaffold(
        backgroundColor: bgcol,
      body: Container(
        decoration:BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgimg'),
            fit: BoxFit.cover
            )
            ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80.0, 0, 0),
            child:Column(
                 children: [
                    Container(
                    margin: EdgeInsets.zero,
                    // borderOnForeground: false,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left:100.0,top: 40.0),
                        child: TextButton(
                          child: Row(children: [
                            Icon(Icons.location_on_sharp,
                            color: bgcol,),
                            SizedBox(width: 5.0,),
                            Text("EDIT LOCATION ",
                            textAlign: TextAlign.end,
                            style: TextStyle(color: bgcol),)
                          ],
                          ),
                          onPressed: () async{
                           dynamic result= await Navigator.pushNamed(context, '/location');
                           if(result!=null){
                           setState(() {
                             data={
                                'location': result['location'],
                                'time': result['time'],
                                'flag': result['flag'],
                                'isDaytime': result['isDaytime'],
                             };
                           });}
                          },),
                      ),
                    )
                  ),
                
                SizedBox(height: 5.0,),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 30.0,
                    height: 5.0,
                    color: bgcol
                  ),
                  ),
                  SizedBox(height: 5.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 65.0,
                    color: bgcol
                  ),
                  ),
                
                 ],
              ),
          ),
          ),
      ),
      ),
    );
  }
}
