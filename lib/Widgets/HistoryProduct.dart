import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryProduct extends StatelessWidget {
  final bool isEditable;
  final dynamic item;

  const HistoryProduct({Key? key, required this.isEditable, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue,
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 4.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0,0.0,0.0,0.0),
        child: Container(
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Image.asset(item.itemImage, width: 100, height: 100,)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text(item.itemName), Text(item.description)],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: activeButtonClicked(), child: const Text("Active"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  activeButtonClicked() {}
}
