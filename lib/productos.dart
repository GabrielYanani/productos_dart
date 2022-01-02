// To parse this JSON data, do
//
//     final productos = productosFromJson(jsonString);

import 'dart:convert';

List<Productos> productosFromJson(String str) => List<Productos>.from(json.decode(str).map((x) => Productos.fromJson(x)));

String productosToJson(List<Productos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Productos {
    Productos({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.image,
        required this.category,
        required this.rating,
    });

    final int id;
    final String title;
    final double price;
    final String description;
    final String image;
    final String category;
    final Rating rating;

    factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        image: json["image"],
        category: json["category"],
        rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
        "rating": rating.toJson(),
    };
}

class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    final double rate;
    final int count;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
