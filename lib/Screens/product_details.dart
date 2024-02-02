import 'package:flutter/material.dart';
import 'package:giwe_away/Widgets/items_card.dart';
import 'package:giwe_away/Widgets/main_widgets.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Item")),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/bottle.png"),
                const Text("Bottle"),
                const Text(maxLines: 3, "adf"),
                const Text("Address"),
                const Text("Mirzo Ulug'bek, Toshkent"),
                ElevatedButton(
                    onPressed: requestItem, child: const Text("Request")),
                const Text("Relevant Products"),
                buildRelevantProductsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRelevantProductsGrid() {
    List<Item> relevantProducts = [
      Item(
        itemImage: "assets/images/bottle.png",
        category: "book",
        itemName: "Chess",
        description: "very good",
        postedDateString: '"2023-01-19"',
        isAvailable: true
      ),
      Item(
        itemImage: "assets/images/headphone.png",
        category: "electronics",
        itemName: "Headphones",
        description: "excellent quality",
        postedDateString: '"2023-01-19"',
        isAvailable: false
      ),
      Item(
        itemImage: "assets/images/watch.png",
        category: "fashion",
        itemName: "Wristwatch",
        description: "stylish design",
        postedDateString: '"2023-01-19"',
        isAvailable: true
      ),
    ];

    return SizedBox(
      height: 150,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // Adjust the maximum extent as needed
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: relevantProducts.length,
        itemBuilder: (context, index) {
          final currentProduct = relevantProducts[index];
          print("Debug: Displaying item at index $index - ${currentProduct.itemName}");
          return ItemTemplate(item: currentProduct);
        },
      ),
    );
  }

  void requestItem() {}
}
