import 'package:flutter/material.dart';
import 'colors.dart';
class CustomTextButton extends StatelessWidget {
  CustomTextButton({
  @required this.buttonAction,
  @required this.child,
});


final VoidCallback buttonAction;

final Widget child ;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: child,
      style: TextButton.styleFrom(
        primary: SecondryColorLightter,
        backgroundColor: Colors.transparent,
        onSurface: SecondryColorLight,
      ),
      onPressed: buttonAction,
    );
  }
}
