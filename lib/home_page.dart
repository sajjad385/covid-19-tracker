import 'dart:convert';
import 'package:covid19/data_source.dart';
import 'package:covid19/pages/country_page.dart';
import 'package:covid19/panels/bangladesh.dart';
import 'package:covid19/panels/info_panel.dart';
import 'package:covid19/panels/most_effected_countries.dart';
import 'package:covid19/panels/world_wide_panel.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'pages/today_countries.dart';
import 'panels/today_world_wide_panel.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  fetchWorldWideData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData =json.decode(response.body);
    });

  }

  Map todayWorldData;
  fetchTodayWorldWideData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      todayWorldData =json.decode(response.body);
    });

  }

  Map todayBangladesh;
  fetchTodayBangladeshData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries/bangladesh');
    setState(() {
      todayBangladesh =json.decode(response.body);
    });

  }

//  Country Data
  List countryData;
  fetchCountryData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData =json.decode(response.body);
    });

  }

  @override
  void initState() {
    // TODO: implement initState
   fetchWorldWideData();
   fetchTodayWorldWideData();
   fetchTodayBangladeshData();
   fetchCountryData();
   super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: <Widget>[
          IconButton(icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight), onPressed: (){
            DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
          })
        ],
        title: Text('COVID-19 TRACKER'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height:100 ,
              color: Colors.orange[100],
              child: Center(
                child: Text(DataSource.quote,style: TextStyle(
                  color: Colors.orange[800],fontWeight: FontWeight.bold,fontSize:16
                ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Worldwide',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:22
                  ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text('All Countries',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize:16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData== null? CircularProgressIndicator():WorldwidePanel(worldData: worldData,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Today Worldwide',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:22
                  ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TodayCountryPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.indigoAccent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text('All Countries',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize:16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData== null? CircularProgressIndicator():TodayWorldwidePanel(todayWorldData: todayWorldData,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 15.0),
              child: Text('Bangladesh Status',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:22,
              ),
                textAlign: TextAlign.left,
              ),
            ),
           worldData== null? CircularProgressIndicator():BangladeshPanel(todayBangladesh: todayBangladesh,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 15.0),
              child: Text('Most Effected Countries',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:22,
              ),
                textAlign: TextAlign.left,
              ),
            ),
           SizedBox(height: 10,),
           countryData==null?Container(): MostEffectedPanel(countryData: countryData,),
            SizedBox(height: 10,),
            InfoPanel(),
            SizedBox(height: 20,),
            Text('Stay home Stay Safe',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

            Text('App Version : 1.0.0'),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
