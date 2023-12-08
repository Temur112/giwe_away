import 'package:flutter/material.dart';
import 'package:giwe_away/Screens/login_screen.dart';
import 'package:giwe_away/Screens/profile_screen.dart';
import 'package:giwe_away/constants/api_constants.dart';
import '../Widgets/main_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:giwe_away/validations/validations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();

  String errorMsg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("registration page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMsg),
            const SizedBox(height: 20),
            InputField("First Name", 370, 57.5, 10, firstName),
            const SizedBox(
              height: 15,
            ),
            InputField("Last name", 370, 57.5, 10, lastName),
            const SizedBox(
              height: 15,
            ),
            InputField("Phone Number", 370, 57.5, 10, phoneNumber),
            const SizedBox(
              height: 15,
            ),
            InputField("Email", 370, 57.5, 10, email),
            const SizedBox(
              height: 35,
            ),
            InputField("Password", 370, 57.5, 10,
                password1), //need to use other type of widget
            const SizedBox(
              height: 15,
            ),
            InputField("Confirm Password", 370, 57.5, 10,
                password2), //need to use other type of widget
            const SizedBox(
              height: 25,
            ),
            MyButton(
                onPressed: () {
                  register(firstName, lastName, phoneNumber, email, password1,
                      password2);
                },
                btnName: "Register"),
          ],
        ),
      ),
    );
  }

  bool isRegistered = false;

  Future<void> register(
      TextEditingController fn,
      TextEditingController ln,
      TextEditingController pn,
      TextEditingController e,
      TextEditingController p1,
      TextEditingController p2) async {
    const String apiUrl = api_register;

    Map<String, dynamic> userData = {
      "f_name": fn.text,
      "l_name": ln.text,
      "email": e.text,
      "password": p1.text,
      "pass2": p2.text,
      "address": "default address",
    };

    if (doesMatch(p1.text, p2.text) &&
        isStrong(p1.text) &&
        isEmailValid(e.text)) {
      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(userData),
        );
        if (response.statusCode == 201) {
          // Registration successful
          print('User registered successfully!');
          isRegistered = true;
        } else {
          // Registration failed
          print('Failed to register user: ${response.statusCode}');
        }
      } catch (error) {
        print('Error registering user: $error');
      }
    } else {}
    goLogin();
  }

  void goLogin() {
    if (isRegistered) {
      Navigator.pushNamed(context, '/login');
    } else {
      setState(() {
        errorMsg = "Something is wrong trya again";
      });
    }
  }
}
