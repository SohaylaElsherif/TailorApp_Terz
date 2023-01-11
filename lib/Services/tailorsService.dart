import 'dart:convert';

import 'package:graduation_project/Models/Tailor.dart';
import 'package:graduation_project/Models/filteredTailors.dart';
import 'package:http/http.dart' as http;

class TailorService {
  Future<Tailors> fetchTailors() async {
    final response = await http.get(Uri.parse(
        'https://tailorapp-6e6fc-default-rtdb.firebaseio.com/.json?print=pretty'));
    if (response.statusCode == 200) {
      // print(response.body);
      return tailorsFromJson(response.body);
    } else {
      throw Exception('FAILED TO LOAD POST');
    }
  }

  Future<List<FilteredTailors>> fetchTailor(String name) async {
    var list = [];
    // var outputMap = {};
    String word = name.substring(0, 1).toUpperCase() + name.substring(1);
    final response = await http.get(Uri.parse(
        'https://tailorapp-6e6fc-default-rtdb.firebaseio.com/Tailors.json?orderBy="name"&startAt="$word"&endAt="$word\\uf8ff"&print=pretty'));
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      print(map.keys);
      // for (var i = 0; i < map.length; i++) {
      //   print(map["2"]);
      //   list.add(map["2"]);
      // }
      map.keys.forEach((k) => list.add(map["$k"]));
      var toJson = json.encode(list);
      print(toJson);
      return filteredTailorsFromJson(toJson);
    } else {
      throw Exception('FAILED TO LOAD POST');
    }
  }

  Future<Order> fetchOrders(String id) async {
    final response = await http.get(Uri.parse(
        "https://tailorapp-6e6fc-default-rtdb.firebaseio.com/Orders.json?orderBy='user_id'&equalTo='$id'&print=pretty"));
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      print(map["order_status"]);
      return orderFromJson(response.body);
    } else {
      throw Exception('FAILED TO LOAD POST');
    }
  }
}
