import 'package:flutter/material.dart';
import 'package:giwe_away/Widgets/items_card.dart';
import 'package:giwe_away/Widgets/main_widgets.dart';
import 'create_new_item.dart';

class AllItems extends StatefulWidget {
  const AllItems({super.key});

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("All Items")),
        ),
        body: items.isEmpty
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
                              builder: (context) => const CreateNewItem()),
                        );
                      },
                      child: const Text("Add Item"),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ItemTemplate(item: items[index]);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateNewItem()),
                      );
                    },
                    child: const Text("Add Item"),
                  ),
                ],
              ),
      ),
    );
  }
}
