import 'package:flutter/material.dart';
import '../widgets/IconRowButton.dart';

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
            IconRowButton(onTap: null, color: Color(0xFF7340DD), icon: Icons.reduce_capacity, text: "Company"),
            IconRowButton(onTap: null, color: Color(0xFFA26FF6), icon: Icons.handyman, text: "Experience"),
            IconRowButton(onTap: null, color: Color(0xFFD98BED), icon: Icons.paste, text: "Skillset"),
            IconRowButton(onTap: null, color: Color(0xFF4358CF), icon: Icons.location_on_outlined, text: "Location")
          ],
        ),
      ),
    );
  }
}
