import 'package:flutter/material.dart';

import 'colors.dart';
class CustomLoginButton extends StatelessWidget {
  CustomLoginButton(
      {
        @required this.buttonAction,
        @required this.child,
      });


  final VoidCallback buttonAction;

  final Widget child ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 50.0,

      child: ElevatedButton(
        child: SizedBox(child: child ,width: double.infinity, height: 40,),

        onPressed: buttonAction,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(PrimaryDarkColor),
          backgroundColor: MaterialStateProperty.all<Color>(PrimaryAssentColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
