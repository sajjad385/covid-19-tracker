import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BangladeshPanel extends StatelessWidget {
  final Map todayBangladesh;

  const BangladeshPanel({Key key, this.todayBangladesh}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2
        ),
        children: <Widget>[
          StatusPanel(
            title: 'NEW CASES',
            panelColor: Colors.pinkAccent,
            textColor:Colors.white,
            count:todayBangladesh['todayCases'].toString(),
          ),
          StatusPanel(
            title: 'NEW DEATHS',
            panelColor: Colors.red,
            textColor:Colors.white,
            count: todayBangladesh['todayDeaths'].toString(),
          ),
          StatusPanel(
            title: 'TOTAL CASES',
            panelColor: Colors.deepPurpleAccent,
            textColor:Colors.white,
            count: todayBangladesh['cases'].toString(),
          ),
          StatusPanel(
            title: 'TOTAL DEATHS',
            panelColor: Colors.blueGrey,
            textColor:Colors.white,
            count: todayBangladesh['deaths'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.blueAccent,
            textColor:Colors.white,
            count: todayBangladesh['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.lightBlueAccent,
            textColor:Colors.white,
            count: todayBangladesh['recovered'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(5),
      height: 80,
      width: width/2,
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0,3)
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor
            ),
          ),
          Text(count,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor
            ),
          )
        ],
      ),
    );
  }
}
