import 'dart:convert';
import 'dart:typed_data';

class Products {
  int id = 0;
  final String name;
  final String category;
  final String description;
  final Uint8List image;

  Products(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.image});

  Map<String, dynamic> toJson() {
    return {
      "p_name": name,
      "description": description,
      "imageUrl": base64Encode(image),
      "category": category
    };
  }

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json["id"] as int,
        name: json["p_name"] as String,
        description: json["description"] as String,
        image: json["imageUrl"] as Uint8List,
        category: json["category"] as String);
  }
}
