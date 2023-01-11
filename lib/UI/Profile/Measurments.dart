import 'package:flutter/material.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';
import 'package:graduation_project/Widgets/customUI/customLayout.dart';

import 'UserProfile1.dart';

class Measurements extends StatefulWidget {
  @override
  _MeasurementsState createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> {
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: PrimaryDarkColor,
            child: Column(
              children: [
                CustomLayOut(),
                SizedBox(height: 5,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => UserProfile()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "Measurements",
                        style: TextStyle(color:PrimaryAssentColor,fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "...",
                        style: TextStyle(color: PrimaryDarkColor),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: SecondryColorLight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Enter Your Name",style: TextStyle(color:PrimaryDarkColor,fontSize: 16,),),
                      // TextField(
                      //   // textAlign: TextAlign.center,
                      //   // controller: _usernameController,
                      //   // keyboardType: TextInputType.number,
                      //   // decoration: InputDecoration(
                      //   //   hintText: '',
                      //   //   border: OutlineInputBorder(
                      //   //     borderRadius: BorderRadius.circular(8),
                      //   //     borderSide: BorderSide(
                      //   //       width: 1,
                      //   //       style: BorderStyle.none,
                      //   //     ),
                      //   //   ),
                      //   //   contentPadding: EdgeInsets.all(16),
                      //   // ),
                      // ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: SecondryColorLightter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Width",style: TextStyle(color:PrimaryDarkColor,fontSize: 16,),),
                      // TextField(
                      //   // textAlign: TextAlign.center,
                      //   // controller: _usernameController,
                      //   // keyboardType: TextInputType.number,
                      //   // decoration: InputDecoration(
                      //   //   hintText: '',
                      //   //   border: OutlineInputBorder(
                      //   //     borderRadius: BorderRadius.circular(8),
                      //   //     borderSide: BorderSide(
                      //   //       width: 1,
                      //   //       style: BorderStyle.none,
                      //   //     ),
                      //   //   ),
                      //   //   contentPadding: EdgeInsets.all(16),
                      //   // ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
