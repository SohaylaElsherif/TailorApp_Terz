import 'package:flutter/material.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/Home/home.dart';
import 'package:graduation_project/UI/Order/orderProvider.dart';
import 'package:graduation_project/Widgets/AppDrawer.dart';
import 'package:graduation_project/Widgets/cartButton.dart';
import 'package:graduation_project/Widgets/customUI/colors.dart';
import 'package:graduation_project/Widgets/customUI/menuIcon.dart';
import 'package:provider/provider.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        //     OrderProvider provider =
        // Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      body: AppDrawer(
          auth: Auth(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/illustration.jpg")
                      )),
                ),
                Text("Thank you for using Terzi", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Your order status is: ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    ),
                    Text("Pending", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: PrimaryAssentColor),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: CartButton(text: "Go To Home", action: (){
                                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                  }),
                )
              ],
            ),
          )),
    );
  }
}
