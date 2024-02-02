class Item {
  // int userId;
  // int id;
  String itemImage;
  String category;
  String itemName;
  String description;
  DateTime postedDate;
  bool isAvailable;

  Item({
    // required this.userId,
    // required this.id,
    required this.itemImage,
    required this.category,
    required this.itemName,
    required this.description,
    required String postedDateString,
    required this.isAvailable
  }) : postedDate = DateTime.parse(postedDateString);
}
