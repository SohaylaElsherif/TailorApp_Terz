import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/customUI/icons.dart';
import 'EditProfilePage.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';

import 'Measurments.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                decoration: BoxDecoration(
                  color: PrimaryDarkColor,
                  borderRadius:BorderRadius.only(bottomRight:Radius.circular(40),bottomLeft: Radius.circular(40),
                  ),
                ),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: [6],
                  strokeWidth: 1,
                  color: Colors.white,
                  radius: Radius.elliptical(40, 40),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "My Profile",
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child:Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4,
                                        color: Theme.of(context).scaffoldBackgroundColor),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 10))
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                      ),
                                    ),
                                  ),
                                ),
                                // child: CircleAvatar(
                                //   radius: 60,
                                //     backgroundImage: NetworkImage(
                                //            "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                //     ),
                                // ),
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Expanded(
                                flex:2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      "username",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height:10.0,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.email_outlined,
                                          color: PrimaryAssentColor,
                                          size: 20.0,
                                          semanticLabel: 'useremail@gmail.com',
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text("useremail@gmail.com",style: TextStyle(color:SecondryColorLight),),
                                      ],
                                    ),
                                    SizedBox(
                                      height:5.0,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: SecondryColorLight,
                                          size: 20.0,
                                          semanticLabel: 'Address',
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text('Address',style: TextStyle(color:PrimaryAssentColor),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    InkWell(
                                      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => EditProfilePage())),
                                      child: Container(
                                        height: 25.0,
                                        width: 60.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: PrimaryAssentColor,
                                          ),
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Edit",
                                            style:
                                            TextStyle(color: PrimaryAssentColor, fontSize: 16.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                elevation: 20,
                shadowColor: PrimaryDarkColor,
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                  decoration: BoxDecoration(
                    color: PrimaryDarkColor,
                    borderRadius:BorderRadius.only(topRight:Radius.circular(40),topLeft: Radius.circular(40),
                    ),
                  ),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: [6],
                    strokeWidth: 1,
                    color: Colors.white,
                    radius: Radius.elliptical(40, 40),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Measurements",style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color:PrimaryAssentColor,
                          ),),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Your Measurements",style: TextStyle(
                            fontSize: 16.0,
                            color:Colors.white,
                          ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) => Measurements()));},
                                  color:PrimaryAssentColor,
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "username",
                                    style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 2.2,
                                        color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Add Another Measurements for ",style: TextStyle(
                            fontSize: 16.0,
                            color:Colors.white,
                          ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Measurements()));
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                                color:
                                SecondryColorLight,
                              ),
                              child: Icon(
                                MyFlutterApp.male,
                                color: PrimaryDarkColor,
                                size: 50,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Measurements()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.all(Radius.circular(40),
                                ),
                                color:
                                 SecondryColorLight,
                              ),
                              height: 80,
                              width: 80,
                              child: Icon(
                                MyFlutterApp.female,
                                color:PrimaryDarkColor,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
