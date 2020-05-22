import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text ('About Me'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/sajjad.jpg'),
              backgroundColor: Colors.blue,
            ),
            Text(
              'SAJJAD HOSSAIN',
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.black,
              ),
            ),
            Text(
              'Software Engineer',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.teal,
                letterSpacing: 3.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
//                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,

                  ),
                  title:Text(
                    '+880 1867 131 561',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                    ),
                  ),
                )
            ),
            Card(
//                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,

                  ),
                  title:Text(
                    'csesajjad@gmail.com',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                    ),
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }

}
