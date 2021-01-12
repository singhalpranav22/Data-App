import 'package:data_app/screens/options_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        Scaffold(
          body: Center(
            child: Image(
              image: AssetImage('assets/images/Group_23.png'),
            )
          ),
        ),
        Scaffold(
          body: Center(
            child: Image(
              image: AssetImage('assets/images/Group_27.png'),
            ),
          ),
        ),
        Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 82.5,),
                Image(
                  image: AssetImage('assets/images/Group_26.png'),
                ),
                SizedBox(height: 10,),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context , MaterialPageRoute(builder: (context) => Options()));
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF7340DD),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
        )
      ],
    );
  }
}
