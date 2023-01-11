import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CircularLogo extends StatelessWidget {
  final width, height;
  const CircularLogo({Key key, this.width, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: DottedBorder(
            child: Padding(
            padding: EdgeInsets.all(8.0),
            ),
                borderType: BorderType.Circle,
                dashPattern: [6],
                strokeWidth: 1,
                color: Colors.white,
                ),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            shape: BoxShape.circle,
            color: Color.fromRGBO(62, 71, 84, 1),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: new AssetImage("assets/images/terzi.png"),
            ),
        ),
        // child:
      ),
    );
  }
}
