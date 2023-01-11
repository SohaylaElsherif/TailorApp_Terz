import 'package:flutter/material.dart';
import 'package:graduation_project/Models/Tailor.dart';
import 'package:graduation_project/Repository/tailorsRepository.dart';

class TailorsProvider extends ChangeNotifier {
  String _searchText = "";
  List<Tailor> data;
  List<Tailor> list = [];
  TailorsRepository _tailorsRepository = TailorsRepository();


  TailorsProvider() {
    getTailors();
  }



  void changeSearchString(String searchString) {
    _searchText = searchString;
    if (_searchText.isEmpty) {
      list.clear();
    } else {
      list = data.where((tailor) => tailor.name.toLowerCase().contains(_searchText.toLowerCase())).toList();
      notifyListeners();
    }
  }

  getTailors() async {
    await _tailorsRepository.fetchTailors().then((newTailors) {
      data = newTailors.tailors;
      notifyListeners();
    });
  }
}
