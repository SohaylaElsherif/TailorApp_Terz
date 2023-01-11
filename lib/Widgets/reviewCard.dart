import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/Widgets/logo.dart';

class ReviewCard extends StatelessWidget {
  final double rate;
  final userName;
  final comment;
  const ReviewCard({this.userName, this.rate, this.comment});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Color.fromRGBO(62, 71, 84, 1),
              thickness: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircularLogo(
                  height: 45.0,
                  width: 45.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text("Mohamed Alaa", style: TextStyle(fontSize: 16),),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: rate,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Color.fromRGBO(62, 71, 84, 1),
                            ),
                            itemCount: 5,
                            itemSize: 15.0,
                            direction: Axis.horizontal,
                          ),
                          Text(rate.toString(), style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1)),)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(comment),
          )
        ],
      ),
    );
  }
}
