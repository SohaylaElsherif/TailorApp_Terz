import 'package:flutter/material.dart';
import 'package:graduation_project/Models/Tailor.dart';
import 'package:graduation_project/Repository/tailorsRepository.dart';

class ProductsProvider extends ChangeNotifier {
  String _searchText = "";
  List<Product> products;
  List<Tailor> tailors;
  List<Product> filteredList = [];
  TailorsRepository _tailorsRepository = TailorsRepository();

  ProductsProvider() {
    getProducts();
  }

  void changeSearchString(String searchString) {
    _searchText = searchString;
    // print(_searchText);
    if (_searchText.isEmpty) {
      filteredList.clear();
    } else {
      // print(products);
      filteredList = products.where((product) =>product.productName.toLowerCase().contains(_searchText.toLowerCase())).toList();
      // print(filteredList);
      notifyListeners();
    }
  }

  void getProducts() async {
    await _tailorsRepository.fetchTailors().then((newData) {
      // print(newData);
      tailors = newData.tailors;
      products = newData.products;
      notifyListeners();
    });
  }
}
