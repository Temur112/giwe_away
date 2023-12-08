import 'package:flutter/material.dart';
import 'package:giwe_away/Screens/all_items.dart';
import 'package:giwe_away/Screens/profile_screen.dart';
import '../Widgets/main_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:giwe_away/constants/api_constants.dart';

class Login_Screen extends StatefulWidget {
  Login_Screen({super.key});

  _Login_Screen createState() => _Login_Screen();
}

class _Login_Screen extends State<Login_Screen> {
  final TextEditingController loginusrn = TextEditingController();
  final TextEditingController loginpswd = TextEditingController();
  String errorMsg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMsg),
            const SizedBox(
              height: 25,
            ),
            InputField("Email", 370, 57.5, 10, loginusrn),
            const SizedBox(
              height: 25,
            ),
            InputField("Password", 370, 57.5, 10, loginpswd),
            const SizedBox(
              height: 25,
            ),
            MyButton(
                onPressed: () {
                  loginCall(loginusrn.text, loginpswd.text);
                },
                btnName: "Login"),
          ],
        ),
      ),
    );
  }

  bool logedIn = false;

  void loginCall(String e, String p) async {
    const String apiUrl = api_login;

    Map<String, dynamic> userData = {
      "email": e,
      "password": p,
      "address": "default address",
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userData),
      );
      if (response.statusCode == 200) {
        // Registration successful
        print('login successfull');
        logedIn = true;
      } else {
        // Registration failed
        print('Failed to login user: ${response.statusCode}');
      }
    } catch (error) {
      print('Error registering user: $error');
    }

    if (logedIn) {
      goUserProfile();
    } else {
      setState(() {
        errorMsg = "Enter valid credientials";
      });
    }
  }

  goUserProfile() {
    Navigator.pushNamed(context, "/profile");
    Navigator.popUntil(context, ModalRoute.withName('/profile'));
  }
}
