// Page to show the person's details

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UI extends StatelessWidget {
  String name;
  String title;
  List<dynamic> experience;
  UI({this.name,this.title,this.experience});
  List<Widget> experiences = [];
  void experienceList(dynamic experience){
    for (dynamic exp in experience){
      print(exp['title']);
      experiences.add(ListTile(
        title: Text('${exp['title']}'),
        subtitle: Text('${exp['company_name']}'),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    experienceList(experience);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget> [
            Stack(
              alignment: Alignment.centerLeft,
              overflow: Overflow.visible,
              children: <Widget> [
                Image(image: AssetImage("assets/images/back_ground.JPG"),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 4,
                  width: double.infinity,
                ),
                Center(
                  child: Text(name, textAlign: TextAlign.center ,
                    style: new TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Job Title' , textAlign: TextAlign.center ,  style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
            )),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, textAlign: TextAlign.center ,
                style: new TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Experience', textAlign: TextAlign.center , style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
            )),
            SizedBox(height: 10,),
            Center(
              child: Column(
                children: experiences,
              ),
            )
          ],
        ),
      ),
    );
  }
}


