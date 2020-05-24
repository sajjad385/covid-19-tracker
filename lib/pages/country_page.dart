import 'package:covid19/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

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
    fetchCountryData();
    super.initState();
  }
Widget customSearchBar= Text('Countries Status');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,

        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: SearchCountry(countryData));
            },
          )
        ],
      ),
      body: countryData== null
          ? Center(child: CircularProgressIndicator(),
      )
    :ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: Container(
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                children: <Widget>[
                  Container(

                    margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(countryData[index]['country'],
                          style: TextStyle(fontWeight: FontWeight.bold),),
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
                          Text('CONFIRMED : ' + countryData[index]['cases'].toString(),
                            style: TextStyle(
                            color: Colors.red,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('ACTIVE : ' + countryData[index]['active'].toString(),
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('RECOVERED : ' + countryData[index]['recovered'].toString(),
                            style: TextStyle(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.bold
                          ),),
                          Text('DEATHS : ' + countryData[index]['deaths'].toString(),
                            style: TextStyle(
                                color: Colors.pinkAccent,
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

