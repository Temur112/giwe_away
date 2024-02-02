import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controllerName;
  final double width;
  final double height;
  final double borderRadius;

  const InputField(this.label, this.width, this.height, this.borderRadius,
      this.controllerName,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        autocorrect: false,
        controller: controllerName,
        decoration: (InputDecoration(
            hintText: label,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius)))),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnName;
  final Key? key;

  const MyButton({
    this.key,
    required this.onPressed,
    required this.btnName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.orangeAccent,
      ),
      child: Text(btnName),
    );
  }
}

class ItemTemplate extends StatelessWidget {
  final dynamic item;

  const ItemTemplate({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue,
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 4.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Image.asset(
                item.itemImage,
                height: 100,
                width: 70,
              ),
              Column(
                children: [
                  Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis, // Handle text overflow
                  ),
                  Text(
                    item.category,
                    style: const TextStyle(fontSize: 18.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          Text(
            item.itemName,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.amber,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            DateFormat('yyyy-MM-dd').format(item.postedDate),
            style: TextStyle(
              fontSize: 8.0,
              color: Colors.amber[200],
            ),
          )
        ],
      ),
    );
  }
}


class ShowToastMessage {
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
}}

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  CustomPageRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
