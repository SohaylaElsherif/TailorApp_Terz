import 'package:flutter/material.dart';
import 'package:graduation_project/UI/ServicesScreen/services.dart';

class ServiceCard extends StatelessWidget {
  final serviceName;
  const ServiceCard({this.serviceName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
            Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Services(
              service: serviceName,
            ),
          ),
        );
          },
          child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          children: [
            Card(
              color: Color.fromRGBO(189, 190, 200, 1),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset("assets/images/$serviceName.png",
                width: 65,
                height: 65,),
              ),
            ),
            Text(
              serviceName,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
