import 'package:flutter/material.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/TailorsList/tailorsListProvider.dart';
import 'package:graduation_project/Widgets/AppDrawer.dart';
import 'package:graduation_project/Widgets/customUI/customLayout.dart';
import 'package:graduation_project/Widgets/customUI/menuIcon.dart';
import 'package:graduation_project/Widgets/price_card.dart';
import 'package:provider/provider.dart';

class Hire extends StatelessWidget {
  final tailor;
  const Hire({this.tailor});
  @override
  Widget build(BuildContext context) {
    print(tailor.services);
    return Scaffold(
        body: AppDrawer(
      auth: Auth(),
      child: Container(
        color: Color.fromRGBO(62, 71, 84, 1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 8.0),
              child: Row(
                children: [
                  MenuIcon(),
                  Padding(
                     padding: const EdgeInsets.only(left: 100.0),
                    child: Text(
                      "Pricing",
                      style: TextStyle(
                          color: Color.fromRGBO(244, 181, 86, 1),
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            CustomLayOut(),
            Expanded(
                child: (tailor.services != null)
                    ? GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: tailor.services.length,
                        itemBuilder: (ctx, index) {
                          final service = tailor.services[index];
                          return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: PriceCard(
                                service: service,
                              ));
                        })
                    : Align(
                        alignment: Alignment.center,
                        child: Center(
                            child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white),
                        )))),
          ],
        ),
      ),
    ));
  }
}
