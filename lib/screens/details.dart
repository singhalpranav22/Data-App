// Page to show the person's details

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:awesome_package/awesome_package.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';


class Details extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI',
      home: UI(),
    );
  }
}
class UI extends StatelessWidget {

  String name="Mindy Clinton";
  String position="Data Scientist";
  String company="Google";
  UI({this.name,this.position,this.company});
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget> [
          Stack(
            alignment: Alignment.centerLeft,
            overflow: Overflow.visible,


            children: <Widget> [
//              Padding(padding: EdgeInsets.only(left: 50)
//
//              ),
//             Expanded(
//               flex: 1,
//
//               child:
              Image(image: AssetImage("assets/images/back_ground.JPG"),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 4,
                width: double.infinity,


              ),

//             ),


              Positioned(
                bottom: -40.0,
                left: 30.0,
                child: CircleAvatar(
                  radius:80,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage('https://www.desktopbackground.org/download/2560x1440/2013/07/20/610074_hd-cute-child-babies-wallpapers-ultra-hd-full-size-hirewallpapers_2560x1786_h.jpg'),
                ),
              ),
              Positioned(
                left: 200.0,
                top:86.0,
                child: Text(name,
                  style: new TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    fontFamily: 'Roboto',
//                      fontFamily: '',

                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 200.0,
                top: 120.0,
                child: Text(position,
                  style: new TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
//                      fontFamily: '',

                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 200.0,
                top: 150.0,
                child: Text(company,
                  style: new TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                    fontFamily: 'Roboto',

                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


