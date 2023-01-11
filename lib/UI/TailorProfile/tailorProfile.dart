import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/Products/productsProvider.dart';
import 'package:graduation_project/UI/TailorProfile/servicesProvider.dart';
import 'package:graduation_project/Widgets/AppDrawer.dart';
import 'package:graduation_project/Widgets/customButton.dart';
import 'package:graduation_project/Widgets/customUI/customLayout.dart';
import 'package:graduation_project/Widgets/customUI/menuIcon.dart';
import 'package:graduation_project/Widgets/logo.dart';
import 'package:graduation_project/Widgets/product_card.dart';
import 'package:graduation_project/Widgets/reviewCard.dart';
import 'package:graduation_project/Widgets/sectionHeader.dart';
import 'package:graduation_project/Widgets/servicesCard.dart';
import 'package:provider/provider.dart';

class TailorProfile extends StatefulWidget {
  final tailor;
  const TailorProfile({@required this.tailor});
  @override
  _TailorProfileState createState() => _TailorProfileState();
}

class _TailorProfileState extends State<TailorProfile> {
  calculateAverageRate() {
    double average;
    double sum = 0;
    for (int i = 0; i < widget.tailor.reviews.length; i++) {
      sum = sum + widget.tailor.reviews[i].rate;
    }
    average = sum / widget.tailor.reviews.length;
    return average;
  }

  @override
  Widget build(BuildContext context) {
    var average;
    if (widget.tailor.reviews != null) {
      average = calculateAverageRate().toString();
    }
    return Scaffold(
        body: AppDrawer(
          auth: Auth(),
                  child: SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.26,
                // fit: FlexFit.loose,
                child: Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    color: Color.fromRGBO(62, 71, 84, 1),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: CustomLayOut(),
                        ),
                        AppBar(
                          toolbarHeight: 80,
                          elevation: 0,
                          backgroundColor: Color.fromRGBO(62, 71, 84, 1),
                          leading: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10.0),
                            child: MenuIcon(),
                          ),
                          primary: false,
                          actions: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(tailor: widget.tailor,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(),
                  Positioned(
                    top: 50.0,
                    left: 0,
                    right: 0,
                    child: Hero(
                        tag: 'TailorLogo${widget.tailor.name}',
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: (widget.tailor.logo != null)
                                    ? AssetImage(
                                        'assets/images/${widget.tailor.logo}',
                                      )
                                    : AssetImage(
                                        'assets/images/needle.jpg',
                                      ),
                              )),
                          // child:
                        ),
                      ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    widget.tailor.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Text(widget.tailor.address.city),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: RatingBarIndicator(
                    rating: calculateAverageRate(),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    direction: Axis.horizontal,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 8.0, left: 50.0, right: 50, bottom: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.tailor.description,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Container(
                color: Color.fromRGBO(216, 216, 222, 1),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        color: Color.fromRGBO(62, 71, 84, 1),
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                          children: [
                            SectionHeader(
                              title: "Services",
                            ),
                            ChangeNotifierProvider<ServicesProvider>.value(
                              value: ServicesProvider(),
                              child: Expanded(
                                child: Consumer<ServicesProvider>(
                                    builder: (buildContext, servicesProvider, _) {
                                  return (servicesProvider.services != null)
                                      ? ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: 8,
                                          itemBuilder: (ctx, index) {
                                            final service =
                                                servicesProvider.services[index];
                                            return Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: ServiceCard(
                                                  serviceName: service.serviceName,
                                                ));
                                          })
                                      : Align(
                                          alignment: Alignment.center,
                                          child: Center(
                                              child: CircularProgressIndicator(
                                            valueColor:
                                                new AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          )));
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Container(
                        color: Color.fromRGBO(62, 71, 84, 1),
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          children: [
                            SectionHeader(
                              title: "Products",
                            ),
                            ChangeNotifierProvider<ProductsProvider>.value(
                              value: ProductsProvider(),
                              // create: (context) => PeopleProvider(),
                              child: Expanded(
                                child: Consumer<ProductsProvider>(
                                    builder: (buildContext, productProvider, _) {
                                  return (productProvider.products != null)
                                      ? ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount:
                                              widget.tailor.previousWork.length,
                                          itemBuilder: (ctx, index) {
                                            final products =
                                                widget.tailor.previousWork[index];
                                            return Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: ProductCard(
                                                  product: products,
                                                ));
                                          })
                                      : Align(
                                          alignment: Alignment.center,
                                          child: Center(
                                              child: CircularProgressIndicator(
                                            valueColor:
                                                new AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          )));
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Container(
                        color: Color.fromRGBO(189, 190, 200, 1),
                        child: Column(
                          children: [
                            Container(
                              color: Color.fromRGBO(62, 71, 84, 1),
                              height: MediaQuery.of(context).size.height * 0.17,
                              child: SectionHeader(
                                title: "Reviews",
                              ),
                            ),
                            (widget.tailor.reviews != null) ?
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 50.0),
                                  child: Text(
                                    average,
                                    style: TextStyle(
                                        fontSize: 65,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(62, 71, 84, 1)),
                                  ),
                                ),
                                Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: RatingBarIndicator(
                                rating: calculateAverageRate(),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(62, 71, 84, 1),
                                ),
                                itemCount: 5,
                                itemSize: 50.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                "Based on ${widget.tailor.reviews.length} reviews.",
                                style: TextStyle(
                                    color: Color.fromRGBO(62, 71, 84, 1),
                                    fontSize: 16),
                              ),
                            ),
                            Container(
                              color: Color.fromRGBO(189, 190, 200, 1),
                              height: MediaQuery.of(context).size.height * 0.23 * widget.tailor.reviews.length,
                              child: (widget.tailor.reviews != null)
                                  ? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: widget.tailor.reviews.length,
                                      itemBuilder: (ctx, index) {
                                        final reviews =
                                            widget.tailor.reviews[index];
                                        return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: ReviewCard(
                                              rate: reviews.rate,
                                              comment: reviews.comment,
                                            ));
                                      })
                                  : Align(
                                      alignment: Alignment.center,
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ))),
                            )],
                            ):
                            Text("No Reviews")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
        ),
      ),
    ),
        ));
  }
}
