import 'package:flutter/material.dart';
import 'package:graduation_project/UI/ServicesScreen/formprovider.dart';
import 'package:provider/provider.dart';
import 'customUI/colors.dart';

class ServiceButton extends StatelessWidget {
  final text;
  final action;
  final icon;
  const ServiceButton({@required this.text, @required this.action, this.icon});
  @override
  Widget build(BuildContext context) {
    FormProvider provider = Provider.of<FormProvider>(context, listen: false);
    return SizedBox(
      width: 180,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: TextStyle(
                      color: Color.fromRGBO(62, 71, 84, 1), fontSize: 16)),
              (icon != null)
                  ? Image.asset(
                      "assets/images/$icon.png",
                      width: 30,
                      height: 30,
                    )
                  : ClipOval(
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Color.fromRGBO(62, 71, 84, 1),
                        child: Center(
                            child: (provider.cart != null)
                                ? Text(
                                    provider.getCartLength().toString(),
                                    style: TextStyle(
                                        color: Color.fromRGBO(244, 181, 96, 1)),
                                  )
                                : Text(
                                    "0",
                                    style: TextStyle(
                                        color: Color.fromRGBO(244, 181, 96, 1)),
                                  )),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
