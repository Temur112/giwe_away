import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:giwe_away/Widgets/main_widgets.dart';
import 'package:giwe_away/constants/api_constants.dart';
import 'package:giwe_away/models/Products.dart';
import 'package:http/http.dart' as http;

import '../Widgets/items_card.dart';

Future<void> sendItemToApi(Products product, int id) async {
  try {
    // Map<String, dynamic>productDate = product.toJson();
    print("hello world");

    final response = await http.post(
      Uri.parse(api_addProduct),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
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
