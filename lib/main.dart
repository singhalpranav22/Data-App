import 'package:data_app/screens/options_page.dart';
import 'package:flutter/material.dart';
import 'package:data_app/screens/home.dart';
import 'package:data_app/screens/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Options(),
    );
  }
}
