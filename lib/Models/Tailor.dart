


// To parse this JSON data, do
//
//     final tailors = tailorsFromJson(jsonString);

import 'dart:convert';

Tailors tailorsFromJson(String str) => Tailors.fromJson(json.decode(str));
Tailor tailorFromJson(String str) => Tailor.fromJson(json.decode(str));
Order orderFromJson(String str) => Order.fromJson(json.decode(str));
String tailorsToJson(Tailors data) => json.encode(data.toJson());

class Tailors {
    Tailors({
        this.orders,
        this.products,
        this.services,
        this.tailors,
        this.users,
        this.measurements,
    });

    List<Order> orders;
    List<Product> products;
    List<Service> services;
    List<Tailor> tailors;
    List<User> users;
    Map<String, int> measurements;

    factory Tailors.fromJson(Map<String, dynamic> json) => Tailors(
        orders: List<Order>.from(json["Orders"].map((x) => Order.fromJson(x))),
        products: List<Product>.from(json["Products"].map((x) => Product.fromJson(x))),
        services: List<Service>.from(json["Services"].map((x) => Service.fromJson(x))),
        tailors: List<Tailor>.from(json["Tailors"].map((x) => Tailor.fromJson(x))),
        users: List<User>.from(json["Users"].map((x) => User.fromJson(x))),
        measurements: Map.from(json["measurements"]).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toJson() => {
        "Orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "Products": List<dynamic>.from(products.map((x) => x.toJson())),
        "Services": List<dynamic>.from(services.map((x) => x.toJson())),
        "Tailors": List<dynamic>.from(tailors.map((x) => x.toJson())),
        "Users": List<dynamic>.from(users.map((x) => x.toJson())),
        "measurements": Map.from(measurements).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Order {
    Order({
        this.orderDetails,
        this.orderStatus,
        this.userId,
    });

    List<OrderDetail> orderDetails;
    String orderStatus;
    String userId;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromJson(x))),
        orderStatus: json["order_status"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "order_details": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
        "order_status": orderStatus,
        "user_id": userId,
    };
}

class OrderDetail {
    OrderDetail({
        this.fabric,
        this.garment,
        this.note,
        this.serviceName,
        this.file,
    });

    String fabric;
    String garment;
    String note;
    String serviceName;
    String file;

    factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        fabric: json["fabric"],
        garment: json["garment"],
        note: json["note"] == null ? null : json["note"],
        serviceName: json["serviceName"],
        file: json["file"] == null ? null : json["file"],
    );

    Map<String, dynamic> toJson() => {
        "fabric": fabric,
        "garment": garment,
        "note": note == null ? null : note,
        "serviceName": serviceName,
        "file": file == null ? null : file,
    };
}

class Product {
    Product({
        this.productImage,
        this.productName,
        this.tailorId,
    });

    String productImage;
    String productName;
    int tailorId;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productImage: json["product_image"],
        productName: json["product_name"],
        tailorId: json["tailor_id"],
    );

    Map<String, dynamic> toJson() => {
        "product_image": productImage,
        "product_name": productName,
        "tailor_id": tailorId,
    };
}

class Service {
    Service({
        this.serviceName,
    });

    String serviceName;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceName: json["service_name"],
    );

    Map<String, dynamic> toJson() => {
        "service_name": serviceName,
    };
}

class Tailor {
    Tailor({
        this.address,
        this.description,
        this.logo,
        this.mobile,
        this.name,
        this.previousWork,
        this.reviews,
        this.services,
    });

    Address address;
    String description;
    String logo;
    String mobile;
    String name;
    List<PreviousWork> previousWork;
    List<Review> reviews;
    List<ServiceElement> services;

    factory Tailor.fromJson(Map<String, dynamic> json) => Tailor(
        address: Address.fromJson(json["address"]),
        description: json["description"],
        logo: json["logo"] == null ? null : json["logo"],
        mobile: json["mobile"],
        name: json["name"],
        previousWork: List<PreviousWork>.from(json["previous_work"].map((x) => PreviousWork.fromJson(x))),
        reviews: json["reviews"] == null ? null : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        services: json["services"] == null ? null : List<ServiceElement>.from(json["services"].map((x) => ServiceElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "description": description,
        "logo": logo == null ? null : logo,
        "mobile": mobile,
        "name": name,
        "previous_work": List<dynamic>.from(previousWork.map((x) => x.toJson())),
        "reviews": reviews == null ? null : List<dynamic>.from(reviews.map((x) => x.toJson())),
        "services": services == null ? null : List<dynamic>.from(services.map((x) => x.toJson())),
    };
}

class Address {
    Address({
        this.city,
        this.street,
    });

    String city;
    String street;

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        street: json["street"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
    };
}

class PreviousWork {
    PreviousWork({
        this.productId,
        this.productImage,
        this.productName,
        this.prdouctId,
    });

    int productId;
    String productImage;
    String productName;
    int prdouctId;

    factory PreviousWork.fromJson(Map<String, dynamic> json) => PreviousWork(
        productId: json["product_id"] == null ? null : json["product_id"],
        productImage: json["product_image"],
        productName: json["product_name"],
        prdouctId: json["prdouct_id"] == null ? null : json["prdouct_id"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "product_image": productImage,
        "product_name": productName,
        "prdouct_id": prdouctId == null ? null : prdouctId,
    };
}

class Review {
    Review({
        this.comment,
        this.rate,
        this.userId,
    });

    String comment;
    double rate;
    int userId;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        comment: json["comment"],
        rate: json["rate"].toDouble(),
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "comment": comment,
        "rate": rate,
        "user_id": userId,
    };
}

class ServiceElement {
    ServiceElement({
        this.price,
        this.serviceName,
    });

    String price;
    String serviceName;

    factory ServiceElement.fromJson(Map<String, dynamic> json) => ServiceElement(
        price: json["price"],
        serviceName: json["service_name"],
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "service_name": serviceName,
    };
}

class User {
    User({
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
    List<OrderElement> orders;
    Map<String, int> userMeasurment;
    UserAddress userAddress;
    String userEmail;
    String userGender;
    String userName;
    String userPhone;

    factory User.fromJson(Map<String, dynamic> json) => User(
        dependents: List<Dependent>.from(json["Dependents"].map((x) => Dependent.fromJson(x))),
        orders: List<OrderElement>.from(json["orders"].map((x) => OrderElement.fromJson(x))),
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

class OrderElement {
    OrderElement({
        this.orderDetails,
        this.orderId,
        this.orderState,
    });

    String orderDetails;
    int orderId;
    String orderState;

    factory OrderElement.fromJson(Map<String, dynamic> json) => OrderElement(
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
