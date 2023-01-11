import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/Models/user.dart';
import 'package:graduation_project/Widgets/customUI/CustoUserData.dart';
import 'package:graduation_project/Widgets/customUI/CustomTextButton.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';
import 'package:graduation_project/Widgets/customUI/icons.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final TextEditingController _AddressController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFF3e5754),
            title: Text(
              'Edit Your Address',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: PrimaryAssentColor),
            ),
            content: Container(
              width: 50,
              height: 20,
              color: Color(0xFF3e5754),
              child: TextField(
                controller: _AddressController,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: PrimaryAssentColor,
                textColor: Color(0xFF3e5754),
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: PrimaryAssentColor,
                textColor: Color(0xFF3e5754),
                child: Text('Edit'),
                onPressed: () {
                  _editAddress();
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  Future<void> _editAddress() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"userAddress": _AddressController.text});
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<DocumentSnapshot>(context);
    Map<String, dynamic> UserListMap;
    if (userInfo != null) {
      UserListMap = Map.from(userInfo.data());
    }

    // print(UserListMap['userName']);
    if (userInfo != null) {
      return Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Column(
                children: [
                  CustomUserData(
                    text: UserListMap['userEmail'],
                    icon: Icons.email,
                  ),
                  CustomUserData(
                    text: UserListMap['userGender'],
                    icon: UserListMap['userGender'] == "female"
                        ? MyFlutterApp.female
                        : MyFlutterApp.male,
                  ),
                  CustomUserData(
                    text: UserListMap['userPhone'],
                    icon: FontAwesomeIcons.phone,
                  ),
                  CustomUserData(
                    text: UserListMap['userAddress'],
                    icon: Icons.location_city,
                  ),
                  CustomTextButton(
                      buttonAction: () {
                        _displayTextInputDialog(context);
                      },
                      child: Text(
                        "Edit Address",
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          color: SecondryColorLight,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Align(
          alignment: Alignment.center,
          child: Center(
              child: Text("")));
    }
  }
}
