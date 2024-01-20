class Item {
  // int userId;
  // int id;
  String itemImage;
  String category;
  String itemName;
  String description;
  DateTime postedDate;

  Item({
    // required this.userId,
    // required this.id,
    required this.itemImage,
    required this.category,
    required this.itemName,
    required this.description,
    required String postedDateString,
  }) : postedDate = DateTime.parse(postedDateString);
}
