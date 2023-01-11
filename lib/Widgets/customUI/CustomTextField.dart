import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  @override
  final TextEditingController Controller;
  final FocusNode focusNode;
  final Function EditingComplete;
  final  Function(String) actionChanging;
  final IconData icon;
  final String errorMsg;
  final String placeholder;
  final TextInputType inputType;
  const CustomTextField({Key key, @required this.Controller, @required this.focusNode, this.EditingComplete, this.actionChanging,  @required this.icon,   this.errorMsg, this.placeholder, this.inputType}) : super(key: key);
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        TextFormField(
          controller: Controller,
          style: TextStyle(color: Colors.white),
          focusNode: focusNode,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon ,
              color: Colors.white,
            ),
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            errorText: errorMsg,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          keyboardType: inputType,
          textInputAction: TextInputAction.next,
          onEditingComplete: EditingComplete,
          onChanged: actionChanging,
        ),
      ],
    );
  }
}
