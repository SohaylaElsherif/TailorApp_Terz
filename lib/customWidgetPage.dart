import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/customUI/customLayout.dart';

class CustomWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widgets"),
      ),
      body: Column(
      children: [
        CustomLayOut(),
      ],
    ));
  }
}