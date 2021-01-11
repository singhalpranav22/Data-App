import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        controller: _controller,
        children: [
          Scaffold(
            body: Center(
              child: Card(
                child: Text('1'),
              ),
            ),
          ),
          Scaffold(
            body: Center(
              child: Card(
                child: Text('1'),
              ),
            ),
          ),
          Scaffold(
            body: Center(
              child: Card(
                child: Text('1'),
              ),
            ),
          )
        ],
      )
    );
  }
}
