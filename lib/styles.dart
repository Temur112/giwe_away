import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle activeButtonPressedStyle = ElevatedButton.styleFrom(
    primary: Colors.blue,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.0),
        bottomLeft: Radius.circular(12.0),
      ),
    ),
    side: BorderSide(color: Colors.white, width: 2.0), // White border for blue background
    minimumSize: Size(120.0, 36.0), // Adjust the minimum width and height
  );

  static ButtonStyle activeButtonUnpressedStyle = ElevatedButton.styleFrom(
    primary: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.0),
        bottomLeft: Radius.circular(12.0),
      ),
    ),
    side: BorderSide(color: Colors.blue, width: 2.0), // Blue border for white background
    minimumSize: Size(120.0, 36.0), // Adjust the minimum width and height
  );

  static ButtonStyle inactiveButtonPressedStyle = ElevatedButton.styleFrom(
    primary: Colors.blue,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(12.0),
        bottomRight: Radius.circular(12.0),
      ),
    ),
    side: BorderSide(color: Colors.white, width: 2.0), // White border for blue background
    minimumSize: Size(120.0, 36.0), // Adjust the minimum width and height
  );

  static ButtonStyle inactiveButtonUnpressedStyle = ElevatedButton.styleFrom(
    primary: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(12.0),
        bottomRight: Radius.circular(12.0),
      ),
    ),
    side: BorderSide(color: Colors.blue, width: 2.0), // Blue border for white background
    minimumSize: Size(120.0, 36.0), // Adjust the minimum width and height
  );
}
