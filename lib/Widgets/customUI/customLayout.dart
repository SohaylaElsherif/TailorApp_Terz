import 'package:flutter/material.dart';
import 'package:fdottedline/fdottedline.dart';

import 'colors.dart';

class CustomLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8,bottom:8),
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
      ),
    );
  }
}
