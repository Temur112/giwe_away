import 'package:flutter_test/flutter_test.dart';
import 'package:giwe_away/Widgets/items_card.dart';

void main() {
  group('Unit Tests', () {
    test('Item constructor test', () {
      // Arrange
      const postedDateString = '2022-01-01';


      final Item testItem = Item(
        itemImage: 'assets/images/headphone.png',
        category: 'techs',
        itemName: 'headphones',
        description: 'Very Good',
        postedDateString: postedDateString, isAvailable: false,
      );

      // Assert
      expect(testItem.itemImage, 'assets/images/headphone.png');
      expect(testItem.category, 'techs');
      expect(testItem.itemName, 'headphones');
      expect(testItem.description, 'Very Good');
      expect(testItem.postedDate, DateTime.parse(postedDateString));

      // Print statements
      print('Item constructor test passed!');
      print('Item Image: ${testItem.itemImage}');
      print('Item Category: ${testItem.category}');
      print('Item Name: ${testItem.itemName}');
      print('Item Description: ${testItem.description}');
      print('Item Posted Date: ${testItem.postedDate}');
    });

    // Add more unit tests for other functions or methods as needed
  });
}
