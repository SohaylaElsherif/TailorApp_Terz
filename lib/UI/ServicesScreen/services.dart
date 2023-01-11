import 'package:flutter/material.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/Cart/cart.dart';
import 'package:graduation_project/UI/ServicesScreen/formprovider.dart';
import 'package:graduation_project/Widgets/AppDrawer.dart';
import 'package:graduation_project/Widgets/serviceHeader.dart';
import 'package:graduation_project/Widgets/serviceButton.dart';
import 'package:graduation_project/Widgets/serviceDropdown.dart';
import 'package:graduation_project/Widgets/uploadImage.dart';
import 'package:provider/provider.dart';

class Services extends StatefulWidget {
  final service;
  const Services({this.service});

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final label = "Add To Cart";

  @override
  Widget build(BuildContext context) {
    FormProvider provider = Provider.of<FormProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      provider.setServiceName(widget.service);
    });
    return Scaffold(
      // backgroundColor: Color.fromRGBO(62, 71, 84, 1),
      body: AppDrawer(
        auth: Auth(),
        child: Container(
          color: Color.fromRGBO(62, 71, 84, 1),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: ServiceHeader(
                    title: widget.service,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    color: Color.fromRGBO(189, 190, 200, 1),
                    child: ServiceDropDown(
                      text: "Garment Type",
                      values: [
                        'Shirt',
                        'Trousers',
                        'Suit',
                        'Dress',
                        'Blouse',
                        'Jacket'
                      ],
                      target: "Garment",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    color: Color.fromRGBO(212, 212, 220, 1),
                    child: ServiceDropDown(
                      text: "Fabric Type",
                      values: [
                        'Cotton',
                        'Polyester',
                        'Spandix',
                        'Denim',
                        'Chiffon',
                        'Sherpa',
                        'Wool',
                        'Silk',
                        'Leather'
                      ],
                      target: "Fabric",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: UploadImage()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 12.0),
                  child: Text(
                    "Have a Note ?",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(244, 181, 86, 1)),
                  ),
                ),
                Container(
                  color: Color.fromRGBO(212, 212, 220, 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: TextField(
                      onChanged: (value) {
                        provider.addNote(value);
                      },
                      minLines: 5,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: "Enter your note",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ServiceButton(
                        text: "View my cart",
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cart(),
                            ),
                          );
                        },
                      ),
                      ServiceButton(
                        text: "Add to my cart",
                        action: () {
                          setState(() {
                            provider.addToCart();
                          });
                        },
                        icon: "cart",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
