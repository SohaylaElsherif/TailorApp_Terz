import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:graduation_project/UI/TailorProfile/tailorProfile.dart';

class ProductCard extends StatelessWidget {
  final product;
  final tailor;

  const ProductCard({Key key, this.product, this.tailor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TailorProfile(
              tailor: tailor[product.tailorId],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: Card(
            color: Color.fromRGBO(216, 216, 222, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: [6],
                strokeWidth: 1,
                radius: Radius.circular(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.rectangle,
                            color: Color.fromRGBO(62, 71, 84, 1),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/images/${product.productImage}',
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        product.productName,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    (tailor != null)
                        ? Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              tailor[product.tailorId].name,
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        : Text(""),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
