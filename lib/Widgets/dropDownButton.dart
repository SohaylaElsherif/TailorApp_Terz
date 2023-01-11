import 'package:flutter/material.dart';
import 'package:graduation_project/UI/ServicesScreen/formprovider.dart';
import 'package:provider/provider.dart';

class CustomDropDownButton extends StatefulWidget {
  final List dropDownValues;
  final target;

  const CustomDropDownButton(
      {@required this.dropDownValues,
      @required this.target,});
  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String _dropDownValue;
  @override
  Widget build(BuildContext context) {
    FormProvider provider = Provider.of<FormProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.white
          // border: Border.all(
          //     color: Colors.white),
          ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: widget.dropDownValues
              .map((value) => DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _dropDownValue = value;
            });
            if (widget.target == "Garment") {
              provider.changeDropDownGarmentValue(_dropDownValue);
            } else if (widget.target == "Fabric") {
              provider.changeDropDownFabricValue(_dropDownValue);
            }
          },
          isExpanded: false,
          value: _dropDownValue,
          hint:
              (_dropDownValue != null) ? Text(_dropDownValue) : Text("Choose"),
        ),
      ),
    );
  }
}
