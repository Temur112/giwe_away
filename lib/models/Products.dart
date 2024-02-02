import 'dart:convert';
import 'dart:typed_data';

class Products {
  int id = 0;
  final String name;
  final String category;
  final String description;
  final Uint8List image;
  final DateTime postedDate;

  Products(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.image,
      required this.postedDate});

  Map<String, dynamic> toJson() {
    return {
      "p_name": name,
      "description": description,
      "imageUrl": base64Encode(image),
      "category": category
    };
  }

  factory Products.fromJson(Map<String, dynamic> json) {
    var imageBytes = json['imageUrl'];
    if (imageBytes is String) {
      // Convert the String to Uint8List (you need to define your own conversion logic)
      imageBytes = convertStringToUint8List(imageBytes);
    }

    return Products(
        id: json["id"] as int,
        name: json["p_name"] as String,
        description: json["description"] as String,
        image: imageBytes,
        category: json["category"] as String,
        postedDate: DateTime.parse(json["postedDate"]));
  }

  static Uint8List convertStringToUint8List(String stringValue) {
    // Your conversion logic here
    // For example, you might use utf8.encode or base64.decode
    return base64.decode(stringValue);
  }
}
