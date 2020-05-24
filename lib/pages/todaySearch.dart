import 'package:covid19/data_source.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class TodaySearchCountry  extends SearchDelegate{

  final List countryList;

  TodaySearchCountry(this.countryList);


  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        primaryColor: Colors.white,
        brightness: DynamicTheme.of(context).brightness
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query='';

      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    final suggestionList
    =
    query.isEmpty?
    countryList:
    countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
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
                        Text(suggestionList[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                        Image.network(suggestionList[index]['countryInfo']['flag'],
                          height:50,width: 60,),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('TODAY CONFIRMED : ' + suggestionList[index]['todayCases'].toString(),
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold
                            ),),
                          Text('TODAY DEATHS : ' + suggestionList[index]['todayDeaths'].toString(),
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
        });
  }

}