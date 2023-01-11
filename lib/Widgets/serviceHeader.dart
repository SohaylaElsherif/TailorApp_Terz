import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/customUI/menuIcon.dart';
import 'customUI/customLayout.dart';

class ServiceHeader extends StatelessWidget {
  final title;

  const ServiceHeader({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: CustomLayOut(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MenuIcon(),
              Padding(
                padding: const EdgeInsets.only(left: 85),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Color.fromRGBO(244, 181, 86, 1),
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
