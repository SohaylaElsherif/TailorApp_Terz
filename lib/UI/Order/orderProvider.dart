// import 'package:flutter/material.dart';
// import 'package:graduation_project/Models/Tailor.dart';
// import 'package:graduation_project/Repository/tailorsRepository.dart';
// import 'package:graduation_project/Services/auth.dart';

// class OrderProvider extends ChangeNotifier {
//   String data;
//   List<Tailor> list = [];
//   TailorsRepository _tailorsRepository = TailorsRepository();

//   getOrders(String id) async {
//     await _tailorsRepository.fetchOrders(id).then((newOrders) {
//       print(newOrders);
//       data = newOrders.orderStatus;
//       notifyListeners();
//     });
//   }
// }
