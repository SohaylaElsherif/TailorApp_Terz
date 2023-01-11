import 'package:flutter/material.dart';
import 'package:graduation_project/UI/ServicesScreen/formprovider.dart';
import 'package:provider/provider.dart';
import 'customUI/colors.dart';

class RemoveButton extends StatelessWidget {
  final item;
  const RemoveButton({this.item});
  @override
  Widget build(BuildContext context) {
    FormProvider provider = Provider.of<FormProvider>(context, listen: false);
    return SizedBox(
      width: 120,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          provider.removeFromCart(item);
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.black)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Remove",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
