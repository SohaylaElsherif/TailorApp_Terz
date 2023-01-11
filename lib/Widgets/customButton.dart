import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/UI/ServicesScreen/services.dart';
import 'package:graduation_project/UI/TailorProfile/hire.dart';

import 'customUI/colors.dart';

class CustomButton extends StatelessWidget {
  final tailor;
  const CustomButton({this.tailor});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Hire(tailor: tailor,),
          ),
        );
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(PrimaryAssentColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.black)))),
      child: DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: [6],
        strokeWidth: 1,
        color: Colors.black,
        radius: Radius.circular(10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
          child: Text('Hire me',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
        ),
      ),
    );
  }
}
