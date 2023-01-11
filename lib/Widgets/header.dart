import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/customUI/horizontalLine.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/Widgets/customUI/icons.dart';
import 'customUI/colors.dart';
import 'customUI/customLayout.dart';
import 'customUI/menuIcon.dart';
import 'customUI/searchBar.dart';

class ScreenHeader extends StatelessWidget {
  final title;
  final Widget child;
  const ScreenHeader({Key key, this.title, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CustomLayOut(),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0, right: 85
                ),
                child: MenuIcon(),
              ),
              Text(
                  title,
                  style: TextStyle(
                    color: Color.fromRGBO(244, 181, 86, 1),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            color: SecondryColorLight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: child,
            ),
          ),
        ),
        // SearchBar(),
        HorizontalLine(),
      ],
    ));
  }
}
