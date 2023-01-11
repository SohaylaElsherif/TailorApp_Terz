// To parse this JSON data, do
//
//     final filteredTailors = filteredTailorsFromJson(jsonString);

import 'dart:convert';

List<FilteredTailors> filteredTailorsFromJson(String str) => List<FilteredTailors>.from(json.decode(str).map((x) => FilteredTailors.fromJson(x)));

String filteredTailorsToJson(List<FilteredTailors> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilteredTailors {
    FilteredTailors({
        this.address,
        this.description,
        this.logo,
        this.mobile,
        this.name,
        this.previousWork,
        this.reviews,
    });

    Address address;
    String description;
    String logo;
    String mobile;
    String name;
    List<PreviousWork> previousWork;
    List<Review> reviews;

    factory FilteredTailors.fromJson(Map<String, dynamic> json) => FilteredTailors(
        address: Address.fromJson(json["address"]),
        description: json["description"],
        logo: json["logo"],
        mobile: json["mobile"],
        name: json["name"],
        previousWork: List<PreviousWork>.from(json["previous_work"].map((x) => PreviousWork.fromJson(x))),
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "description": description,
        "logo": logo,
        "mobile": mobile,
        "name": name,
        "previous_work": List<dynamic>.from(previousWork.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
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
    });

    int productId;
    String productImage;
    String productName;

    factory PreviousWork.fromJson(Map<String, dynamic> json) => PreviousWork(
        productId: json["product_id"],
        productImage: json["product_image"],
        productName: json["product_name"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_image": productImage,
        "product_name": productName,
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
