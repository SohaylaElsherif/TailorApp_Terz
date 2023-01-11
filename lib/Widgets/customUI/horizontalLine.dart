import 'package:flutter/material.dart';
import 'package:fdottedline/fdottedline.dart';
import 'colors.dart';

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:4,bottom:8),
            child: FDottedLine(
              color:SecondryColorLighttest,
              width: double.maxFinite,
            ),
          ),
           FDottedLine(
                color:SecondryColorLighttest,
                width: double.maxFinite,
              ),
        ],
      ),
    );
  }
}
