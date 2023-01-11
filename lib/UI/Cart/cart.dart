import 'package:flutter/material.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/Home/home.dart';
import 'package:graduation_project/UI/Order/order.dart';
import 'package:graduation_project/UI/ServicesScreen/formprovider.dart';
import 'package:graduation_project/Widgets/AppDrawer.dart';
import 'package:graduation_project/Widgets/cartButton.dart';
import 'package:graduation_project/Widgets/cartItem.dart';
import 'package:graduation_project/Widgets/serviceHeader.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    FormProvider provider = Provider.of<FormProvider>(context, listen: false);
    return Scaffold(
        body: AppDrawer(
            auth: Auth(),
            child: Container(
              color: Color.fromRGBO(62, 71, 84, 1),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ServiceHeader(
                          title: "Cart",
                        ),
                      ),
                      Consumer<FormProvider>(
                          builder: (buildContext, formProvider, _) {
                        return (formProvider.cart != null)
                            ? ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: formProvider.cart.length,
                                itemBuilder: (ctx, index) {
                                  final items = formProvider.cart[index];
                                  return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CartItemCard(
                                        data: items,
                                      ));
                                })
                            : Align(
                                alignment: Alignment.center,
                                child: Center(child: Text("Cart is Empty")));
                      }),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CartButton(
                                text: "Cancel",
                                action: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                }),
                            CartButton(
                                text: "Checkout",
                                action: () {
                                  provider.checkout();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Order(
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      )
                    ]),
              ),
            )));
  }
}
