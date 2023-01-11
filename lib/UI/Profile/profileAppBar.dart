import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';
import 'package:graduation_project/Widgets/customUI/menuIcon.dart';
import 'package:provider/provider.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<DocumentSnapshot>(context);
    Map<String, dynamic> UserListMap;
    if (userInfo != null) {
      UserListMap = Map.from(userInfo.data());
    }
    if (userInfo != null) {
      return AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Color.fromRGBO(62, 71, 84, 1),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          child: MenuIcon(),
        ),
        primary: false,
        title: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60.0, top: 30.0),
              child: Text(
                UserListMap['userName'],
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: PrimaryAssentColor),
              ),
            ),
          ],
        )),
      );
    } else {
      return Align(
          alignment: Alignment.center,
          child: Center(
              child: Text("")));
    }
  }
}
