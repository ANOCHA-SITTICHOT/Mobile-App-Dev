// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Product welcomeFromJson(String str) => Product.fromJson(json.decode(str));

String welcomeToJson(Product data) => json.encode(data.toJson());

class Product {
    int id;
    String title;
    String description;
    int price;
    double star;
    String imageUrl;

    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.star,
        required this.imageUrl,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        star: json["star"].toDouble(),
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "star": star,
        "imageUrl": imageUrl,
    };
}
