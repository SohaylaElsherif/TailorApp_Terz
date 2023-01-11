import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class FormProvider extends ChangeNotifier {
  var _dropDownGarmentValue;
  var _dropDownFabricValue;
  var _uuid = Uuid();
  String _serviceName;
  String _note;
  File _imageFile;
  List cart = [];
  List cart1 = [];
  var orderNo = 1;

  void setServiceName(name) {
    _serviceName = name;
    notifyListeners();
  }

  int getCartLength() {
    return cart.length;
  }

  void filePath(File file) {
    _imageFile = file;
    notifyListeners();
  }

  void changeDropDownGarmentValue(value) {
    _dropDownGarmentValue = value;
    notifyListeners();
  }

  void changeDropDownFabricValue(value) {
    _dropDownFabricValue = value;
    notifyListeners();
  }

  void addNote(value) {
    _note = value;
    notifyListeners();
  }

  void addToCart() {
    var cartItem = CartItem(
        id: _uuid.v4(),
        serviceName: _serviceName,
        garment: _dropDownGarmentValue,
        fabric: _dropDownFabricValue,
        file: _imageFile,
        note: _note);
    if (_dropDownFabricValue != null &&
        _dropDownGarmentValue != null &&
        _serviceName != null) {
      cart.add(cartItem);
    }
  }

  void removeFromCart(item) {
    cart.removeWhere((element) => element.id == item.id);
  }

  List toList() {
    cart.forEach((item) {
      cart1.add(item.toString());
    });

    return cart1.toList();
  }

  void checkout() {
    var url =
        "https://tailorapp-6e6fc-default-rtdb.firebaseio.com/Orders/$orderNo.json";
    http.put(Uri.parse(url),
        body: json.encode({
          'user_id': Auth().currentUser.uid,
          'order_status': 'Pending',
        }));
    cart.asMap().forEach((index, cart) {
      http.put(
          Uri.parse(
              "https://tailorapp-6e6fc-default-rtdb.firebaseio.com/Orders/$orderNo/order_details/$index.json"),
          body: json.encode(
            {
              'serviceName': cart.serviceName,
              'garment': cart.garment,
              'fabric': cart.fabric,
              'file': cart.file.toString(),
              'note': cart.note
            },
          ));
    });

    cart.clear();
    cart1.clear();
    orderNo++;
  }

  Map<String, dynamic> toMap() => {
        "user_id": Auth().currentUser.uid,
        "order_details": this.cart,
        'order_status': 'Pending'
      };
}

class CartItem {
  final String serviceName;
  final String garment;
  final String fabric;
  final File file;
  final String note;
  final id;
  CartItem(
      {this.fabric,
      this.file,
      this.garment,
      this.note,
      this.id,
      this.serviceName});
}
