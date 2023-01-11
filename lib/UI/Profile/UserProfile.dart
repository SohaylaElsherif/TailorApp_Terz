import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/Services/database.dart';
import 'package:graduation_project/UI/Profile/profileAppBar.dart';
import 'package:graduation_project/UI/Profile/profileImg.dart';
import 'package:graduation_project/UI/Profile/userInfo.dart';
import 'package:graduation_project/UI/Profile/userMesurment.dart';
import 'package:graduation_project/Widgets/AppDrawer.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';
import 'package:graduation_project/Widgets/customUI/customLayout.dart';
import 'package:graduation_project/Widgets/customUI/menuIcon.dart';
import 'package:graduation_project/Widgets/sectionHeader.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/Services/database.dart';

class UserProfile extends StatefulWidget {
  const UserProfile();
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<DocumentSnapshot>.value(
      value: DatabaseService().UserData,
      initialData: null,
      child: Scaffold(
          body: AppDrawer(
        auth: Auth(),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: Color.fromRGBO(62, 71, 84, 1),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: CustomLayOut(),
                          ),
                          ProfileAppBar(),
                        ],
                      ),
                    ),
                    Container(),
                    Positioned(
                      top: 80.0,
                      left: 0,
                      right: 180,
                      child: ProfileImg(),
                    ),
                  ]),
                ),
                UserInfo(),
                SingleChildScrollView(
                  child: Container(
                    color: Color.fromRGBO(62, 71, 84, 1),

                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: SectionHeader(
                              title: "Measurments",
                            ),
                          ),
                          StreamProvider<DocumentSnapshot>.value(
                              value:DatabaseService().getUserMeasurment,
                              initialData: null,
                              child: UserMeasurment()),
                        ],
                      ),

                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
// StreamProvider<DocumentSnapshot>.value(
//       value: DatabaseService().UserData,