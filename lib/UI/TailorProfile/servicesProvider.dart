import 'package:flutter/material.dart';
import 'package:graduation_project/Models/Tailor.dart';
import 'package:graduation_project/Repository/tailorsRepository.dart';

class ServicesProvider extends ChangeNotifier {
  List<Service> services;
  List<Tailor> tailors;
  TailorsRepository _tailorsRepository = TailorsRepository();

  ServicesProvider() {
    getProducts();
  }

  void getProducts() async {
    await _tailorsRepository.fetchTailors().then((newData) {
      // print(newData);
      tailors = newData.tailors;
      services = newData.services;
      notifyListeners();
    });
  }
}
