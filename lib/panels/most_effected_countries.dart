import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MostEffectedPanel extends StatelessWidget {
  final List countryData;

  const MostEffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder (
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Image.network(countryData[index]['countryInfo']['flag'],
                  height: 30,
                  width: 40,
                ),
                SizedBox(width: 10.0),
                Text(countryData[index]['country'],style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 10.0),
                Text('Deaths: '+countryData[index]['deaths'].toString()+',',style: TextStyle(
                  color: Colors.red
                ),),
                Text(' Confirmed : '+countryData[index]['cases'].toString(),style: TextStyle(
                  color: Colors.deepPurple
                ),),
              ],
            ),
          ),
        );
      },
        itemCount: 5,
      ),
    );
  }
}
