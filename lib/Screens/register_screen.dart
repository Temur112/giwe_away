import 'package:flutter/material.dart';
import 'package:giwe_away/Screens/Login_Screen.dart';
import 'package:giwe_away/Screens/profile_screen.dart';
import '../Widgets/main_widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
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
            const InputField("First Name", 370, 57.5, 10),
            const SizedBox(
              height: 15,
            ),
            const InputField("Last name", 370, 57.5, 10),
            const SizedBox(
              height: 15,
            ),
            const InputField("Phone Number", 370, 57.5, 10),
            const SizedBox(
              height: 15,
            ),
            const InputField("Email", 370, 57.5, 10),
            const SizedBox(
              height: 35,
            ),
            const InputField(
                "Password", 370, 57.5, 10), //need to use other type of widget
            const SizedBox(
              height: 15,
            ),
            const InputField("Confirm Password", 370, 57.5,
                10), //need to use other type of widget
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
}
