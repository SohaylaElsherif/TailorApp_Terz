import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';

class CustomRowInMeasurments extends StatefulWidget {
  final String text;
  final String sizeVaule;

  final Color bgcolor;
  final TextEditingController controller;
  CustomRowInMeasurments({
    @required this.text,
    @required this.bgcolor,
    @required this.controller,
    @required this.sizeVaule
  });

  @override
  _CustomRowInMeasurmentsState createState() => _CustomRowInMeasurmentsState();
}

class _CustomRowInMeasurmentsState extends State<CustomRowInMeasurments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgcolor,
      height: 60,
      padding:EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left:32.0),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: PrimaryDarkColor,
                    fontSize: 16,
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: TextField(
                cursorColor: PrimaryAssentColor,
                textAlign: TextAlign.center,
                controller: widget.controller,
                keyboardType: TextInputType.number,
                style: TextStyle(color: PrimaryDarkColor),
                decoration: InputDecoration(
                  hintText : (widget.sizeVaule == "0" )? " - " : widget.sizeVaule ,

                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
