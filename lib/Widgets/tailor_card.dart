import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/UI/TailorProfile/tailorProfile.dart';

class TailorCard extends StatelessWidget {
  final tailor;

  const TailorCard({Key key, this.tailor}) : super(key: key);
  calculateAverageRate() {
    double average;
    double sum = 0;
    for (int i = 0; i < tailor.reviews.length; i++) {
      sum = sum + tailor.reviews[i].rate;
    }
    average = sum / tailor.reviews.length;
    return average;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TailorProfile(
              tailor: tailor,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20),
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
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Hero(
                        tag: 'TailorLogo${tailor.name}',
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: (tailor.logo != null)
                                    ? AssetImage(
                                        'assets/images/${tailor.logo}',
                                      )
                                    : AssetImage(
                                        'assets/images/needle.jpg',
                                      ),
                              )),
                          // child:
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              tailor.name,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              tailor.address.city,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          (tailor.reviews != null)
                              ? Padding(
                                  padding: const EdgeInsets.all(2.0),
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
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text("No Reviews yet"))
                        ],
                      ),
                    ),
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
