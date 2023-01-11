import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/UI/TailorsList/tailorsList.dart';

class HomeCard extends StatelessWidget {
  final path, image, title;
  const HomeCard({Key key, this.path, this.image, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => path,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color.fromRGBO(62, 71, 84, 1),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: [6],
              strokeWidth: 1,
              color: Colors.white,
              radius: Radius.circular(12),
              child: Container(
                height: 300,
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Image.asset('assets/images/$image.png',
                      width: 300,
                      height: 200,)
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                          fontSize: 18, color: Color.fromRGBO(244, 181, 86, 1)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}
