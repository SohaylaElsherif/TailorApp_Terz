import 'package:flutter/material.dart';
import 'package:graduation_project/UI/ServicesScreen/formprovider.dart';
import 'package:provider/provider.dart';
import 'customUI/colors.dart';

class CartButton extends StatelessWidget {
  final text;
  final action;
  const CartButton({@required this.text, @required this.action});
  @override
  Widget build(BuildContext context) {
    FormProvider provider = Provider.of<FormProvider>(context, listen: false);
    return SizedBox(
      width: 160,
      height: 60,
      child: ElevatedButton(
        onPressed: action,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(PrimaryAssentColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.black)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,
                  style: TextStyle(
                      color: Color.fromRGBO(62, 71, 84, 1), fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
