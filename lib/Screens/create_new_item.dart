// ignore_for_file: library_private_types_in_public_api
import 'dart:ffi';
import "dart:io";
import 'dart:typed_data';
import 'package:giwe_away/models/Products.dart';
import "package:image_picker/image_picker.dart";

import 'package:flutter/material.dart';
import 'package:giwe_away/Widgets/items_card.dart';
import 'package:giwe_away/Widgets/main_widgets.dart';
import 'package:giwe_away/services/requests.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateNewItem extends StatefulWidget {
  const CreateNewItem({Key? key}) : super(key: key);

  @override
  _CreateNewItemState createState() => _CreateNewItemState();
}

class _CreateNewItemState extends State<CreateNewItem> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  String selectedCategory = 'Category 1'; // Initialize with a default category

  Uint8List pickedFile = Uint8List(0);
  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      pickedFile = await pickedImage.readAsBytes();
    }

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Item'),
      ),
      body: SingleChildScrollView(
        // Wrap your widget with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: getImage,
                  child: _image == null
                      ? Container(
                          height: 200,
                          color: Colors.grey[300],
                          child: const Center(child: Icon(Icons.add_a_photo)),
                        )
                      : Image.file(_image!),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                'Item Name:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: itemNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter item name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Category:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedCategory,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedCategory = newValue;
                            });
                          }
                        },
                        items: [
                          'Category 1',
                          'Category 2',
                          'Category 3',
                          'Category 4'
                        ]
                            .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Item Description:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: itemDescriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter item description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_image == null ||
                        selectedCategory == "" ||
                        itemNameController.text == "" ||
                        itemDescriptionController.text == "") {
                      ShowToastMessage().showToast("Something is wrong");
                    } else {
                      Products product = Products(
                          id: 1,
                          name: itemNameController.text,
                          description: itemDescriptionController.text,
                          category: selectedCategory,
                          image: pickedFile,
                          postedDate: DateTime.now());
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      int? id = preferences.getInt("id");
                      if (id != null) {
                        print(product.image);
                        sendItemToApi(product, id);
                      }
                      ;
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item added successfully!'),
                        ),
                      );
                    }
                  },
                  child: const Text('Add Item'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void chooseFromGallery() {
  //   ShowToastMessage().showToast("Image is uploaded");
  // }
}
