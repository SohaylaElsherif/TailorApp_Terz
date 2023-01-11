import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/customUI/customLayout.dart';
import 'package:graduation_project/Widgets/logo.dart';

import 'colors.dart';

class CustomPageDesign extends StatelessWidget {
  final Widget child;
  final double bannerSize;

  const CustomPageDesign({Key key, this.child, this.bannerSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(children: <Widget>[
      new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/images/backgroundImage.jpeg"),
                fit: BoxFit.fill)),
      ),
      SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30.0),
                // height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.2,
                alignment: Alignment.center,
                child: CircularLogo(
                  height: bannerSize,
                  width: bannerSize,
                ),
              ),

              Container(
                //height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.8,
                color: PrimaryDarkColor,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      CustomLayOut(),
                      child,
                      CustomLayOut(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ]));
  }
}
