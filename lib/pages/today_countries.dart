import 'package:covid19/pages/todaySearch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class TodayCountryPage extends StatefulWidget {
  @override
  _TodayCountryPageState createState() => _TodayCountryPageState();
}

class _TodayCountryPageState extends State<TodayCountryPage> {

//  Country Data
  List countryData;
  fetchCountryData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=todayDeaths');
    setState(() {
      countryData =json.decode(response.body);
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: TodaySearchCountry(countryData));
            },
          )
        ],
        title: Text('Today Countries Status'),
      ),
      body: countryData== null ? Center(child: CircularProgressIndicator(),):ListView.builder(

        itemBuilder: (context, index){
          return Card(
            child: Container(
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                children: <Widget>[
                  Container(margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                        Image.network(countryData[index]['countryInfo']['flag'],
                          height:50,width: 60,),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('TODAY CONFIRMED : ' + countryData[index]['todayCases'].toString(),
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold
                            ),),
                          Text('TODAY DEATHS : ' + countryData[index]['todayDeaths'].toString(),
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold
                            ),),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: countryData== null? 0: countryData.length,
      ),
    );
  }
}
