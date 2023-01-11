import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/Products/products.dart';
import 'package:graduation_project/UI/TailorsList/tailorsList.dart';
import 'package:graduation_project/Widgets/AppDrawer.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';
import 'package:graduation_project/Widgets/customUI/menuIcon.dart';
import 'package:graduation_project/Widgets/homeCard.dart';
import 'package:graduation_project/Widgets/logo.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final databaseRef = FirebaseDatabase.instance.reference();
  String data;

  void addData() {
    databaseRef.child('Tailors').child("2").set({'name': data, 'address': 'Smouha'});
  }

  void handleChange(String text) {
    setState(() {
      data = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
              body: AppDrawer(
          auth: Auth(),
                child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/images/backgroundImage.jpeg"),
                  fit: BoxFit.fill),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:20 ,left: 20),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: MenuIcon(color:PrimaryAssentColor,bg:PrimaryDarkColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CircularLogo(width: 250.0, height: 250.0,),
                ),
                Expanded(child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      HomeCard(title: "Tailors", path: TailorsList(title: "Tailors",), image: "scizzors",),
                    HomeCard(title: "Products", path: ProductsList(title: "Products",), image: "mannequin",)
                  ],))
              ],
            ),
          ),
        ),
      );// add scaffold here
  }
}
