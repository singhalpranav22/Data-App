import 'package:flutter/material.dart';

class IconRowButton extends StatelessWidget {
  IconRowButton({
    @required this.onTap,
    @required this.color,
    @required this.icon,
    @required this.text,
  });
  final Function onTap;
  final Color color;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: DecoratedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15,),
              CircleAvatar(
                child: Icon(icon , size: 25, color: color),
                radius: 20,
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
              ),
              SizedBox(width: 53.5,),
              Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(29),
        ),
      ),
    );
  }
}
