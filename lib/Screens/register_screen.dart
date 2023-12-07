import 'package:flutter/material.dart';
import 'package:giwe_away/Screens/login_screen.dart';
import 'package:giwe_away/Screens/profile_screen.dart';
import '../Widgets/main_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login_Screen(),
                    ),
                  );
                },
                btnName: "Register"),
          ],
        ),
      ),
    );
  }

  Future<void> register(
      TextEditingController fn,
      TextEditingController ln,
      TextEditingController pn,
      TextEditingController e,
      TextEditingController p1,
      TextEditingController p2) async {
    const String apiUrl = "http://localhost:8080/api/users";
    Map<String, dynamic> userData = {
      "f_name": fn.text,
      "l_name": ln.text,
      "email": e.text,
      "pass1": p1.text,
      "pass2": p2.text,
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
        print('User registered successfully!');
      } else {
        // Registration failed
        print('Failed to register user: ${response.statusCode}');
      }
    } catch (error) {
      print('Error registering user: $error');
    }
  }
}
