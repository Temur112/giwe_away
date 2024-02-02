import 'package:flutter/material.dart';
import 'package:giwe_away/Widgets/items_card.dart';
import 'package:giwe_away/Widgets/main_widgets.dart';
import '../Widgets/bottom_navigation.dart';
import 'create_new_item.dart';

class AllItems extends StatefulWidget {
  const AllItems({Key? key}) : super(key: key);

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  int _currentIndex = 1;
  List<Item> items = [];

  Widget buildItemList() {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("No item in the list yet"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateNewItem(),
                  ),
                );
              },
              child: const Text("Add Item"),
            ),
          ],
        ),
      );
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemTemplate(item: items[index]);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Items"),
      ),
      body: Center(
        child: buildItemList(),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _currentIndex,
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
