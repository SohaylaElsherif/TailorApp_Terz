import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:graduation_project/UI/Cart/cart.dart';
import 'package:graduation_project/Widgets/removeButton.dart';

class CartItemCard extends StatelessWidget {
  final tailor;
  final data;

  const CartItemCard({Key key, this.tailor, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20),
      child: Card(
        color: Color.fromRGBO(216, 216, 222, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: [6],
            strokeWidth: 1,
            radius: Radius.circular(12),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Service Name :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Text(data.serviceName, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Garment Type :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Text(data.garment, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Fabric Type :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Text(data.fabric, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  (data.file != null)
                      ? Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Attachment :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        )
                      : Text(""),
                  (data.file != null)
                      ? Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.file(data.file),
                        )
                      : Text(""),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RemoveButton(
                      item: data,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
