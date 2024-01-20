import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:giwe_away/Widgets/main_widgets.dart';
import 'package:giwe_away/constants/api_constants.dart';
import 'package:http/http.dart';

import '../Widgets/items_card.dart';

Future<void> getItemsFromApi() async {
  try {
    Response response = await get(Uri.parse(api_login));
    List<dynamic> rawDataList = jsonDecode(response.body);
    List<Item> itemList = rawDataList.map((data) {
      return Item(
        // userId: data['userId'],
        // id: data['id'],
        itemImage: data['itemImage'],
        category: data['category'],
        itemName: data['itemName'],
        description: data['description'],
        postedDateString: data['postedDate'],
      );
    }).toList();
  } catch (e) {
    if (kDebugMode) {
      print("The problem is $e");
    }
  }
}


Future<void> sendItemToApi(Item newItem) async {
  try {
    Map<String, dynamic> itemData = {
      // 'userId': newItem.userId,
      // 'id': newItem.id,
      'itemImage': newItem.itemImage,
      'category': newItem.category,
      'itemName': newItem.itemName,
      'description': newItem.description,
      'postedDate': newItem.postedDate.toIso8601String(), // Convert DateTime to a string
    };
    String itemJson = jsonEncode(itemData);

    // Make the POST request
    Response response = await post(
      Uri.parse(api_login),
      headers: {'Content-Type': 'application/json'},
      body: itemJson,
    );

    if (response.statusCode == 200) {
      ShowToastMessage().showToast("Item Added successfully");
    } else {
      print("Failed to add item. Status code: ${response.statusCode}");
    }
  } catch (e) {
    if (kDebugMode) {
      print("The problem is $e");
    }
  }
}
