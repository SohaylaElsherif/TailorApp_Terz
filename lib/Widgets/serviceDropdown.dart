import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/dropDownButton.dart';

class ServiceDropDown extends StatelessWidget {
  final text;
  final List values;
  final target;
  const ServiceDropDown(
      {this.text, this.values, this.target,});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35.0, top: 12.0, bottom: 12.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 12.0, bottom: 12.0, right: 12.0),
            child: CustomDropDownButton(
              dropDownValues: values,
              target: target,
            ),
          )
        ],
      ),
    );
  }
}
