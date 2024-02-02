import 'package:flutter/material.dart';
import '../Widgets/HistoryProduct.dart';
import '../Widgets/items_card.dart';
import '../styles.dart';

class DonationsScreen extends StatefulWidget {
  const DonationsScreen({Key? key}) : super(key: key);

  @override
  State<DonationsScreen> createState() => _DonationsScreenState();
}

class _DonationsScreenState extends State<DonationsScreen> {
  final bool _isEditable = true;
  bool _isActiveButtonActive = true;

  List<Item> donatedItemsList = [
    Item(
      itemImage: "assets/images/bottle.png",
      category: "asdf",
      itemName: "asdga",
      description: "asdgasd",
      postedDateString: "2021-12-12",
      isAvailable: true,
    ),
    Item(
      itemImage: "assets/images/bottle.png",
      category: "asdf",
      itemName: "asdga",
      description: "asdgasd",
      postedDateString: "2021-12-12",
      isAvailable: true,
    ),
    Item(
      itemImage: "assets/images/headphone.png",
      category: "asdf",
      itemName: "asdga",
      description: "asdgasd",
      postedDateString: "2021-12-12",
      isAvailable: false,
    ),
  ];

  List<Item> filteredItemsList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with active items
    filteredItemsList = donatedItemsList.where((item) => item.isAvailable).toList();
  }

  void updateFilteredItemsList() {
    // Update the filtered list based on the active state
    setState(() {
      if (_isActiveButtonActive) {
        // Show items with isAvailable set to true
        filteredItemsList = donatedItemsList.where((item) => item.isAvailable).toList();
      } else {
        // Show items with isAvailable set to false
        filteredItemsList = donatedItemsList.where((item) => !item.isAvailable).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Detect horizontal drag end and update active state accordingly
        if (details.primaryVelocity! > 0) {
          // Swiped to the right
          setState(() {
            _isActiveButtonActive = true;
            updateFilteredItemsList();
          });
        } else if (details.primaryVelocity! < 0) {
          // Swiped to the left
          setState(() {
            _isActiveButtonActive = false;
            updateFilteredItemsList();
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Donations Screen"),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isActiveButtonActive = true;
                        updateFilteredItemsList();
                      });
                    },
                    style: _isActiveButtonActive
                        ? ButtonStyles.activeButtonPressedStyle
                        : ButtonStyles.activeButtonUnpressedStyle,
                    child: const Text("Active"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isActiveButtonActive = false;
                        updateFilteredItemsList();
                      });
                    },
                    style: !_isActiveButtonActive
                        ? ButtonStyles.inactiveButtonPressedStyle
                        : ButtonStyles.inactiveButtonUnpressedStyle,
                    child: const Text("Inactive"),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredItemsList.length,
                  itemBuilder: (context, index) {
                    return HistoryProduct(
                      item: filteredItemsList[index],
                      isEditable: _isEditable,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
