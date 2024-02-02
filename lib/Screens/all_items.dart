import 'package:flutter/material.dart';
import 'package:giwe_away/Widgets/items_card.dart';
import 'package:giwe_away/Widgets/main_widgets.dart';
import 'package:giwe_away/constants/api_constants.dart';
import 'package:giwe_away/models/Products.dart';
import 'package:giwe_away/services/requests.dart';
import 'create_new_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:giwe_away/Widgets/bottom_navigation.dart';

class AllItems extends StatefulWidget {
  const AllItems({Key? key}) : super(key: key);

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  var _currentIndex = 1;
  late List<Products> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    try {
      final response = await http.get(Uri.parse(api_allProducts));
      if (mounted) {
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body);

          setState(() {
            products = data.map((json) => Products.fromJson(json)).toList();
            print("products");
            print(products);
            isLoading = false;
          });
        } else {
          throw Exception(
              'Failed to load products Code: ${response.statusCode} Rasponse body: ${response.body}');
        }
      }
    } catch (error) {
      print(error);
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("All Items")),
          ),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : products.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("No item in the list yet"),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateNewItem()),
                              );
                            },
                            child: const Text("Add Item"),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 0.0,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ItemTemplate(item: products[index]);
                      },
                    ),
          bottomNavigationBar: MyBottomNavigationBar(
            selectedIndex: _currentIndex,
            onTabTapped: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          )),
    );
  }
}
