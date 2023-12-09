import 'package:flutter/material.dart';
import 'package:giwe_away/Screens/items_card.dart';

class AllItems extends StatefulWidget {
  const AllItems({super.key});

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  List<Item> items = [
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),
    Item(itemName: "Chess", description: "very good"),

  ];

  Widget itemTemplate(item){
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        children: <Widget>[
          Text(
            item.itemName,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.amber
            ),
          ),
          const SizedBox(height: 6.0,),
          Text(
            item.description,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.amber[200]
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("All Items")),
        ),
        body: ListView(
          children: items.map((item) => itemTemplate(item)).toList(),
        ),
      ),
    );
  }
}
