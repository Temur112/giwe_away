import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final double borderRadius;

  const Inputfield(this.label, this.width, this.height, this.borderRadius,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        autocorrect: false,
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
  const MyButton({required this.onPressed, required this.btnName, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(btnName));
  }
}
