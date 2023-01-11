import 'dart:convert';

Customer CustomerFromJson(String str) => Customer.fromJson(json.decode(str));

String CustomerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    this.dependents,
    this.orders,
    this.userMeasurment,
    this.userAddress,
    this.userEmail,
    this.userGender,
    this.userName,
    this.userPhone,
  });

  List<Dependent> dependents;
  List<Order> orders;
  Map<String, int> userMeasurment;
  UserAddress userAddress;
  String userEmail;
  String userGender;
  String userName;
  String userPhone;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    dependents: List<Dependent>.from(json["Dependents"].map((x) => Dependent.fromJson(x))),
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
    userMeasurment: Map.from(json["user_Measurment"]).map((k, v) => MapEntry<String, int>(k, v)),
    userAddress: UserAddress.fromJson(json["user_address"]),
    userEmail: json["user_email"],
    userGender: json["user_gender"],
    userName: json["user_name"],
    userPhone: json["user_phone"],
  );

  Map<String, dynamic> toJson() => {
    "Dependents": List<dynamic>.from(dependents.map((x) => x.toJson())),
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    "user_Measurment": Map.from(userMeasurment).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "user_address": userAddress.toJson(),
    "user_email": userEmail,
    "user_gender": userGender,
    "user_name": userName,
    "user_phone": userPhone,
  };
}

class Dependent {
  Dependent({
    this.dependentMeasurment,
    this.dependentGender,
    this.dependentName,
  });

  Map<String, int> dependentMeasurment;
  String dependentGender;
  String dependentName;

  factory Dependent.fromJson(Map<String, dynamic> json) => Dependent(
    dependentMeasurment: Map.from(json["Dependent_Measurment"]).map((k, v) => MapEntry<String, int>(k, v)),
    dependentGender: json["Dependent_gender"],
    dependentName: json["Dependent_name"],
  );

  Map<String, dynamic> toJson() => {
    "Dependent_Measurment": Map.from(dependentMeasurment).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "Dependent_gender": dependentGender,
    "Dependent_name": dependentName,
  };
}

class Order {
  Order({
    this.orderDetails,
    this.orderId,
    this.orderState,
  });

  String orderDetails;
  int orderId;
  String orderState;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderDetails: json["order_details"],
    orderId: json["order_id"],
    orderState: json["order_state"],
  );

  Map<String, dynamic> toJson() => {
    "order_details": orderDetails,
    "order_id": orderId,
    "order_state": orderState,
  };
}

class UserAddress {
  UserAddress({
    this.city,
    this.street,
  });

  String city;
  String street;

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
    city: json["City"],
    street: json["Street"],
  );

  Map<String, dynamic> toJson() => {
    "City": city,
    "Street": street,
  };
}
