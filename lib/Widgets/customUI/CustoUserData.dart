
import 'package:flutter/material.dart';

class CustomUserData extends StatelessWidget {
  final String text;
  final IconData icon;

  const CustomUserData({Key key, this.text, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
