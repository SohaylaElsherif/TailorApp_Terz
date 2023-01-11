import 'package:flutter/material.dart';
import 'customUI/customLayout.dart';

class SectionHeader extends StatelessWidget {
  final title;

  const SectionHeader({Key key, this.title}) : super(key: key);
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
          child: Text(
              title,
              style: TextStyle(
                  color: Color.fromRGBO(244, 181, 86, 1),
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
        ),
      ],
    ));
  }
}
