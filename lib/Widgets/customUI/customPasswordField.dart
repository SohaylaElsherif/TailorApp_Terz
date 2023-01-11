import 'package:flutter/material.dart';

import 'colors.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
   this.Controller,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController Controller;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        new TextFormField(
          key: widget.fieldKey,
          style: TextStyle(color: Colors.white),
          controller: widget.Controller,
          obscureText: _obscureText,
          onSaved: widget.onSaved,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock_outline_sharp ,
              color: Colors.white,
            ),
            hintText: "password",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            suffixIcon: new GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child:
              new Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: SecondryColorLight),
            ),
          ),

        ),
      ],
    );
  }
}
