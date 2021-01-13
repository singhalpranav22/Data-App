import 'package:flutter/material.dart';
import '../widgets/IconRowButton.dart';
import 'package:data_app/screens/search.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconRowButton(onTap:(){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Search(
                    category: "Company",
                  ),
                ),
              );
            }, color: Color(0xFF7340DD),  text: "Company"),
            IconRowButton( onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Search(
                    category: "Experience",
                  ),
                ),
              );
            }, color: Color(0xFFA26FF6),  text: "Experience"),
            IconRowButton( onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Search(
                    category: "Skills",
                  ),
                ),
              );
            }, color: Color(0xFFD98BED),  text: "Skillset"),
            IconRowButton(onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Search(
                    category: "Location",
                  ),
                ),
              );
            }, color: Color(0xFF4358CF), text: "Location")
          ],
        ),
      ),
    );
  }
}
