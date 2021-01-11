import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data App"),
      ),
      body: Center(
        child: GridView.count(
          padding: EdgeInsets.all(20),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            RaisedButton(
              child: Text("Find by Skillset"),
              onPressed: (){}
              ,
            ),
            RaisedButton(
              child: Text("Find by Company"),
              onPressed: (){}
              ,
            ),
            RaisedButton(
              child: Text("Find by Location"),
              onPressed: (){}
              ,
            ),
            RaisedButton(
              child: Text("Find by Name"),
              onPressed: (){}
              ,
            )
          ],
        ),
      ),

    );
  }
}
